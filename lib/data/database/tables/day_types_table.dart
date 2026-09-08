import 'package:drift/drift.dart';

import 'exercises_table.dart';
import 'users_table.dart';

/// Un "tipo de día" (ej. "pierna", "descanso") (ver `data-model.md` › DayType).
class DayTypes extends Table {
  TextColumn get id => text()();
  TextColumn get ownerUserId => text().references(Users, #id)();
  TextColumn get name => text()();
  BoolColumn get isRest => boolean().withDefault(const Constant(false))();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Ejercicio dentro de un tipo de día, con orden y rango objetivo de
/// repeticiones (ver `data-model.md` › DayTypeExercise).
class DayTypeExercises extends Table {
  TextColumn get id => text()();
  TextColumn get ownerUserId => text().references(Users, #id)();
  TextColumn get dayTypeId => text().references(DayTypes, #id)();
  TextColumn get exerciseId => text().references(Exercises, #id)();
  IntColumn get position => integer()();
  IntColumn get targetRepMin => integer()();
  IntColumn get targetRepMax => integer()();
  TextColumn get supersetGroupId => text().nullable()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Set<Column>> get uniqueKeys => [
        {dayTypeId, position},
      ];
}
