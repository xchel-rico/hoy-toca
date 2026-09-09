import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:hoy_toca/core/enums.dart';

import 'tables/day_types_table.dart';
import 'tables/exercises_table.dart';
import 'tables/routine_pattern_table.dart';
import 'tables/sessions_table.dart';
import 'tables/users_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [
  Users,
  Exercises,
  ExerciseSubstitutes,
  DayTypes,
  DayTypeExercises,
  RoutinePatterns,
  WeeklyPatternSlots,
  CyclicPatternSlots,
  DayOverrides,
  WorkoutSessions,
  SessionExerciseLogs,
  SetLogs,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor])
      : super(executor ?? driftDatabase(name: 'hoy_toca'));

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );
}
