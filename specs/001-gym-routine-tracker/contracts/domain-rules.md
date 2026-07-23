# Contratos — Reglas de Dominio (funciones puras)

Feature: Seguimiento de Rutinas de Gimnasio | Branch: `001-gym-routine-tracker`

Estas son las dos reglas algorítmicas del núcleo. Se implementan como **funciones puras** en
`lib/domain/logic/` (sin UI ni DB) y son los **primeros objetivos de test** (Principio II). Los
casos listados abajo son el contrato de comportamiento que los tests deben verificar.

---

## R1. Sobrecarga progresiva — `suggestProgression` (FR-014, FR-025)

**Entrada**: los `SetLog` de la **última vez** que se hizo este ejercicio en el mismo tipo de día
(puede estar vacía) + el rango objetivo (`targetRepMin`, `targetRepMax`) + si el ejercicio es de
peso corporal.

**Salida**: una sugerencia = `{ action: increaseWeight | increaseReps | none, message }`.

```dart
enum ProgressionAction { increaseWeight, increaseReps, none }

class ProgressionSuggestion {
  final ProgressionAction action;
  final String message; // texto para la UI
}

ProgressionSuggestion suggestProgression({
  required List<SetLog> lastSessionSets, // vacío si es la primera vez
  required int targetRepMax,
  required bool isBodyweight,
});
```

**Reglas / casos de test**:

| # | Situación | Resultado esperado |
|---|-----------|--------------------|
| 1 | `lastSessionSets` vacío (primera vez que se hace el ejercicio en ese tipo de día) | `action = none` (sin sugerencia; campos "última vez" vacíos — Edge Case del spec) |
| 2 | TODAS las series alcanzaron `targetRepMax` en reps | `action = increaseWeight` (subir peso la próxima) |
| 3 | Al menos una serie quedó por debajo de `targetRepMax` | `action = increaseReps` (mantener peso, apuntar a más reps hasta el máximo) |
| 4 | `isBodyweight = true` y todas al máximo | `action = increaseReps` **basado solo en reps** (no hay peso que subir; FR-025) |
| 5 | Reps exactamente iguales a `targetRepMax` en todas | cuenta como "alcanzó el máximo" → caso 2 (o 4 si bodyweight) |

Función determinista, sin efectos secundarios → test unitario directo con listas de entrada.

**Nota sobre `setType` (campo inerte en v1)**: `SetLog.setType` existe en el esquema pero no se usa
en v1 (ver `data-model.md` › Campos inertes). En v1 esta función recibe **todas** las series como de
trabajo. Cuando `setType` se implemente en el futuro, la entrada `lastSessionSets` deberá filtrarse
a solo las series `working` antes de aplicar R1 (las de `warmup`/`dropset`/etc. no cuentan para
decidir si subir peso).

---

## R2. Resolución del día de hoy + avance de ciclo (FR-007, FR-008, FR-009, FR-010, Principio IX)

Dos funciones puras relacionadas:

### R2a. `resolveDayTypeForDate` — qué tipo de día toca en una fecha

```dart
// Devuelve el DayType a sugerir para 'date', respetando anulaciones.
String resolveDayTypeIdForDate({
  required DateTime date,
  required RoutinePattern pattern,          // weekly o cyclic
  required DayOverride? overrideForDate,    // null si no hay
});
```

**Reglas / casos de test**:

| # | Situación | Resultado esperado |
|---|-----------|--------------------|
| 1 | Hay `overrideForDate` para esa fecha | Devuelve el `dayTypeId` del override (aplica solo a esa fecha) |
| 2 | Sin override, modo `weekly` | Devuelve el `dayTypeId` del slot cuyo `dayOfWeek` = día de la semana de `date` |
| 3 | Sin override, modo `cyclic` | Devuelve el `dayTypeId` del slot en `pattern.cyclicPosition` |
| 4 | Un override de una fecha pasada NO afecta la misma fecha de la semana siguiente | Semana siguiente → resultado del patrón base, sin rastro del override (FR-009) |

### R2b. `nextCyclicPosition` — avance del ciclo al finalizar una sesión (FR-010)

```dart
// El ciclo avanza SOLO cuando el usuario completa una sesión; espera si no entrena.
int nextCyclicPosition({
  required int currentPosition,
  required int cycleLength, // cantidad de CyclicPatternSlot
});
```

**Reglas / casos de test**:

| # | Situación | Resultado esperado |
|---|-----------|--------------------|
| 1 | Se finaliza una sesión en modo cíclico | `(currentPosition + 1) % cycleLength` (avanza y hace wrap al final) |
| 2 | El usuario NO entrena en un día | La posición **no** cambia (esta función no se llama; el día siguiente sigue mostrando el mismo slot pendiente) — verificado a nivel de integración/repositorio |
| 3 | `currentPosition` es el último del ciclo | Vuelve a `0` (reinicia el ciclo) |

**Nota de diseño**: separar "qué toca hoy" (R2a, consulta) de "avanzar el ciclo" (R2b, efecto al
finalizar sesión) es lo que garantiza el comportamiento "el ciclo espera, no se salta" (FR-010,
respuesta de clarificación) y mantiene las anulaciones no destructivas (Principio IX).
