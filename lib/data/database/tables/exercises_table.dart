import 'package:drift/drift.dart';
import 'package:hoy_toca/core/enums.dart';

import 'users_table.dart';

/// Un ejercicio de la biblioteca (ver `data-model.md` › Exercise).
class Exercises extends Table {
  TextColumn get id => text()();
  TextColumn get ownerUserId => text().references(Users, #id)();
  TextColumn get name => text()();
  TextColumn get equipmentType => textEnum<EquipmentType>()();
  TextColumn get primaryMuscle => text()();
  TextColumn get externalGuideUrl => text().nullable()();
  TextColumn get rating => textEnum<ExerciseRating>().nullable()();
  BoolColumn get isArchived => boolean().withDefault(const Constant(false))();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Relación N:N entre ejercicios equivalentes/sustitutos
/// (ver `data-model.md` › ExerciseSubstitute).
class ExerciseSubstitutes extends Table {
  TextColumn get id => text()();
  TextColumn get ownerUserId => text().references(Users, #id)();
  TextColumn get exerciseId => text().references(Exercises, #id)();
  TextColumn get substituteExerciseId => text().references(Exercises, #id)();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Set<Column>> get uniqueKeys => [
        {exerciseId, substituteExerciseId},
      ];
}
