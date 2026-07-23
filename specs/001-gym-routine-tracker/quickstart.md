# Quickstart — Guía de Validación

Feature: Seguimiento de Rutinas de Gimnasio | Branch: `001-gym-routine-tracker` | Date: 2026-07-21

Esta guía valida que la feature funciona end-to-end. Los detalles de entidades están en
[`data-model.md`](./data-model.md) y las reglas en [`contracts/`](./contracts/); acá solo se
describe cómo poner a correr y qué verificar.

## Prerrequisitos

- Flutter SDK (canal stable, 3.x) — `flutter --version`
- Un emulador Android (API ≥ 24) o dispositivo físico con depuración USB
- Dependencias del proyecto instaladas y codegen de drift ejecutado (ver Setup)

## Setup

```bash
# Desde la raíz del repo
flutter pub get

# Genera el código de drift (tablas/DAOs tipados). Re-ejecutar tras tocar tablas.
dart run build_runner build --delete-conflicting-outputs

# Corre la app en el emulador/dispositivo
flutter run
```

## Validación por unidades (correr siempre antes de dar por hecho un flujo)

```bash
# Reglas de dominio puras (sobrecarga progresiva, día de hoy, avance de ciclo)
flutter test test/unit/

# Repositorios contra SQLite en memoria (sin tocar disco)
flutter test test/data/

# Todo
flutter test
```

Las reglas de dominio (`contracts/domain-rules.md`) son los **primeros** tests a implementar
(Principio II) — cada caso de sus tablas es un test.

---

## Escenarios de validación end-to-end

Cada escenario mapea a una User Story del spec. Verificar en la app corriendo.

### E1 — MVP: definir rutina y registrar una sesión (US1) 🎯

1. Primer arranque: la app crea el usuario local por defecto y guía a crear el primer tipo de día.
2. Crear 2 tipos de día (ej. "Pecho" y "Pierna"), cada uno con ≥1 ejercicio y su rango objetivo de
   reps (ej. 8–12).
3. Definir un patrón **semanal** que asigne esos tipos de día a días de la semana.
4. Abrir la app en un día asignado → **verificar** que muestra los ejercicios de ese tipo de día en
   orden (FR-012).
5. Iniciar sesión → **verificar** que el cronómetro corre (FR-017).
6. Registrar peso y reps por serie; en un ejercicio de peso corporal, dejar el peso vacío →
   **verificar** que lo acepta (FR-025).
7. Agregar una nota a un ejercicio (FR-015).
8. Iniciar el temporizador de descanso, mandar la app a segundo plano → **verificar** que llega la
   notificación al terminar (FR-018).
9. Finalizar y guardar → **verificar** que la sesión aparece en el historial con los datos exactos.

**Éxito**: todo el flujo se completa **sin conexión a internet** (SC-001).

### E2 — Resiliencia: reanudar sesión interrumpida (US1 / FR-024)

1. Iniciar una sesión, registrar algunas series.
2. Forzar el cierre de la app (matar el proceso).
3. Reabrir → **verificar** que la sesión sigue `en progreso` y se retoma exactamente donde quedó
   (ejercicios hechos, series ingresadas, cronómetro). Ningún dato perdido (SC-005, Principio VIII).

### E3 — Historial y progreso (US2)

1. Con ≥2 sesiones registradas para un mismo ejercicio con distintos pesos → abrir su vista de
   progreso.
2. **Verificar** gráfica de **peso máximo** por sesión (FR-020, SC-004).
3. **Verificar** gráfica de **volumen total** (Σ peso×reps) por sesión.

### E4 — Biblioteca: filtros, sustitutos y "ya probado" (US3)

1. Con ≥5 ejercicios variados → filtrar por equipo y por músculo → **verificar** resultados
   correctos (FR-002, SC-007).
2. Abrir un ejercicio con sustitutos → **verificar** que se listan (FR-003).
3. **Verificar** que los ejercicios ya usados en sesiones aparecen como "probado" y el resto no
   (FR-004).

### E5 — Anulación no destructiva del día (US4 / Principio IX)

1. Con patrón semanal, anular el tipo de día de hoy (ej. entrenamiento → descanso) →
   **verificar** que hoy queda como descanso (FR-008).
2. **Verificar** que el mismo día de la semana **siguiente** vuelve al patrón base, sin corrimiento
   ni rastro de la anulación (FR-009, SC-003).
3. (Modo cíclico) No entrenar un día → **verificar** que al reabrir la app el ciclo sigue mostrando
   el mismo tipo de día pendiente, no se salta (FR-010).

### E6 — Sustituto durante la sesión (US5 / FR-016)

1. En sesión activa, reemplazar un ejercicio por uno de sus sustitutos → registrar sus series →
   guardar.
2. **Verificar** que el historial de esa sesión muestra el sustituto realmente hecho (SC-006).
3. **Verificar** que la definición del tipo de día **no cambió** (el ejercicio original sigue ahí).

---

## Checklist de cierre (Definition of Done de la feature)

- [ ] `flutter test` en verde (dominio + repositorios + widgets clave).
- [ ] E1–E6 verificados manualmente en el emulador/dispositivo.
- [ ] La app solicita únicamente el permiso `POST_NOTIFICATIONS` (Android 13+), y solo al usar el
      temporizador (mínimo privilegio — Play Store Readiness).
- [ ] Ningún dato de progreso se pierde en E2 (Principio VIII).
- [ ] Sin dependencias de red en ningún flujo core (Principio V).
