# Phase 0 — Research & Decisiones Técnicas

Feature: Seguimiento de Rutinas de Gimnasio | Branch: `001-gym-routine-tracker` | Date: 2026-07-21

Cada decisión se documenta con **Decisión / Razón / Alternativas consideradas**, en cumplimiento
del Principio IV (documentar decisiones) y el Principio III (justificar cada dependencia).

---

## D1. Alcance de nube en v1 — Firebase diferido

**Decisión**: v1 es **100% local, sin Firebase ni ninguna dependencia de red**. El modelo de datos
se diseña sync-ready (ver D5) para no requerir una migración destructiva cuando se agregue.

**Razón**: La constitución nombra a Firebase como la excepción justificada, pero **solo** para
auth, sincronización y compartir — y el spec difiere las tres a COULD HAVE (futuro). Agregar
Firebase ahora violaría el Principio III (dependencia sin uso real en v1) y el Principio V
(local-first). Documentarlo aquí convierte una posible violación silenciosa en una decisión
explícita y conforme.

**Alternativas consideradas**:
- *Firestore desde v1 como store principal*: rechazado — rompe local-first y agrega complejidad de
  reglas de seguridad/offline sin ningún beneficio para el único usuario de v1.
- *Firebase solo para auth desde v1*: rechazado — no hay compartir en v1, así que no hay a quién
  identificar; el login no aporta valor todavía.

---

## D2. Almacenamiento local — drift (SQLite tipado)  *[elección del usuario]*

**Decisión**: `drift` sobre SQLite (`sqlite3_flutter_libs`), con tablas declaradas en Dart,
queries tipadas y **migraciones versionadas**.

**Razón**: Los datos son relacionales (ejercicios ↔ tipos de día ↔ sesiones ↔ series, con
sustitutos como relación N:N). La integridad del progreso es NON-NEGOTIABLE (Principio VIII):
SQLite es ACID y transaccional, y drift añade verificación en compilación (menos bugs de SQL para
un principiante) y un sistema de migraciones que permite evolucionar el esquema **sin descartar
datos de usuario**. El costo (codegen con `build_runner`) es un paso mecánico bien documentado.

**Alternativas consideradas**:
- *sqflite (SQL crudo)*: menos dependencias/codegen, pero queries y migraciones son strings
  manuales, verificados solo en runtime — mayor riesgo de corrupción/errores, en tensión con el
  Principio VIII. Ofrecido al usuario; no elegido.
- *Isar / Hive (NoSQL clave-valor)*: rápidos, pero el modelo relacional se vuelve incómodo (joins
  manuales, integridad referencial a mano) y las agregaciones para gráficas (volumen, máx.) son
  menos naturales. Rechazado por Principio I y VIII.

---

## D3. Gestión de estado — Riverpod  *[elección del usuario]*

**Decisión**: `flutter_riverpod` (Notifier/AsyncNotifier providers).

**Razón**: Testeable sin árbol de widgets (`ProviderContainer`), lo que facilita el "test básico
antes de done" (Principio II); seguro en compilación y desacoplado de `BuildContext`. Es el default
actual de la comunidad Flutter y enseña patrones sólidos para cuando la app crezca.

**Alternativas consideradas**:
- *Provider*: más simple de aprender, pero menos testeable/estructurado. Ofrecido; no elegido.
- *Bloc*: mucho boilerplate (eventos→estados), en tensión con Principio I para un primer proyecto.
- *setState puro*: insuficiente para estado compartido entre pantallas (sesión activa, patrón).

---

## D4. Notificación de fin de descanso — flutter_local_notifications

**Decisión**: `flutter_local_notifications` para disparar la notificación de fin del temporizador
de descanso (FR-018), funcionando incluso con la app en segundo plano.

**Razón**: Reimplementar notificaciones del sistema operativo es inviable y fuera de alcance
(Principio III lo justifica). Es el paquete estándar y mantenido para esto en Flutter.

**Implicación de permisos (Play Store / mínimo privilegio)**: requiere `POST_NOTIFICATIONS` en
Android 13+ (API 33). Es el **único** permiso sensible de la app y está estrictamente atado a
FR-018 — cumple el principio de mínimo privilegio de la sección Play Store Readiness. Se solicita
en runtime la primera vez que el usuario usa el temporizador, no al inicio.

**Alternativas consideradas**:
- *Solo sonido/vibración in-app sin notificación*: rechazado — no cumple "notifica al terminar
  incluso si la app no está en primer plano" (Acceptance Scenario US1-5).

---

## D5. Diseño sync-ready sin sync — UUID + ownerUserId + timestamps

**Decisión**: Toda entidad de dominio lleva: PK `id` **UUID (texto)**, `ownerUserId` (FK a `User`),
y `createdAt`/`updatedAt`. v1 crea **una fila `User` local por defecto** al primer arranque.

**Razón**: Satisface el Principio VI (multi-usuario listo) y prepara una futura fusión entre
dispositivos (Principio V/VIII) sin migración destructiva: los UUID evitan colisiones de PK al
mezclar datos de dos orígenes, y `ownerUserId` deja el aislamiento por usuario listo para cuando se
agregue compartir (Principio VII). El costo en v1 es mínimo (un JOIN trivial contra un solo user).

**Alternativas consideradas**:
- *PK autoincrement entero*: rechazado — colisiona al fusionar dos dispositivos; retrofitear UUID
  después es una migración de datos riesgosa (justo lo que el Principio VI busca evitar).
- *Sin `ownerUserId` en v1 (agregarlo al implementar compartir)*: rechazado por Principio VI —
  el spec y la constitución piden el modelo multi-usuario desde el día uno.

---

## D6. Gráficas de progreso — fl_chart

**Decisión**: `fl_chart` para las gráficas de peso máximo y volumen total por ejercicio (FR-020).

**Razón**: Graficar a mano con `CustomPainter` es posible pero costoso y propenso a errores; para
un primer proyecto, una librería de charts madura y declarativa cumple mejor el Principio I. Es la
opción estándar y sin dependencias nativas pesadas.

**Alternativas consideradas**:
- *CustomPainter propio*: descartado por costo/beneficio (Principio I) — sería reinventar la rueda.
- *charts_flutter (Google)*: descontinuado/sin mantenimiento; rechazado.

---

## D7. Reglas de dominio como funciones puras testeables

**Decisión**: La sobrecarga progresiva (FR-014) y el avance de ciclo (FR-010) se implementan como
**funciones puras** en `lib/domain/logic/`, sin dependencias de UI ni de la base de datos (reciben
datos, devuelven una sugerencia/decisión).

**Razón**: Son el núcleo algorítmico y la principal fuente de bugs sutiles; aislarlas las hace
triviales de testear (Principio II) y de explicar (Principio I). Son los primeros objetivos de
test en `tasks.md`. Ver `contracts/domain-rules.md` para las firmas y casos.

**Alternativas consideradas**:
- *Lógica embebida en Notifiers/repositorios*: rechazado — mezcla estado/IO con reglas, dificulta
  testear el happy path y los bordes (primera sesión, todo al máximo, series por debajo, etc.).

---

## Resumen de resolución de incógnitas

Todas las incógnitas del Technical Context quedaron resueltas. **Sin `NEEDS CLARIFICATION`
pendientes** al cierre de Phase 0. Gate de constitución: ✅ PASA.
