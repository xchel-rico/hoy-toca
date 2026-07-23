# Implementation Plan: Seguimiento de Rutinas de Gimnasio

**Branch**: `001-gym-routine-tracker` | **Date**: 2026-07-21 | **Spec**: [spec.md](./spec.md)

**Input**: Feature specification from `/specs/001-gym-routine-tracker/spec.md`

## Summary

App móvil Flutter, **local-first y sin nube en v1**, para llevar rutinas de gimnasio: biblioteca de
ejercicios (con equipo, músculo y sustitutos), organización en "tipos de día" y un patrón activo
(semanal **o** cíclico, uno a la vez), registro de sesiones con sugerencia de sobrecarga
progresiva, cronómetro, temporizador de descanso con notificación, historial y gráficas de
progreso. Todos los datos viven en SQLite en el dispositivo (fuente única de verdad); el modelo se
diseña **listo para multi-usuario y sync** (cada entidad con `ownerUserId` y UUID estable) pero
Firebase/auth/sync/compartir quedan diferidos a versiones futuras (COULD HAVE en el spec).

## Technical Context

**Language/Version**: Dart 3.x sobre Flutter (canal stable, 3.x)

**Primary Dependencies** (todas justificadas contra el Principio III — ver `research.md`):
- `flutter_riverpod` — gestión de estado (elegida por el usuario; testeable, Principio II)
- `drift` (+ `sqlite3_flutter_libs`) — SQLite tipado con migraciones versionadas (elegida por el
  usuario; soporta integridad de datos, Principio VIII)
- `flutter_local_notifications` — notificación de fin de descanso incluso en segundo plano (FR-018)
- `fl_chart` — gráficas de progreso (FR-020)
- `uuid` — generación de IDs estables para PKs (sync-readiness, Principio VI)
- Dev: `drift_dev`, `build_runner` (codegen de drift), `flutter_test`, `mocktail`

**Storage**: SQLite local vía drift. Fuente única de verdad. **Sin backend en la nube en v1.**

**Testing**: `flutter_test` para unit tests (lógica de dominio pura: sobrecarga progresiva,
avance de ciclo) y widget tests; drift en memoria (`NativeDatabase.memory()`) para tests de
repositorios/DAOs sin tocar disco.

**Target Platform**: Android (objetivo primario; minSdk API 24 / Android 7.0). Flutter mantiene la
puerta abierta a iOS a futuro sin reescritura (no se implementa iOS en v1).

**Project Type**: Aplicación móvil única (Flutter). Sin backend propio.

**Performance Goals**: UI fluida a 60 fps; operaciones locales (ver día de hoy, guardar serie,
abrir historial) percibidas como instantáneas (<100 ms para volúmenes típicos).

**Constraints**:
- Operaciones core funcionan **sin conexión** (FR-021).
- **Autosave incremental + reanudación** de sesión activa (FR-024): cada serie se persiste apenas
  se ingresa; sesión con estado `en progreso` recuperable tras cierre inesperado.
- Ningún dato de progreso se pierde ni corrompe (Principio VIII, NON-NEGOTIABLE).

**Scale/Scope**: 1 usuario real en v1 (esquema multi-usuario listo). Volumen esperado: decenas a
cientos de ejercicios, miles de sesiones acumuladas en años — trivial para SQLite. ~10–15 pantallas.

## Constitution Check

*GATE: Debe pasar antes de Phase 0. Re-evaluado tras Phase 1 (ver final de sección).*

| Principio | Cómo lo cumple este plan |
|-----------|--------------------------|
| **I. Simplicidad & legibilidad** | Estructura por capas simple (data / domain / application / presentation). Riverpod y drift elegidos por el usuario; la lógica no trivial (sobrecarga, ciclo) se aísla en funciones puras y documentadas. |
| **II. Test básico antes de done** | `flutter_test` configurado desde Phase 1. FR-014 (sobrecarga) y FR-010 (avance de ciclo) son funciones puras → primeros objetivos de test. Repos testeados con DB en memoria. |
| **III. Dependencias mínimas** | Solo 5 deps de runtime, cada una justificada en `research.md` porque reimplementarlas (SQLite tipado, notificaciones OS, charts) excede el alcance. **Firebase NO se agrega en v1.** |
| **IV. Documentar decisiones** | `research.md` registra cada elección (storage, estado, notifs) con Decisión/Razón/Alternativas. |
| **V. Local-first** | SQLite en dispositivo = fuente única de verdad. Cero dependencia de red para operaciones core. Nube diferida. |
| **VI. Modelo multi-usuario** | **Decisión de v1** (aunque haya un solo usuario): toda entidad lleva `ownerUserId` + PK UUID estable, evitando colisiones en una futura fusión entre dispositivos. Una fila `User` local por defecto. |
| **VII. Aislamiento & compartir explícito** | v1 no comparte nada; todos los datos son privados por diseño. `ownerUserId` deja el aislamiento listo para cuando se agregue compartir (opt-in). |
| **VIII. Integridad de progreso (NON-NEGOTIABLE)** | Escrituras de sesión/serie en **transacciones** drift; migraciones **versionadas que nunca descartan datos de usuario**; autosave/resume (FR-024) como mecanismo concreto de resiliencia ante cierres. |
| **IX. Anulaciones no destructivas** | `DayOverride` es una fila por fecha independiente; nunca muta `RoutinePattern`. El cálculo del "día de hoy" aplica la anulación solo a esa fecha (FR-008/FR-009). |

**Preparación Play Store**: permiso `POST_NOTIFICATIONS` (Android 13+) es el único permiso sensible,
estrictamente necesario para FR-018 (mínimo privilegio). Datos de fitness (peso) permanecen locales;
la futura política de privacidad podrá declarar "datos solo en el dispositivo" en v1.

**Resultado del gate (inicial)**: ✅ PASA. Sin violaciones. Sin `NEEDS CLARIFICATION` pendientes.

**Re-evaluación post-Phase 1**: ✅ PASA. El diseño de `data-model.md` confirma `ownerUserId` + UUID
en todas las entidades, estado `en progreso/finalizada` en `WorkoutSession`, y `peso` nullable solo
para equipo peso corporal. No se introdujeron dependencias ni violaciones nuevas. Sin entradas en
Complexity Tracking.

## Project Structure

### Documentation (this feature)

```text
specs/001-gym-routine-tracker/
├── plan.md              # Este archivo (/speckit-plan)
├── spec.md              # Especificación de la feature
├── research.md          # Phase 0 — decisiones técnicas
├── data-model.md        # Phase 1 — entidades, campos, reglas
├── quickstart.md        # Phase 1 — guía de validación end-to-end
├── contracts/           # Phase 1 — contratos de repositorios y reglas de dominio
│   ├── repositories.md
│   └── domain-rules.md
├── checklists/
│   └── requirements.md  # Checklist de calidad del spec (ya generado)
└── tasks.md             # Phase 2 (/speckit-tasks — NO lo crea /speckit-plan)
```

### Source Code (repository root)

```text
lib/
├── main.dart                    # Entry point; inicializa DB y ProviderScope
├── core/                        # Constantes, tema, utilidades, tipos compartidos
│   ├── enums.dart               # EquipmentType, PatternMode, SessionStatus, ...
│   └── result.dart              # (si aplica) manejo de errores simple
├── data/
│   ├── database/                # drift: tablas, DAOs, migraciones
│   │   ├── app_database.dart
│   │   ├── tables/              # Un archivo por tabla (Exercises, DayTypes, ...)
│   │   └── daos/                # DAOs por agregado
│   └── repositories/            # Implementaciones de los contratos de repositorio
├── domain/
│   ├── entities/                # Modelos de dominio planos (mapeados desde drift)
│   └── logic/                   # Funciones puras y testeables:
│       ├── progressive_overload.dart   # FR-014
│       └── cycle_advancement.dart      # FR-010
├── application/                 # Providers/Notifiers de Riverpod (estado de UI)
└── presentation/
    ├── screens/                 # Una carpeta por flujo (biblioteca, sesión, historial, ...)
    └── widgets/                 # Widgets reutilizables (cronómetro, timer de descanso, ...)

test/
├── unit/                        # Tests de domain/logic (sobrecarga, avance de ciclo)
├── data/                        # Tests de repositorios con drift en memoria
└── widget/                      # Widget tests de pantallas clave

android/                         # Config nativa (permisos mínimos, minSdk)
```

**Structure Decision**: App Flutter única con capas `data → domain → application → presentation`.
Se prefiere esta separación ligera (en vez de feature-first más elaborado) por el Principio I: es
fácil de explicar y navegar para un primer proyecto, y aísla la lógica de negocio no trivial en
`domain/logic/` como funciones puras — el lugar natural para los primeros tests (Principio II).

## Complexity Tracking

> Sin violaciones a la constitución. No se requiere justificar complejidad adicional.

_(Sección intencionalmente vacía — el Constitution Check pasó sin excepciones.)_
