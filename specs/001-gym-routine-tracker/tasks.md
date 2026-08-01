# Tasks: Seguimiento de Rutinas de Gimnasio

**Input**: Design documents from `/specs/001-gym-routine-tracker/`
**Prerequisites**: plan.md, spec.md, research.md, data-model.md, contracts/, quickstart.md (todos presentes)

**Tests**: Por la constitución del proyecto (Principio II — Basic Test Before Done), toda tarea que
implemente una función nueva incluye su test básico como parte de la misma tarea o de la tarea
inmediatamente anterior (no como follow-up separado). Las dos reglas de dominio puras (R1, R2 en
`contracts/domain-rules.md`) son los primeros objetivos de test, señalados en `plan.md`.

**Organization**: Tareas agrupadas por User Story (spec.md) para permitir implementación y prueba
independiente de cada una. US1 es el MVP.

## Format: `[ID] [P?] [Story] Description`

- **[P]**: Puede ejecutarse en paralelo (archivos distintos, sin dependencias pendientes)
- **[Story]**: A qué User Story pertenece (US1–US5)
- Cada tarea incluye la ruta de archivo exacta

## Path Conventions

Proyecto móvil único (Flutter), según `plan.md` › Project Structure:

```text
lib/{core,data,domain,application,presentation}/...
test/{unit,data,widget}/...
android/...
```

---

## Phase 1: Setup (Shared Infrastructure)

**Purpose**: Inicialización del proyecto Flutter

- [X] T001 Crear el esqueleto del proyecto Flutter (`pubspec.yaml` con nombre de app, `lib/`, `test/`,
      `android/`) según la estructura de `plan.md` › Project Structure
- [X] T002 Agregar dependencias runtime y dev a `pubspec.yaml`: `flutter_riverpod`, `drift`,
      `sqlite3_flutter_libs`, `flutter_local_notifications`, `fl_chart`, `uuid`; dev: `drift_dev`,
      `build_runner`, `flutter_test`, `mocktail` (ver `plan.md` › Technical Context)
- [X] T003 [P] Configurar `analysis_options.yaml` (lint rules) en la raíz del proyecto
- [ ] T004 [P] Configurar `android/app/build.gradle` (minSdk 24, applicationId) según `plan.md` ›
      Target Platform
- [ ] T005 [P] Agregar el permiso `POST_NOTIFICATIONS` en
      `android/app/src/main/AndroidManifest.xml` (FR-018; único permiso sensible, mínimo privilegio
      — ver `research.md` D4)

---

## Phase 2: Foundational (Blocking Prerequisites)

**Purpose**: Esquema de base de datos, entidades de dominio y wiring compartido por todas las
User Stories

**⚠️ CRITICAL**: Ninguna User Story puede empezar hasta que esta fase esté completa

- [ ] T006 [P] Definir enums centrales en `lib/core/enums.dart`: `EquipmentType`, `PatternMode`,
      `SessionStatus`, `ExerciseRating`, `SetType` (ver `data-model.md`)
- [ ] T007 [P] Definir tabla drift `Users` en `lib/data/database/tables/users_table.dart`
      (convenciones globales: `id` UUID, `createdAt`/`updatedAt` — ver `data-model.md`)
- [ ] T008 [P] Definir tablas drift `Exercises` + `ExerciseSubstitutes` en
      `lib/data/database/tables/exercises_table.dart` (incluye `rating`, `isArchived`,
      `externalGuideUrl` — FR-001, FR-003, FR-023, FR-027)
- [ ] T009 [P] Definir tablas drift `DayTypes` + `DayTypeExercises` en
      `lib/data/database/tables/day_types_table.dart` (incluye `targetRepMin/Max` y
      `supersetGroupId` inerte — FR-005)
- [ ] T010 [P] Definir tablas drift `RoutinePattern` + `WeeklyPatternSlot` + `CyclicPatternSlot` +
      `DayOverride` en `lib/data/database/tables/routine_pattern_table.dart` (FR-006 a FR-011)
- [ ] T011 [P] Definir tablas drift `WorkoutSession` + `SessionExerciseLog` + `SetLog` en
      `lib/data/database/tables/sessions_table.dart` (incluye `setType`/`rpe` inertes — FR-012 a
      FR-020, FR-024, FR-025)
- [ ] T012 Ensamblar `AppDatabase` en `lib/data/database/app_database.dart` con todas las tablas de
      T007–T011, `schemaVersion = 1` y `PRAGMA foreign_keys = ON` (depende de T007–T011)
- [ ] T013 Implementar el bootstrap de primer arranque (crear la fila `User` local por defecto) en
      `lib/data/database/app_database.dart`, con test básico en
      `test/data/bootstrap_test.dart` (depende de T012)
- [ ] T014 [P] Definir entidades de dominio (clases Dart planas que reflejan las tablas) en
      `lib/domain/entities/`
- [ ] T015 [P] Definir las interfaces de repositorio (clases abstractas) per
      `contracts/repositories.md` en `lib/domain/repositories/`
- [ ] T016 Conectar `main.dart` con `ProviderScope` y el provider de `AppDatabase` (depende de T012,
      T015)

**Checkpoint**: Fundación lista — las User Stories pueden empezar (en paralelo si hay capacidad)

---

## Phase 3: User Story 1 - Definir rutina base y completar una sesión de entrenamiento (Priority: P1) 🎯 MVP

**Goal**: El usuario define tipos de día y un patrón, y puede completar una sesión de entrenamiento
de principio a fin (ver ejercicios sugeridos, registrar series, notas, cronómetro, temporizador de
descanso, guardar).

**Independent Test**: Ver `spec.md` › User Story 1 › Independent Test (crear 2 tipos de día, patrón
semanal, registrar una sesión completa, verificar que aparece en el historial con los datos
exactos).

### Tests for User Story 1 (basic test required — see Principle II) ⚠️

- [ ] T017 [P] [US1] Test unitario de `suggestProgression` (R1, 5 casos de
      `contracts/domain-rules.md`) en `test/unit/progressive_overload_test.dart`
- [ ] T018 [P] [US1] Test unitario de `resolveDayTypeIdForDate` (R2a, 4 casos) en
      `test/unit/day_resolution_test.dart`
- [ ] T019 [P] [US1] Test unitario de `nextCyclicPosition` (R2b, 3 casos) en
      `test/unit/cycle_advancement_test.dart`
- [ ] T020 [P] [US1] Test de repositorio para `ExerciseRepository` CRUD básico (drift en memoria)
      en `test/data/exercise_repository_test.dart`
- [ ] T021 [P] [US1] Test de repositorio para `DayTypeRepository` (CRUD + orden de ejercicios) en
      `test/data/day_type_repository_test.dart`
- [ ] T022 [P] [US1] Test de repositorio para `RoutinePatternRepository` (semanal, cíclico, avance
      de ciclo) en `test/data/routine_pattern_repository_test.dart`
- [ ] T023 [P] [US1] Test de repositorio para `SessionRepository` (start/logSet autosave/finish/
      getInProgress/getLastSetsFor) en `test/data/session_repository_test.dart`

### Implementation for User Story 1

- [ ] T024 [US1] Implementar `suggestProgression` en `lib/domain/logic/progressive_overload.dart`
      (FR-014, FR-025) — depende de T017
- [ ] T025 [US1] Implementar `resolveDayTypeIdForDate` y `nextCyclicPosition` en
      `lib/domain/logic/cycle_advancement.dart` (FR-007, FR-008, FR-009, FR-010, Principio IX) —
      depende de T018, T019
- [ ] T026 [US1] Implementar `ExerciseRepository` CRUD básico (getAll/getById/upsert) en
      `lib/data/repositories/exercise_repository_impl.dart` — depende de T020
- [ ] T027 [US1] Implementar `DayTypeRepository` en
      `lib/data/repositories/day_type_repository_impl.dart` — depende de T021
- [ ] T028 [US1] Implementar `RoutinePatternRepository` (saveWeekly/saveCyclic/
      advanceCyclicPosition/override CRUD) en
      `lib/data/repositories/routine_pattern_repository_impl.dart` — depende de T022, T025
- [ ] T029 [US1] Implementar `SessionRepository` (startSession/logSet autosave/finishSession/
      getInProgress/getLastSetsFor) en `lib/data/repositories/session_repository_impl.dart`, con
      transacciones drift (Principio VIII, FR-024) — depende de T023
- [ ] T030 [US1] Providers Riverpod para armar tipos de día y patrón en
      `lib/application/routine_setup_providers.dart` — depende de T026, T027, T028
- [ ] T031 [US1] Providers Riverpod para la sesión activa (start/logSet/notes/finish/resume) en
      `lib/application/session_providers.dart` — depende de T029
- [ ] T032 [US1] Pantalla crear/editar tipo de día en
      `lib/presentation/screens/day_type_editor_screen.dart` — depende de T030
- [ ] T033 [US1] Pantalla definir patrón (semanal o cíclico) en
      `lib/presentation/screens/pattern_setup_screen.dart` — depende de T030
- [ ] T034 [US1] Pantalla "hoy" (tipo de día sugerido; guía a crear el primer tipo de día si no hay
      ninguno — Edge Case del spec) en `lib/presentation/screens/today_screen.dart` — depende de
      T030, T031
- [ ] T035 [US1] Pantalla de sesión activa (ejercicios en orden, sugerencia de sobrecarga
      progresiva, notas) en `lib/presentation/screens/active_session_screen.dart` — depende de
      T024, T031
- [ ] T036 [US1] Widget cronómetro de sesión, con test básico, en
      `lib/presentation/widgets/session_stopwatch.dart` y
      `test/widget/session_stopwatch_test.dart` (FR-017) — depende de T031
- [ ] T037 [US1] Widget temporizador de descanso con notificación
      (`flutter_local_notifications`), con test básico, en
      `lib/presentation/widgets/rest_timer.dart` y `test/widget/rest_timer_test.dart` (FR-018)
- [ ] T038 [US1] Integrar cronómetro, temporizador, sugerencia de sobrecarga y notas en
      `lib/presentation/screens/active_session_screen.dart` (flujo E1 completo de
      `quickstart.md`) — depende de T035, T036, T037

**Checkpoint**: User Story 1 (MVP) funcional y testeable de forma independiente

---

## Phase 4: User Story 2 - Consultar historial y progreso (Priority: P2)

**Goal**: El usuario ve el historial completo de sesiones pasadas y gráficas de progreso (peso
máximo, volumen total) por ejercicio.

**Independent Test**: Ver `spec.md` › User Story 2 › Independent Test.

### Tests for User Story 2 (basic test required — see Principle II) ⚠️

- [ ] T039 [P] [US2] Test de repositorio para `ProgressRepository` (maxWeightOverTime/
      totalVolumeOverTime) en `test/data/progress_repository_test.dart`
- [ ] T040 [P] [US2] Test de `getHistory`/`getSessionDetail` de `SessionRepository` en
      `test/data/session_history_test.dart`

### Implementation for User Story 2

- [ ] T041 [US2] Extender `SessionRepository` con `getHistory`/`getSessionDetail` en
      `lib/data/repositories/session_repository_impl.dart` (FR-019) — depende de T040, T029
- [ ] T042 [US2] Implementar `ProgressRepository` (agregaciones de peso máximo y volumen) en
      `lib/data/repositories/progress_repository_impl.dart` (FR-020) — depende de T039
- [ ] T043 [US2] Providers Riverpod de historial y progreso en
      `lib/application/progress_providers.dart` — depende de T041, T042
- [ ] T044 [US2] Pantallas de historial de sesiones y detalle de sesión en
      `lib/presentation/screens/history_screen.dart` y
      `lib/presentation/screens/session_detail_screen.dart` — depende de T043
- [ ] T045 [US2] Pantalla de progreso por ejercicio (gráficas `fl_chart`: peso máximo y volumen) en
      `lib/presentation/screens/exercise_progress_screen.dart` — depende de T043

**Checkpoint**: User Stories 1 y 2 funcionales de forma independiente

---

## Phase 5: User Story 3 - Explorar la biblioteca de ejercicios (Priority: P2)

**Goal**: El usuario busca y filtra ejercicios por equipo/músculo, ve sustitutos, califica
ejercicios y sabe cuáles ya probó.

**Independent Test**: Ver `spec.md` › User Story 3 › Independent Test.

### Tests for User Story 3 (basic test required — see Principle II) ⚠️

- [ ] T046 [P] [US3] Test de repositorio para `ExerciseRepository` (filter, substitutes,
      triedExerciseIds, setRating, archive) en `test/data/exercise_repository_filters_test.dart`

### Implementation for User Story 3

- [ ] T047 [US3] Extender `ExerciseRepository` con `filter`, `getSubstitutes`/`setSubstitutes`,
      `getTriedExerciseIds`, `setRating`, `archive` (soft-delete) en
      `lib/data/repositories/exercise_repository_impl.dart` (FR-002, FR-003, FR-004, FR-027) —
      depende de T046, T026
- [ ] T048 [US3] Providers Riverpod de biblioteca (filtros, sustitutos, calificación) en
      `lib/application/exercise_library_providers.dart` — depende de T047
- [ ] T049 [US3] Pantalla biblioteca de ejercicios (lista + filtros por equipo/músculo) en
      `lib/presentation/screens/exercise_library_screen.dart` — depende de T048
- [ ] T050 [US3] Pantalla detalle de ejercicio (sustitutos, calificación, "ya probado", archivar)
      en `lib/presentation/screens/exercise_detail_screen.dart` — depende de T048

**Checkpoint**: User Stories 1, 2 y 3 funcionales de forma independiente

---

## Phase 6: User Story 4 - Anular manualmente el tipo de día sugerido (Priority: P3)

**Goal**: El usuario anula puntualmente el tipo de día de una fecha (ej. entreno → descanso) sin
afectar el patrón base ni días futuros.

**Independent Test**: Ver `spec.md` › User Story 4 › Independent Test.

### Tests for User Story 4 (basic test required — see Principle II) ⚠️

- [ ] T051 [P] [US4] Test de anulación de día (`setOverride`/`getOverrideForDate`/`clearOverride`;
      la semana siguiente vuelve al patrón base) en
      `test/data/day_override_repository_test.dart`

### Implementation for User Story 4

- [ ] T052 [US4] Provider Riverpod + acción para anular/limpiar el día sugerido en
      `lib/application/day_override_providers.dart` (FR-008, FR-009, Principio IX) — depende de
      T051, T028
- [ ] T053 [US4] UI para anular el tipo de día de hoy (botón + selector) en
      `lib/presentation/screens/today_screen.dart` — depende de T052

**Checkpoint**: User Stories 1–4 funcionales de forma independiente

---

## Phase 7: User Story 5 - Reemplazar un ejercicio por un sustituto durante la sesión (Priority: P3)

**Goal**: El usuario reemplaza un ejercicio planeado por un sustituto durante una sesión activa,
sin alterar la definición del tipo de día.

**Independent Test**: Ver `spec.md` › User Story 5 › Independent Test.

### Tests for User Story 5 (basic test required — see Principle II) ⚠️

- [ ] T054 [P] [US5] Test de `replaceExercise` (el sustituto realizado no altera la definición del
      `DayType`) en `test/data/session_replace_exercise_test.dart`

### Implementation for User Story 5

- [ ] T055 [US5] Implementar `replaceExercise` en `SessionRepository` en
      `lib/data/repositories/session_repository_impl.dart` (FR-016) — depende de T054, T029
- [ ] T056 [US5] UI para reemplazar un ejercicio por un sustituto en la sesión activa (selector de
      sustitutos) en `lib/presentation/screens/active_session_screen.dart` — depende de T055

**Checkpoint**: Todas las User Stories (1–5) funcionales de forma independiente

---

## Phase 8: Polish & Cross-Cutting Concerns

**Purpose**: Mejoras que afectan a varias User Stories

- [ ] T057 [P] Widget tests de humo para `today_screen` y `active_session_screen` en
      `test/widget/`
- [ ] T058 Ejecutar la validación manual de `quickstart.md` (escenarios E1–E6) en
      emulador/dispositivo
- [ ] T059 Verificar que `POST_NOTIFICATIONS` se solicita solo al primer uso del temporizador de
      descanso, no al inicio de la app (Play Store Readiness, mínimo privilegio)
- [ ] T060 Correr la suite completa (`flutter test`) y corregir cualquier regresión antes de dar la
      feature por terminada

---

## Dependencies & Execution Order

### Phase Dependencies

- **Setup (Phase 1)**: sin dependencias — puede arrancar de inmediato
- **Foundational (Phase 2)**: depende de Setup — BLOQUEA todas las User Stories
- **User Stories (Phase 3+)**: todas dependen de Foundational
  - Pueden avanzar en paralelo (si hay capacidad) o en orden de prioridad (P1 → P2 → P2 → P3 → P3)
- **Polish (Phase 8)**: depende de que las User Stories deseadas estén completas

### User Story Dependencies

- **US1 (P1)**: puede empezar tras Foundational — sin dependencia de otras stories (MVP)
- **US2 (P2)**: puede empezar tras Foundational; reutiliza `SessionRepository` de US1 (extiende el
  mismo archivo, no lo duplica) pero es independientemente testeable con datos de sesión ya
  existentes
- **US3 (P2)**: puede empezar tras Foundational; extiende `ExerciseRepository` de US1 (mismo
  archivo) pero es independientemente testeable
- **US4 (P3)**: puede empezar tras Foundational; usa `RoutinePatternRepository` de US1
- **US5 (P3)**: puede empezar tras Foundational; extiende `SessionRepository` de US1

> Nota: varias stories **extienden** archivos creados en US1 (`exercise_repository_impl.dart`,
> `session_repository_impl.dart`). Esto es intencional (evita repositorios duplicados) y significa
> que esas tareas específicas son secuenciales respecto a su archivo, aunque la story en su
> conjunto sea independientemente testeable una vez implementada.

### Within Each User Story

- Tests básicos MUST escribirse como parte de la tarea, antes de considerar la función terminada
  (Principio II)
- Reglas de dominio → repositorios → providers → pantallas/widgets
- Story completa antes de pasar a la siguiente prioridad (si se trabaja secuencialmente)

### Parallel Opportunities

- Todas las tareas [P] de Setup (T003–T005) en paralelo
- Todas las tareas [P] de Foundational (T006–T011, T014, T015) en paralelo
- Una vez completada Foundational, las 5 User Stories pueden empezar en paralelo (si hay capacidad)
- Todos los tests [P] de una story en paralelo entre sí
- Dentro de US1: T017–T023 (tests) en paralelo entre sí; T024–T029 (repos/lógica) parcialmente en
  paralelo salvo por sus dependencias declaradas

---

## Parallel Example: User Story 1

```bash
# Lanzar todos los tests de US1 juntos:
Task: "Unit test suggestProgression en test/unit/progressive_overload_test.dart"
Task: "Unit test resolveDayTypeIdForDate en test/unit/day_resolution_test.dart"
Task: "Unit test nextCyclicPosition en test/unit/cycle_advancement_test.dart"
Task: "Repository test ExerciseRepository en test/data/exercise_repository_test.dart"
Task: "Repository test DayTypeRepository en test/data/day_type_repository_test.dart"
Task: "Repository test RoutinePatternRepository en test/data/routine_pattern_repository_test.dart"
Task: "Repository test SessionRepository en test/data/session_repository_test.dart"
```

---

## Implementation Strategy

### MVP First (User Story 1 solamente)

1. Completar Phase 1: Setup
2. Completar Phase 2: Foundational (CRÍTICO — bloquea todas las stories)
3. Completar Phase 3: User Story 1
4. **PARAR y VALIDAR**: probar User Story 1 de forma independiente (escenario E1/E2 de
   `quickstart.md`)
5. Usar la app en el gimnasio si está lista (uso personal — no hace falta "deploy")

### Incremental Delivery

1. Setup + Foundational → base lista
2. Agregar US1 → validar con E1/E2 → **MVP usable**
3. Agregar US2 → validar con E3
4. Agregar US3 → validar con E4
5. Agregar US4 → validar con E5
6. Agregar US5 → validar con E6
7. Polish (Phase 8) → validación completa + suite de tests en verde

---

## Notes

- [P] = archivos distintos, sin dependencias pendientes
- [Story] mapea la tarea a su User Story para trazabilidad
- Cada User Story debe ser completable y testeable de forma independiente
- Commitear después de cada tarea o grupo lógico
- Parar en cada Checkpoint para validar la story de forma independiente
- Evitar: tareas vagas, conflictos en el mismo archivo sin declarar dependencia, dependencias
  cruzadas entre stories que rompan la independencia
