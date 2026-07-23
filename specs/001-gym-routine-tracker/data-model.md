# Phase 1 — Modelo de Datos

Feature: Seguimiento de Rutinas de Gimnasio | Branch: `001-gym-routine-tracker` | Date: 2026-07-21

Almacén: SQLite local vía drift. **Convenciones globales** (aplican a TODAS las tablas, por
Principios V/VI/VIII — ver `research.md` D5):

- `id`: **TEXT, PK, UUID v4** (estable, sync-friendly).
- `ownerUserId`: **TEXT, FK → User.id, NOT NULL**. Aísla los datos por usuario desde v1.
- `createdAt`, `updatedAt`: **INTEGER (epoch ms UTC), NOT NULL**. Preparan una futura fusión/sync.
- Claves foráneas con integridad referencial activada (`PRAGMA foreign_keys = ON`).
- Borrados que afectan progreso se tratan con cuidado (ver "Reglas de integridad" al final).

---

## Entidades

### User
Propietario de todos los datos. En v1 se crea **una sola fila local** al primer arranque.

| Campo | Tipo | Reglas |
|-------|------|--------|
| id | TEXT PK (UUID) | |
| displayName | TEXT | NOT NULL; default "Yo" |
| createdAt / updatedAt | INTEGER | NOT NULL |

---

### Exercise
Un ejercicio de la biblioteca. (FR-001, FR-003, FR-004, FR-023)

| Campo | Tipo | Reglas |
|-------|------|--------|
| id | TEXT PK (UUID) | |
| ownerUserId | TEXT FK → User | NOT NULL |
| name | TEXT | NOT NULL, no vacío |
| equipmentType | TEXT (enum) | NOT NULL. Uno de: `machine`, `cable`, `dumbbell`, `barbell`, `bodyweight` |
| primaryMuscle | TEXT | NOT NULL, no vacío |
| externalGuideUrl | TEXT | **NULLABLE** (campo listo para FR-023 v1.1; puede quedar vacío en v1) |
| rating | TEXT (enum) | **NULLABLE** (sin calificar por defecto). Uno de: `like`, `neutral`, `dislike`. Se **almacena y edita en v1**; ordenar sustitutos por calificación (FR-026) es v1.1 — el dato ya está para no requerir migración |
| isArchived | INTEGER (bool) | NOT NULL, default 0. **Soft-delete** (ver regla 3): un ejercicio con historial no se borra físicamente, se archiva (sale de la biblioteca activa, el historial queda intacto) |
| createdAt / updatedAt | INTEGER | NOT NULL |

- "Ya probado" (FR-004) es **derivado**, no un campo: `true` si existe algún `SessionExerciseLog`
  del owner con `performedExerciseId = exercise.id`. Ver `contracts/repositories.md`.

---

### ExerciseSubstitute
Relación N:N entre ejercicios equivalentes/sustitutos. (FR-003, FR-016)

| Campo | Tipo | Reglas |
|-------|------|--------|
| id | TEXT PK (UUID) | |
| ownerUserId | TEXT FK → User | NOT NULL |
| exerciseId | TEXT FK → Exercise | NOT NULL |
| substituteExerciseId | TEXT FK → Exercise | NOT NULL; `!= exerciseId` |
| createdAt / updatedAt | INTEGER | NOT NULL |

- UNIQUE (`exerciseId`, `substituteExerciseId`). La relación se trata como **simétrica** a nivel de
  lógica: si A→B, la app también ofrece B←A (la implementación puede guardar ambos sentidos o
  consultar en ambas direcciones; decisión documentada en el repo).

---

### DayType
Un "tipo de día" (ej. "pierna", "descanso"). (FR-005, FR-011)

| Campo | Tipo | Reglas |
|-------|------|--------|
| id | TEXT PK (UUID) | |
| ownerUserId | TEXT FK → User | NOT NULL |
| name | TEXT | NOT NULL, no vacío |
| isRest | INTEGER (bool) | NOT NULL, default 0. Si `true`, no tiene ejercicios asociados |
| createdAt / updatedAt | INTEGER | NOT NULL |

---

### DayTypeExercise
Ejercicio dentro de un tipo de día, con orden y rango objetivo de repeticiones. (FR-005, FR-012, FR-014)

| Campo | Tipo | Reglas |
|-------|------|--------|
| id | TEXT PK (UUID) | |
| ownerUserId | TEXT FK → User | NOT NULL |
| dayTypeId | TEXT FK → DayType | NOT NULL |
| exerciseId | TEXT FK → Exercise | NOT NULL |
| position | INTEGER | NOT NULL. Orden dentro del tipo de día (0-based) |
| targetRepMin | INTEGER | NOT NULL, ≥ 1 |
| targetRepMax | INTEGER | NOT NULL, ≥ targetRepMin |
| supersetGroupId | TEXT | **NULLABLE**, **inerte en v1** (se almacena, sin UI ni lógica). Ejercicios con el mismo `supersetGroupId` dentro del mismo tipo de día formarían una superserie (sin descanso entre ellos). Preparado para versiones futuras |
| createdAt / updatedAt | INTEGER | NOT NULL |

- UNIQUE (`dayTypeId`, `position`). Solo tipos de día con `isRest = false` tienen filas aquí.

---

### RoutinePattern
El **único patrón activo** del usuario (semanal o cíclico, nunca ambos). (FR-006, FR-007, FR-010)

| Campo | Tipo | Reglas |
|-------|------|--------|
| id | TEXT PK (UUID) | |
| ownerUserId | TEXT FK → User | NOT NULL; **UNIQUE** (un patrón activo por usuario en v1) |
| mode | TEXT (enum) | NOT NULL. `weekly` o `cyclic` |
| cyclicPosition | INTEGER | NULLABLE. Solo en modo `cyclic`: índice del próximo slot pendiente. Avanza **solo al finalizar una sesión** (FR-010) |
| createdAt / updatedAt | INTEGER | NOT NULL |

Slots del patrón en dos tablas hijas según el modo:

**WeeklyPatternSlot** (modo semanal — un tipo de día por día de la semana)

| Campo | Tipo | Reglas |
|-------|------|--------|
| id | TEXT PK (UUID) | |
| patternId | TEXT FK → RoutinePattern | NOT NULL |
| dayOfWeek | INTEGER | NOT NULL, 1–7 (1=lunes). UNIQUE (`patternId`, `dayOfWeek`) |
| dayTypeId | TEXT FK → DayType | NOT NULL (puede apuntar a un DayType de descanso) |

**CyclicPatternSlot** (modo cíclico — secuencia ordenada de tipos de día)

| Campo | Tipo | Reglas |
|-------|------|--------|
| id | TEXT PK (UUID) | |
| patternId | TEXT FK → RoutinePattern | NOT NULL |
| position | INTEGER | NOT NULL, 0-based. UNIQUE (`patternId`, `position`) |
| dayTypeId | TEXT FK → DayType | NOT NULL (puede ser descanso) |

- Cambiar de modo (FR-010) reemplaza los slots del modo activo; **no borra** `WorkoutSession`
  históricas (el historial persiste bajo su propio `dayTypeId`).

---

### DayOverride
Anulación puntual del tipo de día sugerido para **una fecha concreta**. (FR-008, FR-009, Principio IX)

| Campo | Tipo | Reglas |
|-------|------|--------|
| id | TEXT PK (UUID) | |
| ownerUserId | TEXT FK → User | NOT NULL |
| date | TEXT | NOT NULL, formato `YYYY-MM-DD` (fecha local). UNIQUE (`ownerUserId`, `date`) |
| dayTypeId | TEXT FK → DayType | NOT NULL (puede ser descanso) |
| createdAt / updatedAt | INTEGER | NOT NULL |

- **Nunca** modifica `RoutinePattern` ni sus slots (Principio IX). El cálculo de "qué toca hoy"
  consulta primero si hay override para esa fecha; si no, cae al patrón. Ver `contracts/domain-rules.md`.

---

### WorkoutSession
Una sesión de entrenamiento (en curso o finalizada). (FR-019, FR-024)

| Campo | Tipo | Reglas |
|-------|------|--------|
| id | TEXT PK (UUID) | |
| ownerUserId | TEXT FK → User | NOT NULL |
| dayTypeId | TEXT FK → DayType | NOT NULL. Tipo de día realizado (copia de referencia; ver integridad) |
| status | TEXT (enum) | NOT NULL. `inProgress` o `finished` |
| startedAt | INTEGER | NOT NULL (epoch ms) |
| endedAt | INTEGER | NULLABLE (solo al finalizar) |
| durationSeconds | INTEGER | NULLABLE. Duración total medida por el cronómetro (FR-017) |
| createdAt / updatedAt | INTEGER | NOT NULL |

- **Estado (transiciones)**: `inProgress → finished`. Como máximo una sesión `inProgress` por
  usuario a la vez → habilita reanudar tras cierre inesperado (FR-024).
- Varias sesiones el mismo día se distinguen por `startedAt` (Edge Case del spec).

---

### SessionExerciseLog
Registro de un ejercicio dentro de una sesión (puede ser un sustituto del planeado). (FR-015, FR-016)

| Campo | Tipo | Reglas |
|-------|------|--------|
| id | TEXT PK (UUID) | |
| ownerUserId | TEXT FK → User | NOT NULL |
| sessionId | TEXT FK → WorkoutSession | NOT NULL |
| plannedExerciseId | TEXT FK → Exercise | **NULLABLE**. Ejercicio originalmente planeado (traza) |
| performedExerciseId | TEXT FK → Exercise | NOT NULL. Ejercicio **realmente realizado** |
| position | INTEGER | NOT NULL. Orden dentro de la sesión |
| notes | TEXT | NULLABLE. Notas de texto libre por ejercicio (FR-015) |
| createdAt / updatedAt | INTEGER | NOT NULL |

- Si el usuario reemplaza por un sustituto (FR-016), `performedExerciseId != plannedExerciseId`;
  la definición del `DayType` **no se toca** (el reemplazo vive solo en la sesión).

---

### SetLog
Una serie registrada dentro de un ejercicio de la sesión. (FR-013, FR-025, Principio VIII)

| Campo | Tipo | Reglas |
|-------|------|--------|
| id | TEXT PK (UUID) | |
| ownerUserId | TEXT FK → User | NOT NULL |
| sessionExerciseLogId | TEXT FK → SessionExerciseLog | NOT NULL |
| setNumber | INTEGER | NOT NULL, ≥ 1. Orden de la serie |
| reps | INTEGER | NOT NULL, ≥ 1 |
| weight | REAL | **NULLABLE**. Obligatorio si el equipo del ejercicio ≠ `bodyweight`; opcional (puede ser null o peso extra) si es `bodyweight` (FR-025) |
| setType | TEXT (enum) | **NULLABLE**, **inerte en v1** (se almacena, sin UI ni lógica). Uno de: `warmup`, `working`, `failure`, `dropset`. Preparado para versiones futuras. Ver "Campos inertes de preparación" |
| rpe | INTEGER | **NULLABLE**, **inerte en v1**. Rango 1–10 si está presente (RPE/RIR). Sin UI ni lógica en v1 |
| completedAt | INTEGER | NOT NULL (epoch ms). Se escribe apenas se registra la serie (autosave, FR-024) |
| createdAt / updatedAt | INTEGER | NOT NULL |

---

## Diagrama de relaciones (resumen)

```text
User (1) ──< Exercise ──< ExerciseSubstitute >── Exercise
User (1) ──< DayType ──< DayTypeExercise >── Exercise
User (1) ──< RoutinePattern ──< WeeklyPatternSlot / CyclicPatternSlot >── DayType
User (1) ──< DayOverride >── DayType
User (1) ──< WorkoutSession ──< SessionExerciseLog ──< SetLog
                    │                    └── plannedExercise / performedExercise → Exercise
                    └── DayType
```

## Reglas de integridad y validación (Principio VIII)

1. **Transacciones**: crear/finalizar una sesión y escribir sus series ocurre dentro de
   transacciones drift; una serie registrada nunca queda a medias.
2. **Autosave**: cada `SetLog` se persiste al ingresarse (no se espera a "finalizar"). Una sesión
   `inProgress` es recuperable al reabrir la app (FR-024, SC-005).
3. **Borrado de ejercicios usados en el historial**: **soft-delete confirmado**. Un `Exercise`
   referenciado por algún `SessionExerciseLog` NO se borra físicamente: se marca `isArchived = 1`,
   lo que lo saca de la biblioteca activa (filtros, armado de tipos de día) **conservando intactos**
   los registros históricos que lo referencian (Edge Case del spec, Principio VIII). Un ejercicio
   sin historial sí puede borrarse físicamente si el usuario lo desea.
4. **`weight` según equipo** (FR-025): validado en la capa de dominio antes de escribir — required
   si equipo ≠ `bodyweight`.
5. **Un patrón activo por usuario**: `RoutinePattern.ownerUserId` es UNIQUE (FR-010).
6. **Rangos de repeticiones**: `targetRepMax ≥ targetRepMin ≥ 1` (FR-005/FR-014).
7. **Migraciones**: cualquier cambio de esquema futuro usa el sistema de migraciones versionadas de
   drift y **nunca** descarta datos de usuario (Principio VIII).
8. **`rpe` válido**: si está presente, `1 ≤ rpe ≤ 10` (se valida solo si el campo se llegara a usar;
   en v1 es inerte).

## Campos inertes de preparación (schema-ready, sin uso en v1)

Los siguientes campos existen en el esquema **desde v1** con el único propósito de evitar una
migración futura (Principio VI/VIII). En v1 **no** tienen UI ni lógica que los consuma; se almacenan
como `NULL` por defecto y ningún flujo MUST de v1 depende de ellos. No cambian el alcance MUST ni el
Constitution Check.

| Campo | Entidad | Uso futuro previsto |
|-------|---------|---------------------|
| `setType` | SetLog | Distinguir series de calentamiento / trabajo / fallo / dropset |
| `rpe` | SetLog | Registrar esfuerzo percibido (RPE/RIR) por serie |
| `supersetGroupId` | DayTypeExercise | Agrupar 2+ ejercicios como superserie (sin descanso entre ellos) |

**Interacción con la sobrecarga progresiva (R1, FR-014)**: cuando `setType` se use en el futuro, la
regla debería considerar únicamente las series de tipo `working`. En v1, al ser `setType` inerte
(NULL), la regla trata **todas** las series registradas como de trabajo — comportamiento idéntico al
especificado hoy. Ver nota en `contracts/domain-rules.md`.
