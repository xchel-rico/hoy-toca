import 'package:drift/drift.dart';

/// Propietario de todos los datos. En v1 se crea una sola fila local al
/// primer arranque (ver `data-model.md` › User).
class Users extends Table {
  TextColumn get id => text()();
  TextColumn get displayName => text().withDefault(const Constant('Yo'))();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
