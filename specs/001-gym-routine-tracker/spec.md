# Feature Specification: Seguimiento de Rutinas de Gimnasio

**Feature Branch**: `001-gym-routine-tracker`

**Created**: 2026-07-19

**Status**: Draft

**Input**: User description: "Hoy Toca — app de seguimiento de rutinas de gimnasio para uso personal, con posibilidad de compartir con amigos en el futuro. Biblioteca de ejercicios con equipo/músculo/sustitutos, organización de rutinas por tipos de día y patrón semanal o cíclico, registro de sesiones con sobrecarga progresiva, cronómetro y temporizador de descanso, historial y gráficas de progreso."

## Clarifications

### Session 2026-07-21

- Q: Cuando la app se cierra a mitad de una sesión activa (ej. el sistema operativo la mata o el
  celular se queda sin batería), ¿qué garantía debe cumplir la persistencia de esa sesión? → A:
  Autosave incremental (cada serie se guarda apenas se ingresa) + la sesión queda recuperable: al
  reabrir la app, el usuario retoma exactamente donde quedó (ejercicios completados, cronómetro,
  series ya ingresadas).
- Q: Para ejercicios de equipo "peso corporal" (ej. flexiones), ¿el peso por serie es obligatorio
  o puede omitirse? → B: El peso es opcional por serie; obligatorio solo cuando el equipo no es
  "peso corporal". En ejercicios de peso corporal puede quedar vacío, o completarse si el usuario
  agregó peso extra (ej. lastre en dominadas).
- Q: En modo cíclico, si el usuario no entrena un día, ¿el ciclo avanza igual por días calendario
  o espera hasta que efectivamente entrene? → A: El ciclo avanza solo cuando el usuario completa
  una sesión; si un día no entrena, la próxima vez que abra la app sigue viendo pendiente el mismo
  tipo de día del ciclo (no se "pierde" ni se salta).

## User Scenarios & Testing *(mandatory)*

### User Story 1 - Definir rutina base y completar una sesión de entrenamiento (Priority: P1) 🎯 MVP

Como usuario, quiero definir mis tipos de día (con sus ejercicios) y un patrón que le diga a la
app qué toca entrenar cada día, para poder abrir la app cualquier día, ver qué ejercicios me
tocan, registrar peso/repeticiones por serie, y guardar la sesión completa.

**Why this priority**: Es el ciclo completo mínimo que hace útil a la app: sin poder definir una
rutina y registrar una sesión, no hay producto. Todo lo demás (historial, sustitutos, overrides)
mejora esta base pero no la reemplaza.

**Independent Test**: Crear 2 tipos de día con al menos un ejercicio cada uno, asignarlos a un
patrón semanal, abrir la app en un día correspondiente a uno de ellos, registrar peso y
repeticiones para cada serie de cada ejercicio, y guardar la sesión. Verificar que la sesión
guardada aparece luego en el historial con los datos exactos ingresados.

**Acceptance Scenarios**:

1. **Given** el usuario definió tipos de día y un patrón semanal, **When** abre la app en un día
   asignado a un tipo de día de entrenamiento, **Then** la app muestra los ejercicios de ese tipo
   de día en el orden definido.
2. **Given** el usuario está en una sesión activa, **When** completa una serie de un ejercicio con
   peso y repeticiones, **Then** el dato queda registrado como parte de la sesión en curso.
3. **Given** el usuario ya entrenó antes el mismo tipo de día, **When** ve un ejercicio de la
   sesión actual, **Then** la app muestra el peso y las repeticiones de cada serie registradas la
   última vez que hizo ese mismo tipo de día.
4. **Given** el usuario inicia una sesión, **When** la sesión está en curso, **Then** un cronómetro
   visible mide la duración total transcurrida desde el inicio.
5. **Given** el usuario terminó una serie, **When** inicia el temporizador de descanso, **Then** la
   app notifica cuando el tiempo configurado termina, incluso si la app no está en primer plano.
6. **Given** el usuario agrega una nota de texto libre a un ejercicio durante la sesión, **When**
   guarda la sesión, **Then** la nota queda asociada a ese ejercicio en el historial de esa sesión.

---

### User Story 2 - Consultar historial y progreso (Priority: P2)

Como usuario, quiero ver el historial completo de mis sesiones pasadas y gráficas de progreso por
ejercicio, para saber si estoy mejorando con el tiempo.

**Why this priority**: El progreso es la razón por la que alguien sigue usando la app más allá de
la primera semana, pero depende de que ya existan sesiones registradas (User Story 1).

**Independent Test**: Con al menos 3 sesiones históricas registradas para un mismo ejercicio (con
distintos pesos/repeticiones), abrir el historial y la vista de progreso de ese ejercicio, y
verificar que la gráfica de peso máximo y volumen total refleja correctamente los datos
ingresados.

**Acceptance Scenarios**:

1. **Given** existen sesiones pasadas guardadas, **When** el usuario abre el historial, **Then** ve
   la lista completa de sesiones ordenadas por fecha, con el tipo de día y ejercicios de cada una.
2. **Given** un ejercicio tiene registros en múltiples sesiones pasadas, **When** el usuario abre
   la vista de progreso de ese ejercicio, **Then** ve una gráfica de su peso máximo por sesión a
   lo largo del tiempo.
3. **Given** un ejercicio tiene registros en múltiples sesiones pasadas, **When** el usuario abre
   la vista de progreso de ese ejercicio, **Then** ve una gráfica de su volumen total (peso ×
   repeticiones sumado) por sesión a lo largo del tiempo.

---

### User Story 3 - Explorar la biblioteca de ejercicios (Priority: P2)

Como usuario, quiero buscar y filtrar ejercicios por equipo o músculo, ver qué sustitutos tiene
cada uno, y saber cuáles ya probé al menos una vez, para armar mis tipos de día y variar mi
entrenamiento.

**Why this priority**: Es necesaria para construir tipos de día con sentido y para la función de
sustitución en sesión (User Story 5), pero es una funcionalidad de consulta que puede probarse de
forma independiente sin depender de sesiones registradas.

**Independent Test**: Con una biblioteca de al menos 5 ejercicios variados (distinto equipo y
músculo, algunos con sustitutos definidos), filtrar por un tipo de equipo y por un músculo, y
verificar que los resultados son los esperados; abrir un ejercicio y verificar que muestra su
lista de sustitutos y si fue probado o no.

**Acceptance Scenarios**:

1. **Given** la biblioteca tiene ejercicios de distinto equipo y músculo, **When** el usuario
   filtra por un tipo de equipo, **Then** solo ve los ejercicios que usan ese equipo.
2. **Given** la biblioteca tiene ejercicios de distinto equipo y músculo, **When** el usuario
   filtra por un músculo, **Then** solo ve los ejercicios que trabajan ese músculo como principal.
3. **Given** un ejercicio tiene sustitutos configurados, **When** el usuario lo abre, **Then** ve
   la lista de ejercicios sustitutos/equivalentes.
4. **Given** el usuario ha completado al menos una sesión con un ejercicio, **When** consulta la
   biblioteca, **Then** ese ejercicio aparece marcado como "ya probado"; los demás aparecen como
   "no probado".

---

### User Story 4 - Anular manualmente el tipo de día sugerido (Priority: P3)

Como usuario, quiero poder cambiar manualmente qué tipo de día toca hoy (por ejemplo, convertir un
día de entrenamiento en descanso, o viceversa), sin que eso afecte el patrón base ni los días
futuros.

**Why this priority**: Cubre la excepción (enfermedad, imprevistos, ganas de entrenar en un día de
descanso) sobre el flujo normal de la User Story 1; no es necesaria para el primer uso, pero es
importante para el uso sostenido en el tiempo.

**Independent Test**: Con un patrón semanal definido, anular el tipo de día sugerido para hoy por
otro tipo de día (o descanso), verificar que la sesión de hoy usa la anulación, y luego verificar
que la semana siguiente (mismo día de la semana) vuelve a mostrar el tipo de día original del
patrón base, sin corrimiento.

**Acceptance Scenarios**:

1. **Given** hoy el patrón sugiere un tipo de día de entrenamiento, **When** el usuario anula la
   sugerencia y la cambia a descanso, **Then** la app trata hoy como día de descanso únicamente
   para esta fecha.
2. **Given** el usuario anuló el tipo de día de una fecha pasada, **When** llega la misma fecha del
   patrón en la semana siguiente (o el siguiente ciclo), **Then** la app sugiere el tipo de día
   definido en el patrón base, sin rastro de la anulación anterior.

---

### User Story 5 - Reemplazar un ejercicio por un sustituto durante la sesión (Priority: P3)

Como usuario, quiero poder reemplazar un ejercicio planeado por uno de sus sustitutos durante una
sesión activa (por ejemplo, porque el equipo está ocupado), sin que esto altere la definición del
tipo de día para futuras sesiones.

**Why this priority**: Mejora la experiencia en el gimnasio real (equipo ocupado) pero no es
necesaria para completar el flujo mínimo de registrar una sesión (User Story 1).

**Independent Test**: Durante una sesión activa con un ejercicio que tiene al menos un sustituto
configurado, reemplazarlo por el sustituto, registrar sus series, guardar la sesión, y verificar
que (a) el historial de esa sesión muestra el sustituto realmente realizado y (b) la próxima vez
que toque ese mismo tipo de día, el ejercicio original planeado sigue siendo el mismo de antes.

**Acceptance Scenarios**:

1. **Given** un ejercicio de la sesión activa tiene sustitutos configurados, **When** el usuario
   elige reemplazarlo por uno de ellos, **Then** la sesión actual registra el sustituto en su
   lugar, incluyendo sus propias series, peso, repeticiones y notas.
2. **Given** se reemplazó un ejercicio por un sustituto en una sesión pasada, **When** el usuario
   revisa la definición del tipo de día correspondiente, **Then** el ejercicio original sigue
   apareciendo como parte del tipo de día (el reemplazo no lo modificó).

---

### Edge Cases

- ¿Qué pasa si el usuario abre la app y todavía no definió ningún tipo de día ni patrón? La app
  MUST guiarlo a crear su primer tipo de día antes de poder sugerir un día de entrenamiento.
- ¿Qué pasa si es la primera vez que se entrena un tipo de día (no hay sesión previa del mismo
  tipo)? Los campos de peso/repeticiones de "la última vez" MUST aparecer vacíos y no se MUST
  mostrar ninguna sugerencia de sobrecarga progresiva.
- ¿Qué pasa si el usuario registra más de una sesión en el mismo día (por ejemplo, entrenó dos
  veces)? El historial MUST distinguir ambas sesiones por fecha y hora de inicio, sin sobrescribir
  ninguna.
- ¿Qué pasa si un ejercicio se elimina de la biblioteca pero ya fue usado en sesiones pasadas? El
  historial de sesiones pasadas MUST conservar los datos exactamente como se registraron,
  independientemente de cambios posteriores a la biblioteca de ejercicios.
- ¿Qué pasa si el temporizador de descanso sigue corriendo mientras la app pasa a segundo plano?
  La notificación de fin de descanso MUST llegar igual al usuario.

## Requirements *(mandatory)*

### Functional Requirements

**Biblioteca de ejercicios**

- **FR-001**: El sistema MUST permitir crear y ver ejercicios con nombre, tipo de equipo (máquina,
  polea, mancuernas, barra libre, peso corporal) y músculo principal trabajado.
- **FR-002**: El sistema MUST permitir filtrar o buscar ejercicios por tipo de equipo y/o músculo.
- **FR-003**: El sistema MUST permitir asociar a cada ejercicio una lista de ejercicios
  sustitutos/equivalentes que estimulan el mismo músculo de forma similar.
- **FR-004**: El sistema MUST indicar, para cada ejercicio de la biblioteca, si el usuario ya lo
  probó al menos una vez o no.
- **FR-027**: El sistema MUST permitir al usuario asignar y editar una calificación por ejercicio
  (me gusta / neutro / no me gusta), y MUST almacenarla; un ejercicio puede quedar sin calificar.
  El **uso** de esa calificación para ordenar sugerencias es v1.1 (ver FR-026); en v1 solo se
  captura y se guarda el dato.

**Organización de rutinas**

- **FR-005**: El sistema MUST permitir definir "tipos de día" (ej. "pecho y antebrazo", "pierna",
  "descanso"), cada uno con una lista ordenada de ejercicios. Cada ejercicio dentro de un tipo de
  día MUST tener un rango objetivo de repeticiones configurado (ej. 8-12), usado para la sugerencia
  de sobrecarga progresiva (ver FR-014).
- **FR-006**: El sistema MUST permitir definir un patrón semanal base que asigna un tipo de día a
  cada día de la semana.
- **FR-007**: El sistema MUST sugerir un tipo de día cada día según el patrón activo (semanal o
  cíclico).
- **FR-008**: El sistema MUST permitir anular manualmente la sugerencia de tipo de día para una
  fecha específica (por ejemplo, convertir un día de entrenamiento en descanso o viceversa), sin
  alterar el patrón base ni las sugerencias de días futuros.
- **FR-009**: El patrón semanal base MUST NOT recorrerse ni desplazarse automáticamente por
  anulaciones pasadas — cada semana siguiente MUST volver a mostrar el patrón tal como fue
  definido.
- **FR-010**: El sistema MUST soportar un modo alternativo "cíclico" que repite un ciclo de tipos
  de día, sin atarse a días de la semana. El ciclo MUST avanzar únicamente cuando el usuario
  completa efectivamente una sesión de entrenamiento — no por días de calendario transcurridos: si
  el usuario no entrena en un día dado, el siguiente tipo de día pendiente del ciclo MUST seguir
  siendo el mismo la próxima vez que abra la app (el ciclo espera, no se salta ni se pierde). El
  usuario MUST tener un único modo de patrón activo a la vez (semanal o cíclico, nunca ambos
  simultáneamente); el sistema MUST permitir cambiar de modo desde la configuración, y ese cambio
  MUST regir desde ese momento en adelante sin alterar el historial de sesiones ya registradas.
- **FR-011**: El sistema MUST permitir configurar días de descanso tanto en el modo semanal como en
  el cíclico.

**Sesión de entrenamiento**

- **FR-012**: El sistema MUST presentar los ejercicios de la sesión del día en el orden definido
  para ese tipo de día.
- **FR-013**: Para cada ejercicio, el sistema MUST mostrar el peso y las repeticiones por serie
  registrados la última vez que se realizó el mismo tipo de día.
- **FR-014**: El sistema MUST sugerir subir peso o repeticiones respecto a la última vez, según la
  siguiente regla de sobrecarga progresiva: si en la última vez que se hizo este ejercicio (en el
  mismo tipo de día) todas las series alcanzaron el máximo del rango objetivo de repeticiones
  configurado para ese ejercicio, el sistema MUST sugerir subir peso en la próxima serie; si al
  menos una serie quedó por debajo del máximo del rango objetivo, el sistema MUST sugerir mantener
  el peso y apuntar a subir repeticiones hasta alcanzar el máximo del rango. Esta regla requiere
  que cada ejercicio dentro de un tipo de día tenga un rango objetivo de repeticiones configurado
  (ej. 8-12) — ver FR-005 y Key Entities.
- **FR-015**: El sistema MUST permitir agregar notas de texto libre por ejercicio en cada sesión.
- **FR-016**: El sistema MUST permitir reemplazar un ejercicio planeado por uno de sus sustitutos
  durante una sesión activa; el registro de la sesión MUST reflejar el ejercicio realmente
  realizado, sin alterar la definición del tipo de día original.
- **FR-017**: El sistema MUST proveer un cronómetro que mida la duración total de la sesión de
  entrenamiento.
- **FR-018**: El sistema MUST proveer un temporizador de descanso entre series, configurable por el
  usuario, que notifique al usuario cuando termina.
- **FR-024**: El sistema MUST guardar cada serie registrada de forma incremental en el dispositivo
  apenas se ingresa, sin esperar a que la sesión finalice. Si la app se cierra inesperadamente
  durante una sesión activa, el sistema MUST permitir retomarla exactamente en el estado en que
  quedó (ejercicios ya completados, series ingresadas y cronómetro) la próxima vez que se abra la
  app.
- **FR-025**: El campo de peso por serie MUST ser obligatorio para ejercicios cuyo equipo no sea
  "peso corporal". Para ejercicios de equipo "peso corporal", el peso por serie MUST ser opcional
  (puede quedar vacío, o completarse si el usuario agregó peso extra). Cuando no hay peso
  registrado, la sugerencia de sobrecarga progresiva (FR-014) MUST basarse únicamente en
  repeticiones.

**Historial y progreso**

- **FR-019**: El sistema MUST conservar un historial completo de las sesiones pasadas.
- **FR-020**: El sistema MUST mostrar gráficas de progreso por ejercicio, incluyendo peso máximo y
  volumen total a lo largo del tiempo.

**Datos, privacidad y disponibilidad**

- **FR-021**: El sistema MUST permitir realizar las operaciones core (ver la sesión sugerida de
  hoy, registrar una sesión, consultar el historial) sin necesitar una conexión a internet activa.
- **FR-022**: El sistema MUST mantener privados por defecto los datos de rutinas y progreso de cada
  usuario; el modelo de datos MUST estar preparado para que, en el futuro, compartir una rutina o
  su progreso sea una acción explícita y opt-in, sin exponer datos no compartidos.

**Fuera del alcance bloqueante de v1**

- **FR-023**: El sistema SHOULD ofrecer, para ejercicios que el usuario no sabe cómo hacer, un
  enlace externo a un video o guía (v1.1 — no bloquea el lanzamiento inicial de v1).
- **FR-026**: El sistema SHOULD usar la calificación de los ejercicios (capturada en v1 vía FR-027)
  para priorizar, al reemplazar un ejercicio durante una sesión (FR-016), los sustitutos mejor
  calificados por el usuario. (v1.1 — el ordenamiento inteligente no se implementa en v1; el dato
  de calificación ya se almacena desde v1.)

### Key Entities *(data involved)*

- **Ejercicio**: nombre, tipo de equipo, músculo principal, lista de ejercicios sustitutos,
  calificación opcional del usuario (me gusta / neutro / no me gusta), si fue probado al menos una
  vez (derivado del historial).
- **Tipo de Día**: nombre (ej. "pierna"), lista ordenada de ejercicios que lo componen, cada uno
  con su rango objetivo de repeticiones (ej. 8-12) usado para la sugerencia de sobrecarga
  progresiva.
- **Patrón de Rutina**: la configuración activa (única a la vez) que asigna tipos de día a fechas —
  en modo semanal, un tipo de día por día de la semana; en modo cíclico, una secuencia ordenada de
  tipos de día y un puntero a la posición actual del ciclo, que solo avanza cuando el usuario
  completa una sesión (no por días de calendario transcurridos). Cambiar de modo no borra el
  historial de sesiones ya registradas bajo el modo anterior.
- **Anulación de Día**: una anulación puntual (fecha + tipo de día elegido) que no modifica el
  Patrón de Rutina ni fechas futuras.
- **Sesión de Entrenamiento**: fecha/hora de inicio y fin, tipo de día realizado, duración total,
  lista de registros de ejercicio, estado (en progreso / finalizada) para permitir retomarla si la
  app se cierra antes de guardarla como finalizada.
- **Registro de Ejercicio (en sesión)**: referencia al ejercicio realmente realizado (puede ser un
  sustituto del planeado), lista de series, notas de texto libre.
- **Serie**: repeticiones y peso (peso opcional cuando el ejercicio es de equipo "peso corporal";
  obligatorio en cualquier otro equipo). Incluye dos campos de preparación futura, inertes en v1
  (se almacenan pero sin UI ni lógica): tipo de serie (calentamiento/trabajo/fallo/dropset) y RPE
  (esfuerzo percibido 1–10).
- **Usuario**: propietario de su biblioteca, tipos de día, patrón, anulaciones e historial —
  modelado desde el inicio como una entidad independiente aunque v1 tenga un único usuario real.

## Success Criteria *(mandatory)*

### Measurable Outcomes

- **SC-001**: El usuario puede completar el flujo de registrar una sesión de entrenamiento
  completa, desde abrir la app hasta guardarla, sin ninguna conexión a internet activa.
- **SC-002**: Al abrir la app en cualquier día con una rutina definida, el usuario ve el tipo de
  día sugerido y sus ejercicios de forma inmediata (sin pasos de configuración adicionales).
- **SC-003**: El usuario puede anular el tipo de día sugerido para hoy en 3 acciones o menos, y
  verificar que la semana o ciclo siguiente vuelve exactamente al patrón base definido.
- **SC-004**: Para cualquier ejercicio con al menos 2 sesiones registradas, el usuario puede ver
  una gráfica de su peso máximo y de su volumen total a lo largo del tiempo.
- **SC-005**: Ningún dato de progreso (peso, series, repeticiones, notas, historial) se pierde
  tras cerrar y reabrir la app, ni tras una interrupción inesperada durante una sesión activa; el
  usuario puede retomar una sesión interrumpida exactamente donde quedó.
- **SC-006**: El usuario puede encontrar y aplicar un ejercicio sustituto dentro de una sesión
  activa en 3 acciones o menos.
- **SC-007**: El usuario puede filtrar la biblioteca de ejercicios por equipo o por músculo y
  obtener resultados correctos en el 100% de los casos probados.

## Assumptions

- V1 es usada por un único usuario real (el desarrollador); el modelo de datos se diseña desde el
  inicio asumiendo múltiples usuarios, según la constitución del proyecto.
- La app es una aplicación móvil de uso personal (no web); el detalle de plataforma, stack técnico
  y proveedor de nube se define en el plan de implementación, no en esta especificación.
- Las funciones marcadas como "podría tener" a futuro (animación en la app para demostrar la
  ejecución de un ejercicio, compartir una rutina o su progreso con un amigo, cuenta de usuario
  simple para identificar a cada persona al compartir, sincronización entre dispositivos del mismo
  usuario) NO se implementan en v1, pero el modelo de datos de Ejercicio, Sesión y Usuario MUST
  poder extenderse a ellas sin requerir una migración destructiva de los datos ya existentes.
  Ver FR-022.
- El enlace externo a video/guía (FR-023) es de v1.1 y no bloquea el release de v1; puede
  representarse en el modelo de datos del Ejercicio como un campo opcional desde v1.
- La calificación de ejercicios se **almacena y edita desde v1** (FR-027) como un atributo del
  Ejercicio (me gusta / neutro / no me gusta, sin calificar por defecto). Lo que queda para v1.1 es
  únicamente **usar** esa calificación para ordenar la sugerencia de sustitutos (FR-026/FR-016);
  guardar el dato desde v1 evita una migración posterior.
- El esquema incluye desde v1 tres campos **inertes de preparación** (nullable, sin UI ni lógica en
  v1, sin afectar ningún requisito MUST): tipo de serie y RPE en la Serie, y un identificador de
  grupo de superserie en el ejercicio-dentro-de-tipo-de-día. Su único fin es evitar una migración
  destructiva si se implementan en una versión futura pensada para más usuarios. El usuario actual
  no entrena con superseries ni registra RPE, por eso no se exponen todavía.
- Cuando dos usuarios comparten una rutina en el futuro, cada uno mantiene su propio progreso
  (peso, series, repeticiones) de forma aislada — compartir una rutina no implica compartir el
  progreso de otro usuario salvo que también se comparta explícitamente (ver FR-022).
