<!--
Sync Impact Report
==================
Version change: [TEMPLATE] → 1.0.0 (initial ratification)

Modified principles: N/A (first concrete version, replacing template placeholders)

Added sections:
- Core Principles I–IX (Simplicity & Readability First, Basic Test Before Done,
  Minimal External Dependencies, Document Design Decisions, Local-First Data
  Architecture, Multi-User-Ready Data Model, Data Isolation & Explicit Sharing,
  Progress Data Integrity, Non-Destructive Schedule Overrides)
- Play Store Readiness Requirements (Section 2)
- Development Workflow (Section 3)
- Governance

Removed sections: none (template placeholders only)

Templates requiring updates:
- ✅ .specify/templates/plan-template.md — generic "Gates determined based on
  constitution file" wording already compatible, no changes needed
- ✅ .specify/templates/spec-template.md — generic mandatory sections already
  compatible, no changes needed
- ✅ .specify/templates/tasks-template.md — updated to remove "tests are
  optional" framing, aligned with Principle II (basic test required before a
  function is done)
- ⚠ README.md / docs/quickstart.md — do not exist yet; create them to
  reference this constitution when the project scaffolding is added

Follow-up TODOs:
- TODO(RATIFICATION_DATE): confirmed as the date this constitution was first
  authored (2026-07-19); no earlier project history exists to contradict it.
-->

# Hoy Toca Constitution

## Core Principles

### I. Simplicity & Readability First
El código MUST priorizar la simplicidad y la legibilidad por encima de
soluciones "clever" u optimizaciones prematuras. Este es un proyecto de
aprendizaje (la primera app móvil del desarrollador): cada decisión de diseño
MUST poder explicarse en términos simples, y el código MUST poder ser leído y
entendido por el propio desarrollador meses después sin contexto adicional.

**Rationale**: El objetivo primario de "Hoy Toca" es aprender construyendo.
Código clever que ahorra líneas pero cuesta comprensión va en contra del
propósito del proyecto y aumenta el riesgo de bugs no detectados por un
desarrollador en solitario.

### II. Basic Test Before Done
Ninguna función nueva SHOULD considerarse completa sin al menos un test básico
que verifique su comportamiento esperado. Un "test básico" cubre el camino
feliz (happy path) como mínimo; casos límite adicionales son deseables pero no
bloqueantes para marcar la tarea como terminada.

**Rationale**: Sin un equipo de QA ni revisores externos, los tests son la
única red de seguridad contra regresiones. Exigir al menos un test por función
crea el hábito de testing desde el aprendizaje inicial, sin imponer la
disciplina completa de TDD que podría frenar el ritmo de un proyecto personal.

### III. Minimal External Dependencies
Las soluciones MUST preferir la menor cantidad de dependencias externas
posible. Firebase es la única excepción explícitamente justificada, cubriendo
autenticación, sincronización entre dispositivos y funciones de compartir.
Cualquier otra dependencia nueva MUST justificarse por escrito (en el spec o
en un comentario) explicando por qué no se puede resolver con la librería
estándar o el código ya existente.

**Rationale**: Menos dependencias significa menor superficie de mantenimiento,
menos riesgo de breaking changes de terceros, y más oportunidades de
aprendizaje real en vez de delegar todo a librerías. Firebase se acepta porque
reimplementar auth, sync y sharing desde cero excede el alcance razonable de
un proyecto personal.

### IV. Document Design Decisions
Las decisiones de diseño importantes (modelo de datos, elección de
arquitectura, tradeoffs de sincronización, etc.) MUST documentarse en el spec
de la feature correspondiente o, si son de bajo nivel, en un comentario junto
al código relevante.

**Rationale**: En un proyecto de aprendizaje sin más colaboradores, la
documentación de decisiones es lo que permite recordar el "por qué" al volver
meses después, y es la base para evaluar si esas decisiones siguen siendo
válidas al evolucionar la app.

### V. Local-First Data Architecture
Los datos del usuario MUST vivir primero en el dispositivo. El almacenamiento
local es la fuente única de verdad; la nube (Firebase) se usa exclusivamente
para sincronización entre dispositivos y funciones de compartir, nunca como
el único lugar donde un dato existe. La app MUST seguir siendo funcional para
las operaciones core (ver rutina de hoy, registrar una serie, consultar
historial) sin conexión a internet.

**Rationale**: Una app de gimnasio se usa en lugares con conectividad pobre
(gimnasios en sótanos, zonas rurales). Depender de la nube como fuente única
de verdad arriesga perder o bloquear el acceso a datos críticos de progreso
justo cuando el usuario los necesita.

### VI. Multi-User-Ready Data Model
El modelo de datos MUST diseñarse desde el inicio asumiendo que pueden existir
múltiples usuarios, aunque la v1 sea usada exclusivamente por el desarrollador.
Toda entidad de datos (rutinas, entrenamientos, series) MUST estar asociada
explícitamente a un usuario propietario, en vez de asumir un único usuario
implícito global.

**Rationale**: Retrofitear un modelo single-user hacia multi-usuario después
implica migraciones de datos arriesgadas y reescritura de queries. Diseñar
correctamente desde el día uno evita ese costo cuando la app eventualmente se
comparta con amigos.

### VII. Data Isolation & Explicit Sharing
Los datos compartidos MUST estar aislados por usuario o grupo. Un amigo NUNCA
debe poder ver rutinas, series, pesos o cualquier progreso que el usuario
propietario no haya compartido explícitamente. Compartir MUST ser un acto
opt-in y granular (por rutina o por grupo), nunca un default implícito ni una
consecuencia secundaria de otra acción.

**Rationale**: El progreso de entrenamiento es información personal (a veces
sensible, como peso corporal). Un fallo de aislamiento no es solo un bug: es
una filtración de datos privados a otra persona real.

### VIII. Progress Data Integrity (NON-NEGOTIABLE)
La integridad de los datos de progreso del usuario (peso levantado, series,
repeticiones, historial de entrenamientos) es la prioridad #1 del proyecto.
Estos datos MUST NOT perderse ni corromperse bajo ninguna circunstancia,
incluyendo fallos de sincronización, conflictos entre dispositivos, cierres
inesperados de la app o errores de migración de esquema. Cualquier operación
que escriba o modifique estos datos MUST ser diseñada pensando primero en
cómo evitar la pérdida de datos, incluso a costa de mayor complejidad o peor
rendimiento.

**Rationale**: El historial de entrenamiento es el producto central de la
app — es la razón por la que existe. Perder el progreso de un usuario destruye
la confianza en la app de forma irrecuperable, sin importar qué tan buena sea
el resto de la experiencia.

### IX. Non-Destructive Schedule Overrides
Las anulaciones manuales del usuario sobre su calendario de rutina (por
ejemplo, cambiar un día de entrenamiento a descanso, o viceversa) MUST
afectar únicamente esa instancia puntual. Estas anulaciones MUST NOT alterar
el patrón base de la rutina ni los días futuros generados a partir de ese
patrón.

**Rationale**: Si una anulación puntual mutara el patrón base, un cambio
excepcional (por ejemplo, "hoy descanso porque estoy enfermo") corrompería
silenciosamente la planificación de todas las semanas futuras, un
comportamiento sorprendente y difícil de diagnosticar para el usuario.

## Play Store Readiness Requirements

Aunque la v1 es de uso personal, el proyecto MUST prepararse desde el inicio
para eventualmente cumplir las políticas de Google Play:

- La app MUST solicitar únicamente los permisos de dispositivo estrictamente
  necesarios para la funcionalidad ofrecida (principio de mínimo privilegio).
- El proyecto MUST prever, antes de cualquier lanzamiento público, una
  política de privacidad que describa qué datos se recolectan, dónde se
  almacenan (dispositivo vs. Firebase) y con quién se comparten.
- El manejo de datos personales (incluyendo datos de salud/fitness como peso
  corporal) MUST diseñarse de forma compatible con la sección "Data Safety" de
  Play Store desde el diseño del modelo de datos, no como un parche posterior.
- Las funciones de compartir (Principio VII) MUST poder describirse de forma
  clara y verificable en la política de privacidad — si no se puede explicar
  simplemente qué ve cada usuario, la función no está lista para publicarse.

## Development Workflow

- El flujo de trabajo sigue Spec Kit: `specify` → `plan` → `tasks` →
  `implement`, incluso para un desarrollador solitario, como forma de mantener
  documentadas las decisiones (ver Principio IV).
- Toda tarea que implemente una función nueva MUST incluir su test básico
  (Principio II) como parte de la misma tarea, no como un follow-up separado
  que pueda quedar pendiente indefinidamente.
- Los cambios al modelo de datos (nuevas entidades, campos, o relaciones)
  MUST revisarse explícitamente contra los Principios V, VI, VII y VIII antes
  de implementarse, dado que son las áreas de mayor riesgo de pérdida de datos
  o fuga de privacidad.
- Nuevas dependencias externas (fuera de Firebase) MUST justificarse en el
  plan o spec de la feature que las introduce, seggún el Principio III.

## Governance

Esta constitución tiene precedencia sobre cualquier otra práctica, plantilla o
convención informal del proyecto. En caso de conflicto entre esta constitución
y una plantilla de Spec Kit (`plan-template.md`, `spec-template.md`,
`tasks-template.md`), la constitución prevalece y la plantilla MUST
actualizarse para reflejarla.

**Enmiendas**: Cualquier cambio a esta constitución MUST documentarse
actualizando este archivo, incrementando la versión según semver
(MAJOR: eliminación o redefinición incompatible de un principio; MINOR:
principio o sección nueva, o expansión material de una guía existente; PATCH:
aclaraciones o correcciones de redacción), y registrando el cambio en el Sync
Impact Report al inicio del archivo.

**Cumplimiento**: Dado que el proyecto es desarrollado por una sola persona,
la revisión de cumplimiento ocurre al planificar cada feature (`/speckit-plan`,
sección "Constitution Check") y al completar tareas que tocan datos de
progreso, sincronización o compartir. Cualquier violación de un principio
NON-NEGOTIABLE (Principio VIII) MUST bloquear el merge/completado de la tarea
hasta resolverse; violaciones de otros principios MUST justificarse
explícitamente en la sección "Complexity Tracking" del plan si no se pueden
evitar.

**Version**: 1.0.0 | **Ratified**: 2026-07-19 | **Last Amended**: 2026-07-19
