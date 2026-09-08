/// Tipo de equipo requerido por un ejercicio.
enum EquipmentType { machine, cable, dumbbell, barbell, bodyweight }

/// Modo del patrón de rutina activo: semanal (un tipo de día por día de la
/// semana) o cíclico (secuencia ordenada que avanza al finalizar sesión).
enum PatternMode { weekly, cyclic }

/// Estado de una sesión de entrenamiento.
enum SessionStatus { inProgress, finished }

/// Calificación de un ejercicio sustituto (ordenar por calificación es v1.1).
enum ExerciseRating { like, neutral, dislike }

/// Tipo de serie. Inerte en v1 (se almacena, sin UI ni lógica).
enum SetType { warmup, working, failure, dropset }
