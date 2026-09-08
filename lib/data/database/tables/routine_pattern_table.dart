import 'package:drift/drift.dart';
import 'package:hoy_toca/core/enums.dart';

import 'day_types_table.dart';
import 'users_table.dart';

/// El único patrón activo del usuario (semanal o cíclico, nunca ambos)
/// (ver `data-model.md` › RoutinePattern).
class RoutinePatterns extends Table {
  TextColumn get id => text()();
  TextColumn get ownerUserId => text().references(Users, #id).unique()();
  TextColumn get mode => textEnum<PatternMode>()();
  IntColumn get cyclicPosition => integer().nullable()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Slot semanal: un tipo de día por día de la semana, modo `weekly`
/// (ver `data-model.md` › WeeklyPatternSlot).
class WeeklyPatternSlots extends Table {
  TextColumn get id => text()();
  TextColumn get patternId => text().references(RoutinePatterns, #id)();
  IntColumn get dayOfWeek => integer()();
  TextColumn get dayTypeId => text().references(DayTypes, #id)();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Set<Column>> get uniqueKeys => [
        {patternId, dayOfWeek},
      ];
}

/// Slot cíclico: secuencia ordenada de tipos de día, modo `cyclic`
/// (ver `data-model.md` › CyclicPatternSlot).
class CyclicPatternSlots extends Table {
  TextColumn get id => text()();
  TextColumn get patternId => text().references(RoutinePatterns, #id)();
  IntColumn get position => integer()();
  TextColumn get dayTypeId => text().references(DayTypes, #id)();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Set<Column>> get uniqueKeys => [
        {patternId, position},
      ];
}

/// Anulación puntual del tipo de día sugerido para una fecha concreta
/// (ver `data-model.md` › DayOverride).
class DayOverrides extends Table {
  TextColumn get id => text()();
  TextColumn get ownerUserId => text().references(Users, #id)();
  TextColumn get date => text()();
  TextColumn get dayTypeId => text().references(DayTypes, #id)();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Set<Column>> get uniqueKeys => [
        {ownerUserId, date},
      ];
}
