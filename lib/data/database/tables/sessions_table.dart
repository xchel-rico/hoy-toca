import 'package:drift/drift.dart';
import 'package:hoy_toca/core/enums.dart';

import 'day_types_table.dart';
import 'exercises_table.dart';
import 'users_table.dart';

/// Una sesión de entrenamiento, en curso o finalizada
/// (ver `data-model.md` › WorkoutSession).
class WorkoutSessions extends Table {
  TextColumn get id => text()();
  TextColumn get ownerUserId => text().references(Users, #id)();
  TextColumn get dayTypeId => text().references(DayTypes, #id)();
  TextColumn get status => textEnum<SessionStatus>()();
  IntColumn get startedAt => integer()();
  IntColumn get endedAt => integer().nullable()();
  IntColumn get durationSeconds => integer().withDefault(const Constant(0))();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Registro de un ejercicio dentro de una sesión, puede ser un sustituto del
/// planeado (ver `data-model.md` › SessionExerciseLog).
class SessionExerciseLogs extends Table {
  TextColumn get id => text()();
  TextColumn get ownerUserId => text().references(Users, #id)();
  TextColumn get sessionId => text().references(WorkoutSessions, #id)();
  @ReferenceName('plannedInSessionLogs')
  TextColumn get plannedExerciseId =>
      text().nullable().references(Exercises, #id)();
  @ReferenceName('performedInSessionLogs')
  TextColumn get performedExerciseId => text().references(Exercises, #id)();
  IntColumn get position => integer()();
  TextColumn get notes => text().nullable()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Una serie registrada dentro de un ejercicio de la sesión
/// (ver `data-model.md` › SetLog).
class SetLogs extends Table {
  TextColumn get id => text()();
  TextColumn get ownerUserId => text().references(Users, #id)();
  TextColumn get sessionExerciseLogId =>
      text().references(SessionExerciseLogs, #id)();
  IntColumn get setNumber => integer()();
  IntColumn get reps => integer()();
  RealColumn get weight => real().nullable()();
  TextColumn get setType => textEnum<SetType>().nullable()();
  IntColumn get rpe => integer().nullable()();
  IntColumn get completedAt => integer()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
