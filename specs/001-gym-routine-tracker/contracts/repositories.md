# Contratos — Interfaces de Repositorio

Feature: Seguimiento de Rutinas de Gimnasio | Branch: `001-gym-routine-tracker`

> **Nota de alcance**: v1 no expone ninguna interfaz externa (no hay API REST, ni CLI, ni backend).
> El "contrato" relevante de esta app es (a) las **interfaces de repositorio** entre la capa de
> datos (drift) y el resto de la app, y (b) las **reglas de dominio** puras (ver `domain-rules.md`).
> Las firmas están en pseudo-Dart; los tipos de dominio corresponden a `data-model.md`.

Cada repositorio recibe/impone el `ownerUserId` del usuario activo — ninguna query cruza datos de
otro usuario (Principio VII, listo para cuando exista más de uno).

---

## ExerciseRepository (biblioteca — US3)

```dart
abstract class ExerciseRepository {
  // Biblioteca activa: excluye archivados (isArchived = 1) por defecto.
  Future<List<Exercise>> getAll(String ownerUserId);

  // Filtros FR-002 (equipo y/o músculo). Ambos opcionales; combinables. Excluye archivados.
  Future<List<Exercise>> filter(String ownerUserId, {EquipmentType? equipment, String? muscle});

  Future<Exercise> getById(String id); // resuelve incluso archivados (para mostrar historial)
  Future<void> upsert(Exercise exercise);

  // Soft-delete (isArchived=1) si está referenciado en el historial; hard-delete si no lo está
  // (ver data-model, regla 3).
  Future<void> archive(String id);

  // FR-003 / FR-016
  Future<List<Exercise>> getSubstitutes(String exerciseId);
  Future<void> setSubstitutes(String exerciseId, List<String> substituteIds);

  // FR-004 — derivado del historial (existe algún SessionExerciseLog performed = ejercicio).
  Future<Set<String>> getTriedExerciseIds(String ownerUserId);

  // FR-027 — calificar un ejercicio (like/neutral/dislike o null = sin calificar). Se guarda en v1;
  // ordenar sustitutos por calificación (FR-026) es v1.1.
  Future<void> setRating(String exerciseId, ExerciseRating? rating);
}
```

---

## DayTypeRepository (tipos de día — US1)

```dart
abstract class DayTypeRepository {
  Future<List<DayType>> getAll(String ownerUserId);
  Future<DayType> getById(String id);
  Future<void> upsert(DayType dayType);

  // Ejercicios ordenados de un tipo de día, con su rango objetivo (FR-005/FR-012).
  Future<List<DayTypeExercise>> getExercises(String dayTypeId);
  Future<void> setExercises(String dayTypeId, List<DayTypeExercise> ordered);
}
```

---

## RoutinePatternRepository (patrón + anulaciones — US1/US4)

```dart
abstract class RoutinePatternRepository {
  Future<RoutinePattern?> getActive(String ownerUserId);

  // Reemplaza el patrón activo (cambio de modo semanal<->cíclico, FR-010).
  // No borra WorkoutSession históricas.
  Future<void> saveWeekly(String ownerUserId, Map<int, String> dayOfWeekToDayTypeId);
  Future<void> saveCyclic(String ownerUserId, List<String> orderedDayTypeIds);

  // Avanza cyclicPosition SOLO tras finalizar sesión (FR-010). Idempotente por sesión.
  Future<void> advanceCyclicPosition(String ownerUserId);

  // Anulaciones puntuales (FR-008/FR-009, Principio IX) — nunca tocan el patrón.
  Future<DayOverride?> getOverrideForDate(String ownerUserId, String isoDate);
  Future<void> setOverride(DayOverride override);
  Future<void> clearOverride(String ownerUserId, String isoDate);
}
```

---

## SessionRepository (sesiones + historial — US1/US2, Principio VIII)

```dart
abstract class SessionRepository {
  // Reanudación tras cierre inesperado (FR-024): la sesión inProgress, si existe.
  Future<WorkoutSession?> getInProgress(String ownerUserId);

  Future<WorkoutSession> startSession(String ownerUserId, String dayTypeId);

  // Autosave: persiste la serie apenas se registra (FR-024). Dentro de transacción.
  Future<void> logSet(SetLog set);
  Future<void> updateNotes(String sessionExerciseLogId, String? notes);

  // Reemplazo por sustituto en sesión (FR-016) — no altera el DayType.
  Future<void> replaceExercise(String sessionExerciseLogId, String newPerformedExerciseId);

  // Finaliza: status -> finished, endedAt, durationSeconds. En transacción.
  Future<void> finishSession(String sessionId, int durationSeconds);

  // Historial completo ordenado por fecha (FR-019).
  Future<List<WorkoutSession>> getHistory(String ownerUserId);
  Future<WorkoutSession> getSessionDetail(String sessionId);

  // "La última vez" de este ejercicio en este tipo de día (FR-013) -> alimenta la sugerencia.
  Future<List<SetLog>> getLastSetsFor(String ownerUserId, String dayTypeId, String exerciseId);
}
```

---

## ProgressRepository (gráficas — US2, FR-020)

```dart
abstract class ProgressRepository {
  // Serie temporal de peso máximo por sesión, para un ejercicio.
  Future<List<ProgressPoint>> maxWeightOverTime(String ownerUserId, String exerciseId);

  // Serie temporal de volumen total (Σ peso×reps por sesión), para un ejercicio.
  Future<List<ProgressPoint>> totalVolumeOverTime(String ownerUserId, String exerciseId);
}

// ProgressPoint: { DateTime sessionDate; double value; }
```

Todos los repositorios se testean con drift **en memoria** (`NativeDatabase.memory()`), sin tocar
disco ni red (Principio II).
