// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _displayNameMeta = const VerificationMeta(
    'displayName',
  );
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
    'display_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Yo'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, displayName, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<User> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('display_name')) {
      context.handle(
        _displayNameMeta,
        displayName.isAcceptableOrUnknown(
          data['display_name']!,
          _displayNameMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      displayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_name'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final String id;
  final String displayName;
  final int createdAt;
  final int updatedAt;
  const User({
    required this.id,
    required this.displayName,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['display_name'] = Variable<String>(displayName);
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      displayName: Value(displayName),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory User.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<String>(json['id']),
      displayName: serializer.fromJson<String>(json['displayName']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'displayName': serializer.toJson<String>(displayName),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  User copyWith({
    String? id,
    String? displayName,
    int? createdAt,
    int? updatedAt,
  }) => User(
    id: id ?? this.id,
    displayName: displayName ?? this.displayName,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      displayName: data.displayName.present
          ? data.displayName.value
          : this.displayName,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('displayName: $displayName, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, displayName, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.displayName == this.displayName &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<String> id;
  final Value<String> displayName;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int> rowid;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.displayName = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    required String id,
    this.displayName = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<User> custom({
    Expression<String>? id,
    Expression<String>? displayName,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (displayName != null) 'display_name': displayName,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith({
    Value<String>? id,
    Value<String>? displayName,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int>? rowid,
  }) {
    return UsersCompanion(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('displayName: $displayName, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExercisesTable extends Exercises
    with TableInfo<$ExercisesTable, Exercise> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExercisesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ownerUserIdMeta = const VerificationMeta(
    'ownerUserId',
  );
  @override
  late final GeneratedColumn<String> ownerUserId = GeneratedColumn<String>(
    'owner_user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<EquipmentType, String>
  equipmentType = GeneratedColumn<String>(
    'equipment_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<EquipmentType>($ExercisesTable.$converterequipmentType);
  static const VerificationMeta _primaryMuscleMeta = const VerificationMeta(
    'primaryMuscle',
  );
  @override
  late final GeneratedColumn<String> primaryMuscle = GeneratedColumn<String>(
    'primary_muscle',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _externalGuideUrlMeta = const VerificationMeta(
    'externalGuideUrl',
  );
  @override
  late final GeneratedColumn<String> externalGuideUrl = GeneratedColumn<String>(
    'external_guide_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<ExerciseRating?, String> rating =
      GeneratedColumn<String>(
        'rating',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<ExerciseRating?>($ExercisesTable.$converterratingn);
  static const VerificationMeta _isArchivedMeta = const VerificationMeta(
    'isArchived',
  );
  @override
  late final GeneratedColumn<bool> isArchived = GeneratedColumn<bool>(
    'is_archived',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_archived" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    ownerUserId,
    name,
    equipmentType,
    primaryMuscle,
    externalGuideUrl,
    rating,
    isArchived,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exercises';
  @override
  VerificationContext validateIntegrity(
    Insertable<Exercise> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('owner_user_id')) {
      context.handle(
        _ownerUserIdMeta,
        ownerUserId.isAcceptableOrUnknown(
          data['owner_user_id']!,
          _ownerUserIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_ownerUserIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('primary_muscle')) {
      context.handle(
        _primaryMuscleMeta,
        primaryMuscle.isAcceptableOrUnknown(
          data['primary_muscle']!,
          _primaryMuscleMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_primaryMuscleMeta);
    }
    if (data.containsKey('external_guide_url')) {
      context.handle(
        _externalGuideUrlMeta,
        externalGuideUrl.isAcceptableOrUnknown(
          data['external_guide_url']!,
          _externalGuideUrlMeta,
        ),
      );
    }
    if (data.containsKey('is_archived')) {
      context.handle(
        _isArchivedMeta,
        isArchived.isAcceptableOrUnknown(data['is_archived']!, _isArchivedMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Exercise map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Exercise(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      ownerUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_user_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      equipmentType: $ExercisesTable.$converterequipmentType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}equipment_type'],
        )!,
      ),
      primaryMuscle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}primary_muscle'],
      )!,
      externalGuideUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}external_guide_url'],
      ),
      rating: $ExercisesTable.$converterratingn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}rating'],
        ),
      ),
      isArchived: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_archived'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ExercisesTable createAlias(String alias) {
    return $ExercisesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<EquipmentType, String, String>
  $converterequipmentType = const EnumNameConverter<EquipmentType>(
    EquipmentType.values,
  );
  static JsonTypeConverter2<ExerciseRating, String, String> $converterrating =
      const EnumNameConverter<ExerciseRating>(ExerciseRating.values);
  static JsonTypeConverter2<ExerciseRating?, String?, String?>
  $converterratingn = JsonTypeConverter2.asNullable($converterrating);
}

class Exercise extends DataClass implements Insertable<Exercise> {
  final String id;
  final String ownerUserId;
  final String name;
  final EquipmentType equipmentType;
  final String primaryMuscle;
  final String? externalGuideUrl;
  final ExerciseRating? rating;
  final bool isArchived;
  final int createdAt;
  final int updatedAt;
  const Exercise({
    required this.id,
    required this.ownerUserId,
    required this.name,
    required this.equipmentType,
    required this.primaryMuscle,
    this.externalGuideUrl,
    this.rating,
    required this.isArchived,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['owner_user_id'] = Variable<String>(ownerUserId);
    map['name'] = Variable<String>(name);
    {
      map['equipment_type'] = Variable<String>(
        $ExercisesTable.$converterequipmentType.toSql(equipmentType),
      );
    }
    map['primary_muscle'] = Variable<String>(primaryMuscle);
    if (!nullToAbsent || externalGuideUrl != null) {
      map['external_guide_url'] = Variable<String>(externalGuideUrl);
    }
    if (!nullToAbsent || rating != null) {
      map['rating'] = Variable<String>(
        $ExercisesTable.$converterratingn.toSql(rating),
      );
    }
    map['is_archived'] = Variable<bool>(isArchived);
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  ExercisesCompanion toCompanion(bool nullToAbsent) {
    return ExercisesCompanion(
      id: Value(id),
      ownerUserId: Value(ownerUserId),
      name: Value(name),
      equipmentType: Value(equipmentType),
      primaryMuscle: Value(primaryMuscle),
      externalGuideUrl: externalGuideUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(externalGuideUrl),
      rating: rating == null && nullToAbsent
          ? const Value.absent()
          : Value(rating),
      isArchived: Value(isArchived),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Exercise.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Exercise(
      id: serializer.fromJson<String>(json['id']),
      ownerUserId: serializer.fromJson<String>(json['ownerUserId']),
      name: serializer.fromJson<String>(json['name']),
      equipmentType: $ExercisesTable.$converterequipmentType.fromJson(
        serializer.fromJson<String>(json['equipmentType']),
      ),
      primaryMuscle: serializer.fromJson<String>(json['primaryMuscle']),
      externalGuideUrl: serializer.fromJson<String?>(json['externalGuideUrl']),
      rating: $ExercisesTable.$converterratingn.fromJson(
        serializer.fromJson<String?>(json['rating']),
      ),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'ownerUserId': serializer.toJson<String>(ownerUserId),
      'name': serializer.toJson<String>(name),
      'equipmentType': serializer.toJson<String>(
        $ExercisesTable.$converterequipmentType.toJson(equipmentType),
      ),
      'primaryMuscle': serializer.toJson<String>(primaryMuscle),
      'externalGuideUrl': serializer.toJson<String?>(externalGuideUrl),
      'rating': serializer.toJson<String?>(
        $ExercisesTable.$converterratingn.toJson(rating),
      ),
      'isArchived': serializer.toJson<bool>(isArchived),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  Exercise copyWith({
    String? id,
    String? ownerUserId,
    String? name,
    EquipmentType? equipmentType,
    String? primaryMuscle,
    Value<String?> externalGuideUrl = const Value.absent(),
    Value<ExerciseRating?> rating = const Value.absent(),
    bool? isArchived,
    int? createdAt,
    int? updatedAt,
  }) => Exercise(
    id: id ?? this.id,
    ownerUserId: ownerUserId ?? this.ownerUserId,
    name: name ?? this.name,
    equipmentType: equipmentType ?? this.equipmentType,
    primaryMuscle: primaryMuscle ?? this.primaryMuscle,
    externalGuideUrl: externalGuideUrl.present
        ? externalGuideUrl.value
        : this.externalGuideUrl,
    rating: rating.present ? rating.value : this.rating,
    isArchived: isArchived ?? this.isArchived,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Exercise copyWithCompanion(ExercisesCompanion data) {
    return Exercise(
      id: data.id.present ? data.id.value : this.id,
      ownerUserId: data.ownerUserId.present
          ? data.ownerUserId.value
          : this.ownerUserId,
      name: data.name.present ? data.name.value : this.name,
      equipmentType: data.equipmentType.present
          ? data.equipmentType.value
          : this.equipmentType,
      primaryMuscle: data.primaryMuscle.present
          ? data.primaryMuscle.value
          : this.primaryMuscle,
      externalGuideUrl: data.externalGuideUrl.present
          ? data.externalGuideUrl.value
          : this.externalGuideUrl,
      rating: data.rating.present ? data.rating.value : this.rating,
      isArchived: data.isArchived.present
          ? data.isArchived.value
          : this.isArchived,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Exercise(')
          ..write('id: $id, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('name: $name, ')
          ..write('equipmentType: $equipmentType, ')
          ..write('primaryMuscle: $primaryMuscle, ')
          ..write('externalGuideUrl: $externalGuideUrl, ')
          ..write('rating: $rating, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    ownerUserId,
    name,
    equipmentType,
    primaryMuscle,
    externalGuideUrl,
    rating,
    isArchived,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Exercise &&
          other.id == this.id &&
          other.ownerUserId == this.ownerUserId &&
          other.name == this.name &&
          other.equipmentType == this.equipmentType &&
          other.primaryMuscle == this.primaryMuscle &&
          other.externalGuideUrl == this.externalGuideUrl &&
          other.rating == this.rating &&
          other.isArchived == this.isArchived &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ExercisesCompanion extends UpdateCompanion<Exercise> {
  final Value<String> id;
  final Value<String> ownerUserId;
  final Value<String> name;
  final Value<EquipmentType> equipmentType;
  final Value<String> primaryMuscle;
  final Value<String?> externalGuideUrl;
  final Value<ExerciseRating?> rating;
  final Value<bool> isArchived;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int> rowid;
  const ExercisesCompanion({
    this.id = const Value.absent(),
    this.ownerUserId = const Value.absent(),
    this.name = const Value.absent(),
    this.equipmentType = const Value.absent(),
    this.primaryMuscle = const Value.absent(),
    this.externalGuideUrl = const Value.absent(),
    this.rating = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExercisesCompanion.insert({
    required String id,
    required String ownerUserId,
    required String name,
    required EquipmentType equipmentType,
    required String primaryMuscle,
    this.externalGuideUrl = const Value.absent(),
    this.rating = const Value.absent(),
    this.isArchived = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       ownerUserId = Value(ownerUserId),
       name = Value(name),
       equipmentType = Value(equipmentType),
       primaryMuscle = Value(primaryMuscle),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Exercise> custom({
    Expression<String>? id,
    Expression<String>? ownerUserId,
    Expression<String>? name,
    Expression<String>? equipmentType,
    Expression<String>? primaryMuscle,
    Expression<String>? externalGuideUrl,
    Expression<String>? rating,
    Expression<bool>? isArchived,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ownerUserId != null) 'owner_user_id': ownerUserId,
      if (name != null) 'name': name,
      if (equipmentType != null) 'equipment_type': equipmentType,
      if (primaryMuscle != null) 'primary_muscle': primaryMuscle,
      if (externalGuideUrl != null) 'external_guide_url': externalGuideUrl,
      if (rating != null) 'rating': rating,
      if (isArchived != null) 'is_archived': isArchived,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExercisesCompanion copyWith({
    Value<String>? id,
    Value<String>? ownerUserId,
    Value<String>? name,
    Value<EquipmentType>? equipmentType,
    Value<String>? primaryMuscle,
    Value<String?>? externalGuideUrl,
    Value<ExerciseRating?>? rating,
    Value<bool>? isArchived,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int>? rowid,
  }) {
    return ExercisesCompanion(
      id: id ?? this.id,
      ownerUserId: ownerUserId ?? this.ownerUserId,
      name: name ?? this.name,
      equipmentType: equipmentType ?? this.equipmentType,
      primaryMuscle: primaryMuscle ?? this.primaryMuscle,
      externalGuideUrl: externalGuideUrl ?? this.externalGuideUrl,
      rating: rating ?? this.rating,
      isArchived: isArchived ?? this.isArchived,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (ownerUserId.present) {
      map['owner_user_id'] = Variable<String>(ownerUserId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (equipmentType.present) {
      map['equipment_type'] = Variable<String>(
        $ExercisesTable.$converterequipmentType.toSql(equipmentType.value),
      );
    }
    if (primaryMuscle.present) {
      map['primary_muscle'] = Variable<String>(primaryMuscle.value);
    }
    if (externalGuideUrl.present) {
      map['external_guide_url'] = Variable<String>(externalGuideUrl.value);
    }
    if (rating.present) {
      map['rating'] = Variable<String>(
        $ExercisesTable.$converterratingn.toSql(rating.value),
      );
    }
    if (isArchived.present) {
      map['is_archived'] = Variable<bool>(isArchived.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExercisesCompanion(')
          ..write('id: $id, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('name: $name, ')
          ..write('equipmentType: $equipmentType, ')
          ..write('primaryMuscle: $primaryMuscle, ')
          ..write('externalGuideUrl: $externalGuideUrl, ')
          ..write('rating: $rating, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExerciseSubstitutesTable extends ExerciseSubstitutes
    with TableInfo<$ExerciseSubstitutesTable, ExerciseSubstitute> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExerciseSubstitutesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ownerUserIdMeta = const VerificationMeta(
    'ownerUserId',
  );
  @override
  late final GeneratedColumn<String> ownerUserId = GeneratedColumn<String>(
    'owner_user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _exerciseIdMeta = const VerificationMeta(
    'exerciseId',
  );
  @override
  late final GeneratedColumn<String> exerciseId = GeneratedColumn<String>(
    'exercise_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES exercises (id)',
    ),
  );
  static const VerificationMeta _substituteExerciseIdMeta =
      const VerificationMeta('substituteExerciseId');
  @override
  late final GeneratedColumn<String> substituteExerciseId =
      GeneratedColumn<String>(
        'substitute_exercise_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES exercises (id)',
        ),
      );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    ownerUserId,
    exerciseId,
    substituteExerciseId,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exercise_substitutes';
  @override
  VerificationContext validateIntegrity(
    Insertable<ExerciseSubstitute> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('owner_user_id')) {
      context.handle(
        _ownerUserIdMeta,
        ownerUserId.isAcceptableOrUnknown(
          data['owner_user_id']!,
          _ownerUserIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_ownerUserIdMeta);
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
        _exerciseIdMeta,
        exerciseId.isAcceptableOrUnknown(data['exercise_id']!, _exerciseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
    }
    if (data.containsKey('substitute_exercise_id')) {
      context.handle(
        _substituteExerciseIdMeta,
        substituteExerciseId.isAcceptableOrUnknown(
          data['substitute_exercise_id']!,
          _substituteExerciseIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_substituteExerciseIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {exerciseId, substituteExerciseId},
  ];
  @override
  ExerciseSubstitute map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExerciseSubstitute(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      ownerUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_user_id'],
      )!,
      exerciseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exercise_id'],
      )!,
      substituteExerciseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}substitute_exercise_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ExerciseSubstitutesTable createAlias(String alias) {
    return $ExerciseSubstitutesTable(attachedDatabase, alias);
  }
}

class ExerciseSubstitute extends DataClass
    implements Insertable<ExerciseSubstitute> {
  final String id;
  final String ownerUserId;
  final String exerciseId;
  final String substituteExerciseId;
  final int createdAt;
  final int updatedAt;
  const ExerciseSubstitute({
    required this.id,
    required this.ownerUserId,
    required this.exerciseId,
    required this.substituteExerciseId,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['owner_user_id'] = Variable<String>(ownerUserId);
    map['exercise_id'] = Variable<String>(exerciseId);
    map['substitute_exercise_id'] = Variable<String>(substituteExerciseId);
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  ExerciseSubstitutesCompanion toCompanion(bool nullToAbsent) {
    return ExerciseSubstitutesCompanion(
      id: Value(id),
      ownerUserId: Value(ownerUserId),
      exerciseId: Value(exerciseId),
      substituteExerciseId: Value(substituteExerciseId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory ExerciseSubstitute.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExerciseSubstitute(
      id: serializer.fromJson<String>(json['id']),
      ownerUserId: serializer.fromJson<String>(json['ownerUserId']),
      exerciseId: serializer.fromJson<String>(json['exerciseId']),
      substituteExerciseId: serializer.fromJson<String>(
        json['substituteExerciseId'],
      ),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'ownerUserId': serializer.toJson<String>(ownerUserId),
      'exerciseId': serializer.toJson<String>(exerciseId),
      'substituteExerciseId': serializer.toJson<String>(substituteExerciseId),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  ExerciseSubstitute copyWith({
    String? id,
    String? ownerUserId,
    String? exerciseId,
    String? substituteExerciseId,
    int? createdAt,
    int? updatedAt,
  }) => ExerciseSubstitute(
    id: id ?? this.id,
    ownerUserId: ownerUserId ?? this.ownerUserId,
    exerciseId: exerciseId ?? this.exerciseId,
    substituteExerciseId: substituteExerciseId ?? this.substituteExerciseId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  ExerciseSubstitute copyWithCompanion(ExerciseSubstitutesCompanion data) {
    return ExerciseSubstitute(
      id: data.id.present ? data.id.value : this.id,
      ownerUserId: data.ownerUserId.present
          ? data.ownerUserId.value
          : this.ownerUserId,
      exerciseId: data.exerciseId.present
          ? data.exerciseId.value
          : this.exerciseId,
      substituteExerciseId: data.substituteExerciseId.present
          ? data.substituteExerciseId.value
          : this.substituteExerciseId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseSubstitute(')
          ..write('id: $id, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('substituteExerciseId: $substituteExerciseId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    ownerUserId,
    exerciseId,
    substituteExerciseId,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExerciseSubstitute &&
          other.id == this.id &&
          other.ownerUserId == this.ownerUserId &&
          other.exerciseId == this.exerciseId &&
          other.substituteExerciseId == this.substituteExerciseId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ExerciseSubstitutesCompanion extends UpdateCompanion<ExerciseSubstitute> {
  final Value<String> id;
  final Value<String> ownerUserId;
  final Value<String> exerciseId;
  final Value<String> substituteExerciseId;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int> rowid;
  const ExerciseSubstitutesCompanion({
    this.id = const Value.absent(),
    this.ownerUserId = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.substituteExerciseId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExerciseSubstitutesCompanion.insert({
    required String id,
    required String ownerUserId,
    required String exerciseId,
    required String substituteExerciseId,
    required int createdAt,
    required int updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       ownerUserId = Value(ownerUserId),
       exerciseId = Value(exerciseId),
       substituteExerciseId = Value(substituteExerciseId),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<ExerciseSubstitute> custom({
    Expression<String>? id,
    Expression<String>? ownerUserId,
    Expression<String>? exerciseId,
    Expression<String>? substituteExerciseId,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ownerUserId != null) 'owner_user_id': ownerUserId,
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (substituteExerciseId != null)
        'substitute_exercise_id': substituteExerciseId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExerciseSubstitutesCompanion copyWith({
    Value<String>? id,
    Value<String>? ownerUserId,
    Value<String>? exerciseId,
    Value<String>? substituteExerciseId,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int>? rowid,
  }) {
    return ExerciseSubstitutesCompanion(
      id: id ?? this.id,
      ownerUserId: ownerUserId ?? this.ownerUserId,
      exerciseId: exerciseId ?? this.exerciseId,
      substituteExerciseId: substituteExerciseId ?? this.substituteExerciseId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (ownerUserId.present) {
      map['owner_user_id'] = Variable<String>(ownerUserId.value);
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<String>(exerciseId.value);
    }
    if (substituteExerciseId.present) {
      map['substitute_exercise_id'] = Variable<String>(
        substituteExerciseId.value,
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseSubstitutesCompanion(')
          ..write('id: $id, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('substituteExerciseId: $substituteExerciseId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DayTypesTable extends DayTypes with TableInfo<$DayTypesTable, DayType> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DayTypesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ownerUserIdMeta = const VerificationMeta(
    'ownerUserId',
  );
  @override
  late final GeneratedColumn<String> ownerUserId = GeneratedColumn<String>(
    'owner_user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isRestMeta = const VerificationMeta('isRest');
  @override
  late final GeneratedColumn<bool> isRest = GeneratedColumn<bool>(
    'is_rest',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_rest" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    ownerUserId,
    name,
    isRest,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'day_types';
  @override
  VerificationContext validateIntegrity(
    Insertable<DayType> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('owner_user_id')) {
      context.handle(
        _ownerUserIdMeta,
        ownerUserId.isAcceptableOrUnknown(
          data['owner_user_id']!,
          _ownerUserIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_ownerUserIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('is_rest')) {
      context.handle(
        _isRestMeta,
        isRest.isAcceptableOrUnknown(data['is_rest']!, _isRestMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DayType map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DayType(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      ownerUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_user_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      isRest: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_rest'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $DayTypesTable createAlias(String alias) {
    return $DayTypesTable(attachedDatabase, alias);
  }
}

class DayType extends DataClass implements Insertable<DayType> {
  final String id;
  final String ownerUserId;
  final String name;
  final bool isRest;
  final int createdAt;
  final int updatedAt;
  const DayType({
    required this.id,
    required this.ownerUserId,
    required this.name,
    required this.isRest,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['owner_user_id'] = Variable<String>(ownerUserId);
    map['name'] = Variable<String>(name);
    map['is_rest'] = Variable<bool>(isRest);
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  DayTypesCompanion toCompanion(bool nullToAbsent) {
    return DayTypesCompanion(
      id: Value(id),
      ownerUserId: Value(ownerUserId),
      name: Value(name),
      isRest: Value(isRest),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory DayType.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DayType(
      id: serializer.fromJson<String>(json['id']),
      ownerUserId: serializer.fromJson<String>(json['ownerUserId']),
      name: serializer.fromJson<String>(json['name']),
      isRest: serializer.fromJson<bool>(json['isRest']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'ownerUserId': serializer.toJson<String>(ownerUserId),
      'name': serializer.toJson<String>(name),
      'isRest': serializer.toJson<bool>(isRest),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  DayType copyWith({
    String? id,
    String? ownerUserId,
    String? name,
    bool? isRest,
    int? createdAt,
    int? updatedAt,
  }) => DayType(
    id: id ?? this.id,
    ownerUserId: ownerUserId ?? this.ownerUserId,
    name: name ?? this.name,
    isRest: isRest ?? this.isRest,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  DayType copyWithCompanion(DayTypesCompanion data) {
    return DayType(
      id: data.id.present ? data.id.value : this.id,
      ownerUserId: data.ownerUserId.present
          ? data.ownerUserId.value
          : this.ownerUserId,
      name: data.name.present ? data.name.value : this.name,
      isRest: data.isRest.present ? data.isRest.value : this.isRest,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DayType(')
          ..write('id: $id, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('name: $name, ')
          ..write('isRest: $isRest, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, ownerUserId, name, isRest, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DayType &&
          other.id == this.id &&
          other.ownerUserId == this.ownerUserId &&
          other.name == this.name &&
          other.isRest == this.isRest &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class DayTypesCompanion extends UpdateCompanion<DayType> {
  final Value<String> id;
  final Value<String> ownerUserId;
  final Value<String> name;
  final Value<bool> isRest;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int> rowid;
  const DayTypesCompanion({
    this.id = const Value.absent(),
    this.ownerUserId = const Value.absent(),
    this.name = const Value.absent(),
    this.isRest = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DayTypesCompanion.insert({
    required String id,
    required String ownerUserId,
    required String name,
    this.isRest = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       ownerUserId = Value(ownerUserId),
       name = Value(name),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<DayType> custom({
    Expression<String>? id,
    Expression<String>? ownerUserId,
    Expression<String>? name,
    Expression<bool>? isRest,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ownerUserId != null) 'owner_user_id': ownerUserId,
      if (name != null) 'name': name,
      if (isRest != null) 'is_rest': isRest,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DayTypesCompanion copyWith({
    Value<String>? id,
    Value<String>? ownerUserId,
    Value<String>? name,
    Value<bool>? isRest,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int>? rowid,
  }) {
    return DayTypesCompanion(
      id: id ?? this.id,
      ownerUserId: ownerUserId ?? this.ownerUserId,
      name: name ?? this.name,
      isRest: isRest ?? this.isRest,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (ownerUserId.present) {
      map['owner_user_id'] = Variable<String>(ownerUserId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (isRest.present) {
      map['is_rest'] = Variable<bool>(isRest.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DayTypesCompanion(')
          ..write('id: $id, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('name: $name, ')
          ..write('isRest: $isRest, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DayTypeExercisesTable extends DayTypeExercises
    with TableInfo<$DayTypeExercisesTable, DayTypeExercise> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DayTypeExercisesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ownerUserIdMeta = const VerificationMeta(
    'ownerUserId',
  );
  @override
  late final GeneratedColumn<String> ownerUserId = GeneratedColumn<String>(
    'owner_user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _dayTypeIdMeta = const VerificationMeta(
    'dayTypeId',
  );
  @override
  late final GeneratedColumn<String> dayTypeId = GeneratedColumn<String>(
    'day_type_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES day_types (id)',
    ),
  );
  static const VerificationMeta _exerciseIdMeta = const VerificationMeta(
    'exerciseId',
  );
  @override
  late final GeneratedColumn<String> exerciseId = GeneratedColumn<String>(
    'exercise_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES exercises (id)',
    ),
  );
  static const VerificationMeta _positionMeta = const VerificationMeta(
    'position',
  );
  @override
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
    'position',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _targetRepMinMeta = const VerificationMeta(
    'targetRepMin',
  );
  @override
  late final GeneratedColumn<int> targetRepMin = GeneratedColumn<int>(
    'target_rep_min',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _targetRepMaxMeta = const VerificationMeta(
    'targetRepMax',
  );
  @override
  late final GeneratedColumn<int> targetRepMax = GeneratedColumn<int>(
    'target_rep_max',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _supersetGroupIdMeta = const VerificationMeta(
    'supersetGroupId',
  );
  @override
  late final GeneratedColumn<String> supersetGroupId = GeneratedColumn<String>(
    'superset_group_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    ownerUserId,
    dayTypeId,
    exerciseId,
    position,
    targetRepMin,
    targetRepMax,
    supersetGroupId,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'day_type_exercises';
  @override
  VerificationContext validateIntegrity(
    Insertable<DayTypeExercise> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('owner_user_id')) {
      context.handle(
        _ownerUserIdMeta,
        ownerUserId.isAcceptableOrUnknown(
          data['owner_user_id']!,
          _ownerUserIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_ownerUserIdMeta);
    }
    if (data.containsKey('day_type_id')) {
      context.handle(
        _dayTypeIdMeta,
        dayTypeId.isAcceptableOrUnknown(data['day_type_id']!, _dayTypeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_dayTypeIdMeta);
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
        _exerciseIdMeta,
        exerciseId.isAcceptableOrUnknown(data['exercise_id']!, _exerciseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
    }
    if (data.containsKey('position')) {
      context.handle(
        _positionMeta,
        position.isAcceptableOrUnknown(data['position']!, _positionMeta),
      );
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('target_rep_min')) {
      context.handle(
        _targetRepMinMeta,
        targetRepMin.isAcceptableOrUnknown(
          data['target_rep_min']!,
          _targetRepMinMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_targetRepMinMeta);
    }
    if (data.containsKey('target_rep_max')) {
      context.handle(
        _targetRepMaxMeta,
        targetRepMax.isAcceptableOrUnknown(
          data['target_rep_max']!,
          _targetRepMaxMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_targetRepMaxMeta);
    }
    if (data.containsKey('superset_group_id')) {
      context.handle(
        _supersetGroupIdMeta,
        supersetGroupId.isAcceptableOrUnknown(
          data['superset_group_id']!,
          _supersetGroupIdMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {dayTypeId, position},
  ];
  @override
  DayTypeExercise map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DayTypeExercise(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      ownerUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_user_id'],
      )!,
      dayTypeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}day_type_id'],
      )!,
      exerciseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exercise_id'],
      )!,
      position: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}position'],
      )!,
      targetRepMin: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}target_rep_min'],
      )!,
      targetRepMax: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}target_rep_max'],
      )!,
      supersetGroupId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}superset_group_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $DayTypeExercisesTable createAlias(String alias) {
    return $DayTypeExercisesTable(attachedDatabase, alias);
  }
}

class DayTypeExercise extends DataClass implements Insertable<DayTypeExercise> {
  final String id;
  final String ownerUserId;
  final String dayTypeId;
  final String exerciseId;
  final int position;
  final int targetRepMin;
  final int targetRepMax;
  final String? supersetGroupId;
  final int createdAt;
  final int updatedAt;
  const DayTypeExercise({
    required this.id,
    required this.ownerUserId,
    required this.dayTypeId,
    required this.exerciseId,
    required this.position,
    required this.targetRepMin,
    required this.targetRepMax,
    this.supersetGroupId,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['owner_user_id'] = Variable<String>(ownerUserId);
    map['day_type_id'] = Variable<String>(dayTypeId);
    map['exercise_id'] = Variable<String>(exerciseId);
    map['position'] = Variable<int>(position);
    map['target_rep_min'] = Variable<int>(targetRepMin);
    map['target_rep_max'] = Variable<int>(targetRepMax);
    if (!nullToAbsent || supersetGroupId != null) {
      map['superset_group_id'] = Variable<String>(supersetGroupId);
    }
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  DayTypeExercisesCompanion toCompanion(bool nullToAbsent) {
    return DayTypeExercisesCompanion(
      id: Value(id),
      ownerUserId: Value(ownerUserId),
      dayTypeId: Value(dayTypeId),
      exerciseId: Value(exerciseId),
      position: Value(position),
      targetRepMin: Value(targetRepMin),
      targetRepMax: Value(targetRepMax),
      supersetGroupId: supersetGroupId == null && nullToAbsent
          ? const Value.absent()
          : Value(supersetGroupId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory DayTypeExercise.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DayTypeExercise(
      id: serializer.fromJson<String>(json['id']),
      ownerUserId: serializer.fromJson<String>(json['ownerUserId']),
      dayTypeId: serializer.fromJson<String>(json['dayTypeId']),
      exerciseId: serializer.fromJson<String>(json['exerciseId']),
      position: serializer.fromJson<int>(json['position']),
      targetRepMin: serializer.fromJson<int>(json['targetRepMin']),
      targetRepMax: serializer.fromJson<int>(json['targetRepMax']),
      supersetGroupId: serializer.fromJson<String?>(json['supersetGroupId']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'ownerUserId': serializer.toJson<String>(ownerUserId),
      'dayTypeId': serializer.toJson<String>(dayTypeId),
      'exerciseId': serializer.toJson<String>(exerciseId),
      'position': serializer.toJson<int>(position),
      'targetRepMin': serializer.toJson<int>(targetRepMin),
      'targetRepMax': serializer.toJson<int>(targetRepMax),
      'supersetGroupId': serializer.toJson<String?>(supersetGroupId),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  DayTypeExercise copyWith({
    String? id,
    String? ownerUserId,
    String? dayTypeId,
    String? exerciseId,
    int? position,
    int? targetRepMin,
    int? targetRepMax,
    Value<String?> supersetGroupId = const Value.absent(),
    int? createdAt,
    int? updatedAt,
  }) => DayTypeExercise(
    id: id ?? this.id,
    ownerUserId: ownerUserId ?? this.ownerUserId,
    dayTypeId: dayTypeId ?? this.dayTypeId,
    exerciseId: exerciseId ?? this.exerciseId,
    position: position ?? this.position,
    targetRepMin: targetRepMin ?? this.targetRepMin,
    targetRepMax: targetRepMax ?? this.targetRepMax,
    supersetGroupId: supersetGroupId.present
        ? supersetGroupId.value
        : this.supersetGroupId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  DayTypeExercise copyWithCompanion(DayTypeExercisesCompanion data) {
    return DayTypeExercise(
      id: data.id.present ? data.id.value : this.id,
      ownerUserId: data.ownerUserId.present
          ? data.ownerUserId.value
          : this.ownerUserId,
      dayTypeId: data.dayTypeId.present ? data.dayTypeId.value : this.dayTypeId,
      exerciseId: data.exerciseId.present
          ? data.exerciseId.value
          : this.exerciseId,
      position: data.position.present ? data.position.value : this.position,
      targetRepMin: data.targetRepMin.present
          ? data.targetRepMin.value
          : this.targetRepMin,
      targetRepMax: data.targetRepMax.present
          ? data.targetRepMax.value
          : this.targetRepMax,
      supersetGroupId: data.supersetGroupId.present
          ? data.supersetGroupId.value
          : this.supersetGroupId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DayTypeExercise(')
          ..write('id: $id, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('dayTypeId: $dayTypeId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('position: $position, ')
          ..write('targetRepMin: $targetRepMin, ')
          ..write('targetRepMax: $targetRepMax, ')
          ..write('supersetGroupId: $supersetGroupId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    ownerUserId,
    dayTypeId,
    exerciseId,
    position,
    targetRepMin,
    targetRepMax,
    supersetGroupId,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DayTypeExercise &&
          other.id == this.id &&
          other.ownerUserId == this.ownerUserId &&
          other.dayTypeId == this.dayTypeId &&
          other.exerciseId == this.exerciseId &&
          other.position == this.position &&
          other.targetRepMin == this.targetRepMin &&
          other.targetRepMax == this.targetRepMax &&
          other.supersetGroupId == this.supersetGroupId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class DayTypeExercisesCompanion extends UpdateCompanion<DayTypeExercise> {
  final Value<String> id;
  final Value<String> ownerUserId;
  final Value<String> dayTypeId;
  final Value<String> exerciseId;
  final Value<int> position;
  final Value<int> targetRepMin;
  final Value<int> targetRepMax;
  final Value<String?> supersetGroupId;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int> rowid;
  const DayTypeExercisesCompanion({
    this.id = const Value.absent(),
    this.ownerUserId = const Value.absent(),
    this.dayTypeId = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.position = const Value.absent(),
    this.targetRepMin = const Value.absent(),
    this.targetRepMax = const Value.absent(),
    this.supersetGroupId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DayTypeExercisesCompanion.insert({
    required String id,
    required String ownerUserId,
    required String dayTypeId,
    required String exerciseId,
    required int position,
    required int targetRepMin,
    required int targetRepMax,
    this.supersetGroupId = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       ownerUserId = Value(ownerUserId),
       dayTypeId = Value(dayTypeId),
       exerciseId = Value(exerciseId),
       position = Value(position),
       targetRepMin = Value(targetRepMin),
       targetRepMax = Value(targetRepMax),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<DayTypeExercise> custom({
    Expression<String>? id,
    Expression<String>? ownerUserId,
    Expression<String>? dayTypeId,
    Expression<String>? exerciseId,
    Expression<int>? position,
    Expression<int>? targetRepMin,
    Expression<int>? targetRepMax,
    Expression<String>? supersetGroupId,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ownerUserId != null) 'owner_user_id': ownerUserId,
      if (dayTypeId != null) 'day_type_id': dayTypeId,
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (position != null) 'position': position,
      if (targetRepMin != null) 'target_rep_min': targetRepMin,
      if (targetRepMax != null) 'target_rep_max': targetRepMax,
      if (supersetGroupId != null) 'superset_group_id': supersetGroupId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DayTypeExercisesCompanion copyWith({
    Value<String>? id,
    Value<String>? ownerUserId,
    Value<String>? dayTypeId,
    Value<String>? exerciseId,
    Value<int>? position,
    Value<int>? targetRepMin,
    Value<int>? targetRepMax,
    Value<String?>? supersetGroupId,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int>? rowid,
  }) {
    return DayTypeExercisesCompanion(
      id: id ?? this.id,
      ownerUserId: ownerUserId ?? this.ownerUserId,
      dayTypeId: dayTypeId ?? this.dayTypeId,
      exerciseId: exerciseId ?? this.exerciseId,
      position: position ?? this.position,
      targetRepMin: targetRepMin ?? this.targetRepMin,
      targetRepMax: targetRepMax ?? this.targetRepMax,
      supersetGroupId: supersetGroupId ?? this.supersetGroupId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (ownerUserId.present) {
      map['owner_user_id'] = Variable<String>(ownerUserId.value);
    }
    if (dayTypeId.present) {
      map['day_type_id'] = Variable<String>(dayTypeId.value);
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<String>(exerciseId.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (targetRepMin.present) {
      map['target_rep_min'] = Variable<int>(targetRepMin.value);
    }
    if (targetRepMax.present) {
      map['target_rep_max'] = Variable<int>(targetRepMax.value);
    }
    if (supersetGroupId.present) {
      map['superset_group_id'] = Variable<String>(supersetGroupId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DayTypeExercisesCompanion(')
          ..write('id: $id, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('dayTypeId: $dayTypeId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('position: $position, ')
          ..write('targetRepMin: $targetRepMin, ')
          ..write('targetRepMax: $targetRepMax, ')
          ..write('supersetGroupId: $supersetGroupId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RoutinePatternsTable extends RoutinePatterns
    with TableInfo<$RoutinePatternsTable, RoutinePattern> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoutinePatternsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ownerUserIdMeta = const VerificationMeta(
    'ownerUserId',
  );
  @override
  late final GeneratedColumn<String> ownerUserId = GeneratedColumn<String>(
    'owner_user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'UNIQUE REFERENCES users (id)',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<PatternMode, String> mode =
      GeneratedColumn<String>(
        'mode',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<PatternMode>($RoutinePatternsTable.$convertermode);
  static const VerificationMeta _cyclicPositionMeta = const VerificationMeta(
    'cyclicPosition',
  );
  @override
  late final GeneratedColumn<int> cyclicPosition = GeneratedColumn<int>(
    'cyclic_position',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    ownerUserId,
    mode,
    cyclicPosition,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'routine_patterns';
  @override
  VerificationContext validateIntegrity(
    Insertable<RoutinePattern> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('owner_user_id')) {
      context.handle(
        _ownerUserIdMeta,
        ownerUserId.isAcceptableOrUnknown(
          data['owner_user_id']!,
          _ownerUserIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_ownerUserIdMeta);
    }
    if (data.containsKey('cyclic_position')) {
      context.handle(
        _cyclicPositionMeta,
        cyclicPosition.isAcceptableOrUnknown(
          data['cyclic_position']!,
          _cyclicPositionMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoutinePattern map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoutinePattern(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      ownerUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_user_id'],
      )!,
      mode: $RoutinePatternsTable.$convertermode.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}mode'],
        )!,
      ),
      cyclicPosition: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cyclic_position'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $RoutinePatternsTable createAlias(String alias) {
    return $RoutinePatternsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<PatternMode, String, String> $convertermode =
      const EnumNameConverter<PatternMode>(PatternMode.values);
}

class RoutinePattern extends DataClass implements Insertable<RoutinePattern> {
  final String id;
  final String ownerUserId;
  final PatternMode mode;
  final int? cyclicPosition;
  final int createdAt;
  final int updatedAt;
  const RoutinePattern({
    required this.id,
    required this.ownerUserId,
    required this.mode,
    this.cyclicPosition,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['owner_user_id'] = Variable<String>(ownerUserId);
    {
      map['mode'] = Variable<String>(
        $RoutinePatternsTable.$convertermode.toSql(mode),
      );
    }
    if (!nullToAbsent || cyclicPosition != null) {
      map['cyclic_position'] = Variable<int>(cyclicPosition);
    }
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  RoutinePatternsCompanion toCompanion(bool nullToAbsent) {
    return RoutinePatternsCompanion(
      id: Value(id),
      ownerUserId: Value(ownerUserId),
      mode: Value(mode),
      cyclicPosition: cyclicPosition == null && nullToAbsent
          ? const Value.absent()
          : Value(cyclicPosition),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory RoutinePattern.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoutinePattern(
      id: serializer.fromJson<String>(json['id']),
      ownerUserId: serializer.fromJson<String>(json['ownerUserId']),
      mode: $RoutinePatternsTable.$convertermode.fromJson(
        serializer.fromJson<String>(json['mode']),
      ),
      cyclicPosition: serializer.fromJson<int?>(json['cyclicPosition']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'ownerUserId': serializer.toJson<String>(ownerUserId),
      'mode': serializer.toJson<String>(
        $RoutinePatternsTable.$convertermode.toJson(mode),
      ),
      'cyclicPosition': serializer.toJson<int?>(cyclicPosition),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  RoutinePattern copyWith({
    String? id,
    String? ownerUserId,
    PatternMode? mode,
    Value<int?> cyclicPosition = const Value.absent(),
    int? createdAt,
    int? updatedAt,
  }) => RoutinePattern(
    id: id ?? this.id,
    ownerUserId: ownerUserId ?? this.ownerUserId,
    mode: mode ?? this.mode,
    cyclicPosition: cyclicPosition.present
        ? cyclicPosition.value
        : this.cyclicPosition,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  RoutinePattern copyWithCompanion(RoutinePatternsCompanion data) {
    return RoutinePattern(
      id: data.id.present ? data.id.value : this.id,
      ownerUserId: data.ownerUserId.present
          ? data.ownerUserId.value
          : this.ownerUserId,
      mode: data.mode.present ? data.mode.value : this.mode,
      cyclicPosition: data.cyclicPosition.present
          ? data.cyclicPosition.value
          : this.cyclicPosition,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoutinePattern(')
          ..write('id: $id, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('mode: $mode, ')
          ..write('cyclicPosition: $cyclicPosition, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, ownerUserId, mode, cyclicPosition, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoutinePattern &&
          other.id == this.id &&
          other.ownerUserId == this.ownerUserId &&
          other.mode == this.mode &&
          other.cyclicPosition == this.cyclicPosition &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class RoutinePatternsCompanion extends UpdateCompanion<RoutinePattern> {
  final Value<String> id;
  final Value<String> ownerUserId;
  final Value<PatternMode> mode;
  final Value<int?> cyclicPosition;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int> rowid;
  const RoutinePatternsCompanion({
    this.id = const Value.absent(),
    this.ownerUserId = const Value.absent(),
    this.mode = const Value.absent(),
    this.cyclicPosition = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RoutinePatternsCompanion.insert({
    required String id,
    required String ownerUserId,
    required PatternMode mode,
    this.cyclicPosition = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       ownerUserId = Value(ownerUserId),
       mode = Value(mode),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<RoutinePattern> custom({
    Expression<String>? id,
    Expression<String>? ownerUserId,
    Expression<String>? mode,
    Expression<int>? cyclicPosition,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ownerUserId != null) 'owner_user_id': ownerUserId,
      if (mode != null) 'mode': mode,
      if (cyclicPosition != null) 'cyclic_position': cyclicPosition,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RoutinePatternsCompanion copyWith({
    Value<String>? id,
    Value<String>? ownerUserId,
    Value<PatternMode>? mode,
    Value<int?>? cyclicPosition,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int>? rowid,
  }) {
    return RoutinePatternsCompanion(
      id: id ?? this.id,
      ownerUserId: ownerUserId ?? this.ownerUserId,
      mode: mode ?? this.mode,
      cyclicPosition: cyclicPosition ?? this.cyclicPosition,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (ownerUserId.present) {
      map['owner_user_id'] = Variable<String>(ownerUserId.value);
    }
    if (mode.present) {
      map['mode'] = Variable<String>(
        $RoutinePatternsTable.$convertermode.toSql(mode.value),
      );
    }
    if (cyclicPosition.present) {
      map['cyclic_position'] = Variable<int>(cyclicPosition.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoutinePatternsCompanion(')
          ..write('id: $id, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('mode: $mode, ')
          ..write('cyclicPosition: $cyclicPosition, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WeeklyPatternSlotsTable extends WeeklyPatternSlots
    with TableInfo<$WeeklyPatternSlotsTable, WeeklyPatternSlot> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WeeklyPatternSlotsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _patternIdMeta = const VerificationMeta(
    'patternId',
  );
  @override
  late final GeneratedColumn<String> patternId = GeneratedColumn<String>(
    'pattern_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES routine_patterns (id)',
    ),
  );
  static const VerificationMeta _dayOfWeekMeta = const VerificationMeta(
    'dayOfWeek',
  );
  @override
  late final GeneratedColumn<int> dayOfWeek = GeneratedColumn<int>(
    'day_of_week',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dayTypeIdMeta = const VerificationMeta(
    'dayTypeId',
  );
  @override
  late final GeneratedColumn<String> dayTypeId = GeneratedColumn<String>(
    'day_type_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES day_types (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, patternId, dayOfWeek, dayTypeId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'weekly_pattern_slots';
  @override
  VerificationContext validateIntegrity(
    Insertable<WeeklyPatternSlot> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pattern_id')) {
      context.handle(
        _patternIdMeta,
        patternId.isAcceptableOrUnknown(data['pattern_id']!, _patternIdMeta),
      );
    } else if (isInserting) {
      context.missing(_patternIdMeta);
    }
    if (data.containsKey('day_of_week')) {
      context.handle(
        _dayOfWeekMeta,
        dayOfWeek.isAcceptableOrUnknown(data['day_of_week']!, _dayOfWeekMeta),
      );
    } else if (isInserting) {
      context.missing(_dayOfWeekMeta);
    }
    if (data.containsKey('day_type_id')) {
      context.handle(
        _dayTypeIdMeta,
        dayTypeId.isAcceptableOrUnknown(data['day_type_id']!, _dayTypeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_dayTypeIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {patternId, dayOfWeek},
  ];
  @override
  WeeklyPatternSlot map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WeeklyPatternSlot(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      patternId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pattern_id'],
      )!,
      dayOfWeek: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}day_of_week'],
      )!,
      dayTypeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}day_type_id'],
      )!,
    );
  }

  @override
  $WeeklyPatternSlotsTable createAlias(String alias) {
    return $WeeklyPatternSlotsTable(attachedDatabase, alias);
  }
}

class WeeklyPatternSlot extends DataClass
    implements Insertable<WeeklyPatternSlot> {
  final String id;
  final String patternId;
  final int dayOfWeek;
  final String dayTypeId;
  const WeeklyPatternSlot({
    required this.id,
    required this.patternId,
    required this.dayOfWeek,
    required this.dayTypeId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['pattern_id'] = Variable<String>(patternId);
    map['day_of_week'] = Variable<int>(dayOfWeek);
    map['day_type_id'] = Variable<String>(dayTypeId);
    return map;
  }

  WeeklyPatternSlotsCompanion toCompanion(bool nullToAbsent) {
    return WeeklyPatternSlotsCompanion(
      id: Value(id),
      patternId: Value(patternId),
      dayOfWeek: Value(dayOfWeek),
      dayTypeId: Value(dayTypeId),
    );
  }

  factory WeeklyPatternSlot.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WeeklyPatternSlot(
      id: serializer.fromJson<String>(json['id']),
      patternId: serializer.fromJson<String>(json['patternId']),
      dayOfWeek: serializer.fromJson<int>(json['dayOfWeek']),
      dayTypeId: serializer.fromJson<String>(json['dayTypeId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'patternId': serializer.toJson<String>(patternId),
      'dayOfWeek': serializer.toJson<int>(dayOfWeek),
      'dayTypeId': serializer.toJson<String>(dayTypeId),
    };
  }

  WeeklyPatternSlot copyWith({
    String? id,
    String? patternId,
    int? dayOfWeek,
    String? dayTypeId,
  }) => WeeklyPatternSlot(
    id: id ?? this.id,
    patternId: patternId ?? this.patternId,
    dayOfWeek: dayOfWeek ?? this.dayOfWeek,
    dayTypeId: dayTypeId ?? this.dayTypeId,
  );
  WeeklyPatternSlot copyWithCompanion(WeeklyPatternSlotsCompanion data) {
    return WeeklyPatternSlot(
      id: data.id.present ? data.id.value : this.id,
      patternId: data.patternId.present ? data.patternId.value : this.patternId,
      dayOfWeek: data.dayOfWeek.present ? data.dayOfWeek.value : this.dayOfWeek,
      dayTypeId: data.dayTypeId.present ? data.dayTypeId.value : this.dayTypeId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WeeklyPatternSlot(')
          ..write('id: $id, ')
          ..write('patternId: $patternId, ')
          ..write('dayOfWeek: $dayOfWeek, ')
          ..write('dayTypeId: $dayTypeId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, patternId, dayOfWeek, dayTypeId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WeeklyPatternSlot &&
          other.id == this.id &&
          other.patternId == this.patternId &&
          other.dayOfWeek == this.dayOfWeek &&
          other.dayTypeId == this.dayTypeId);
}

class WeeklyPatternSlotsCompanion extends UpdateCompanion<WeeklyPatternSlot> {
  final Value<String> id;
  final Value<String> patternId;
  final Value<int> dayOfWeek;
  final Value<String> dayTypeId;
  final Value<int> rowid;
  const WeeklyPatternSlotsCompanion({
    this.id = const Value.absent(),
    this.patternId = const Value.absent(),
    this.dayOfWeek = const Value.absent(),
    this.dayTypeId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WeeklyPatternSlotsCompanion.insert({
    required String id,
    required String patternId,
    required int dayOfWeek,
    required String dayTypeId,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       patternId = Value(patternId),
       dayOfWeek = Value(dayOfWeek),
       dayTypeId = Value(dayTypeId);
  static Insertable<WeeklyPatternSlot> custom({
    Expression<String>? id,
    Expression<String>? patternId,
    Expression<int>? dayOfWeek,
    Expression<String>? dayTypeId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (patternId != null) 'pattern_id': patternId,
      if (dayOfWeek != null) 'day_of_week': dayOfWeek,
      if (dayTypeId != null) 'day_type_id': dayTypeId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WeeklyPatternSlotsCompanion copyWith({
    Value<String>? id,
    Value<String>? patternId,
    Value<int>? dayOfWeek,
    Value<String>? dayTypeId,
    Value<int>? rowid,
  }) {
    return WeeklyPatternSlotsCompanion(
      id: id ?? this.id,
      patternId: patternId ?? this.patternId,
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      dayTypeId: dayTypeId ?? this.dayTypeId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (patternId.present) {
      map['pattern_id'] = Variable<String>(patternId.value);
    }
    if (dayOfWeek.present) {
      map['day_of_week'] = Variable<int>(dayOfWeek.value);
    }
    if (dayTypeId.present) {
      map['day_type_id'] = Variable<String>(dayTypeId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WeeklyPatternSlotsCompanion(')
          ..write('id: $id, ')
          ..write('patternId: $patternId, ')
          ..write('dayOfWeek: $dayOfWeek, ')
          ..write('dayTypeId: $dayTypeId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CyclicPatternSlotsTable extends CyclicPatternSlots
    with TableInfo<$CyclicPatternSlotsTable, CyclicPatternSlot> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CyclicPatternSlotsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _patternIdMeta = const VerificationMeta(
    'patternId',
  );
  @override
  late final GeneratedColumn<String> patternId = GeneratedColumn<String>(
    'pattern_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES routine_patterns (id)',
    ),
  );
  static const VerificationMeta _positionMeta = const VerificationMeta(
    'position',
  );
  @override
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
    'position',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dayTypeIdMeta = const VerificationMeta(
    'dayTypeId',
  );
  @override
  late final GeneratedColumn<String> dayTypeId = GeneratedColumn<String>(
    'day_type_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES day_types (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, patternId, position, dayTypeId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cyclic_pattern_slots';
  @override
  VerificationContext validateIntegrity(
    Insertable<CyclicPatternSlot> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pattern_id')) {
      context.handle(
        _patternIdMeta,
        patternId.isAcceptableOrUnknown(data['pattern_id']!, _patternIdMeta),
      );
    } else if (isInserting) {
      context.missing(_patternIdMeta);
    }
    if (data.containsKey('position')) {
      context.handle(
        _positionMeta,
        position.isAcceptableOrUnknown(data['position']!, _positionMeta),
      );
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('day_type_id')) {
      context.handle(
        _dayTypeIdMeta,
        dayTypeId.isAcceptableOrUnknown(data['day_type_id']!, _dayTypeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_dayTypeIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {patternId, position},
  ];
  @override
  CyclicPatternSlot map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CyclicPatternSlot(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      patternId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pattern_id'],
      )!,
      position: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}position'],
      )!,
      dayTypeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}day_type_id'],
      )!,
    );
  }

  @override
  $CyclicPatternSlotsTable createAlias(String alias) {
    return $CyclicPatternSlotsTable(attachedDatabase, alias);
  }
}

class CyclicPatternSlot extends DataClass
    implements Insertable<CyclicPatternSlot> {
  final String id;
  final String patternId;
  final int position;
  final String dayTypeId;
  const CyclicPatternSlot({
    required this.id,
    required this.patternId,
    required this.position,
    required this.dayTypeId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['pattern_id'] = Variable<String>(patternId);
    map['position'] = Variable<int>(position);
    map['day_type_id'] = Variable<String>(dayTypeId);
    return map;
  }

  CyclicPatternSlotsCompanion toCompanion(bool nullToAbsent) {
    return CyclicPatternSlotsCompanion(
      id: Value(id),
      patternId: Value(patternId),
      position: Value(position),
      dayTypeId: Value(dayTypeId),
    );
  }

  factory CyclicPatternSlot.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CyclicPatternSlot(
      id: serializer.fromJson<String>(json['id']),
      patternId: serializer.fromJson<String>(json['patternId']),
      position: serializer.fromJson<int>(json['position']),
      dayTypeId: serializer.fromJson<String>(json['dayTypeId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'patternId': serializer.toJson<String>(patternId),
      'position': serializer.toJson<int>(position),
      'dayTypeId': serializer.toJson<String>(dayTypeId),
    };
  }

  CyclicPatternSlot copyWith({
    String? id,
    String? patternId,
    int? position,
    String? dayTypeId,
  }) => CyclicPatternSlot(
    id: id ?? this.id,
    patternId: patternId ?? this.patternId,
    position: position ?? this.position,
    dayTypeId: dayTypeId ?? this.dayTypeId,
  );
  CyclicPatternSlot copyWithCompanion(CyclicPatternSlotsCompanion data) {
    return CyclicPatternSlot(
      id: data.id.present ? data.id.value : this.id,
      patternId: data.patternId.present ? data.patternId.value : this.patternId,
      position: data.position.present ? data.position.value : this.position,
      dayTypeId: data.dayTypeId.present ? data.dayTypeId.value : this.dayTypeId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CyclicPatternSlot(')
          ..write('id: $id, ')
          ..write('patternId: $patternId, ')
          ..write('position: $position, ')
          ..write('dayTypeId: $dayTypeId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, patternId, position, dayTypeId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CyclicPatternSlot &&
          other.id == this.id &&
          other.patternId == this.patternId &&
          other.position == this.position &&
          other.dayTypeId == this.dayTypeId);
}

class CyclicPatternSlotsCompanion extends UpdateCompanion<CyclicPatternSlot> {
  final Value<String> id;
  final Value<String> patternId;
  final Value<int> position;
  final Value<String> dayTypeId;
  final Value<int> rowid;
  const CyclicPatternSlotsCompanion({
    this.id = const Value.absent(),
    this.patternId = const Value.absent(),
    this.position = const Value.absent(),
    this.dayTypeId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CyclicPatternSlotsCompanion.insert({
    required String id,
    required String patternId,
    required int position,
    required String dayTypeId,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       patternId = Value(patternId),
       position = Value(position),
       dayTypeId = Value(dayTypeId);
  static Insertable<CyclicPatternSlot> custom({
    Expression<String>? id,
    Expression<String>? patternId,
    Expression<int>? position,
    Expression<String>? dayTypeId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (patternId != null) 'pattern_id': patternId,
      if (position != null) 'position': position,
      if (dayTypeId != null) 'day_type_id': dayTypeId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CyclicPatternSlotsCompanion copyWith({
    Value<String>? id,
    Value<String>? patternId,
    Value<int>? position,
    Value<String>? dayTypeId,
    Value<int>? rowid,
  }) {
    return CyclicPatternSlotsCompanion(
      id: id ?? this.id,
      patternId: patternId ?? this.patternId,
      position: position ?? this.position,
      dayTypeId: dayTypeId ?? this.dayTypeId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (patternId.present) {
      map['pattern_id'] = Variable<String>(patternId.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (dayTypeId.present) {
      map['day_type_id'] = Variable<String>(dayTypeId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CyclicPatternSlotsCompanion(')
          ..write('id: $id, ')
          ..write('patternId: $patternId, ')
          ..write('position: $position, ')
          ..write('dayTypeId: $dayTypeId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DayOverridesTable extends DayOverrides
    with TableInfo<$DayOverridesTable, DayOverride> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DayOverridesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ownerUserIdMeta = const VerificationMeta(
    'ownerUserId',
  );
  @override
  late final GeneratedColumn<String> ownerUserId = GeneratedColumn<String>(
    'owner_user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dayTypeIdMeta = const VerificationMeta(
    'dayTypeId',
  );
  @override
  late final GeneratedColumn<String> dayTypeId = GeneratedColumn<String>(
    'day_type_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES day_types (id)',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    ownerUserId,
    date,
    dayTypeId,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'day_overrides';
  @override
  VerificationContext validateIntegrity(
    Insertable<DayOverride> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('owner_user_id')) {
      context.handle(
        _ownerUserIdMeta,
        ownerUserId.isAcceptableOrUnknown(
          data['owner_user_id']!,
          _ownerUserIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_ownerUserIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('day_type_id')) {
      context.handle(
        _dayTypeIdMeta,
        dayTypeId.isAcceptableOrUnknown(data['day_type_id']!, _dayTypeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_dayTypeIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {ownerUserId, date},
  ];
  @override
  DayOverride map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DayOverride(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      ownerUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_user_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date'],
      )!,
      dayTypeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}day_type_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $DayOverridesTable createAlias(String alias) {
    return $DayOverridesTable(attachedDatabase, alias);
  }
}

class DayOverride extends DataClass implements Insertable<DayOverride> {
  final String id;
  final String ownerUserId;
  final String date;
  final String dayTypeId;
  final int createdAt;
  final int updatedAt;
  const DayOverride({
    required this.id,
    required this.ownerUserId,
    required this.date,
    required this.dayTypeId,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['owner_user_id'] = Variable<String>(ownerUserId);
    map['date'] = Variable<String>(date);
    map['day_type_id'] = Variable<String>(dayTypeId);
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  DayOverridesCompanion toCompanion(bool nullToAbsent) {
    return DayOverridesCompanion(
      id: Value(id),
      ownerUserId: Value(ownerUserId),
      date: Value(date),
      dayTypeId: Value(dayTypeId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory DayOverride.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DayOverride(
      id: serializer.fromJson<String>(json['id']),
      ownerUserId: serializer.fromJson<String>(json['ownerUserId']),
      date: serializer.fromJson<String>(json['date']),
      dayTypeId: serializer.fromJson<String>(json['dayTypeId']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'ownerUserId': serializer.toJson<String>(ownerUserId),
      'date': serializer.toJson<String>(date),
      'dayTypeId': serializer.toJson<String>(dayTypeId),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  DayOverride copyWith({
    String? id,
    String? ownerUserId,
    String? date,
    String? dayTypeId,
    int? createdAt,
    int? updatedAt,
  }) => DayOverride(
    id: id ?? this.id,
    ownerUserId: ownerUserId ?? this.ownerUserId,
    date: date ?? this.date,
    dayTypeId: dayTypeId ?? this.dayTypeId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  DayOverride copyWithCompanion(DayOverridesCompanion data) {
    return DayOverride(
      id: data.id.present ? data.id.value : this.id,
      ownerUserId: data.ownerUserId.present
          ? data.ownerUserId.value
          : this.ownerUserId,
      date: data.date.present ? data.date.value : this.date,
      dayTypeId: data.dayTypeId.present ? data.dayTypeId.value : this.dayTypeId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DayOverride(')
          ..write('id: $id, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('date: $date, ')
          ..write('dayTypeId: $dayTypeId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, ownerUserId, date, dayTypeId, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DayOverride &&
          other.id == this.id &&
          other.ownerUserId == this.ownerUserId &&
          other.date == this.date &&
          other.dayTypeId == this.dayTypeId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class DayOverridesCompanion extends UpdateCompanion<DayOverride> {
  final Value<String> id;
  final Value<String> ownerUserId;
  final Value<String> date;
  final Value<String> dayTypeId;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int> rowid;
  const DayOverridesCompanion({
    this.id = const Value.absent(),
    this.ownerUserId = const Value.absent(),
    this.date = const Value.absent(),
    this.dayTypeId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DayOverridesCompanion.insert({
    required String id,
    required String ownerUserId,
    required String date,
    required String dayTypeId,
    required int createdAt,
    required int updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       ownerUserId = Value(ownerUserId),
       date = Value(date),
       dayTypeId = Value(dayTypeId),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<DayOverride> custom({
    Expression<String>? id,
    Expression<String>? ownerUserId,
    Expression<String>? date,
    Expression<String>? dayTypeId,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ownerUserId != null) 'owner_user_id': ownerUserId,
      if (date != null) 'date': date,
      if (dayTypeId != null) 'day_type_id': dayTypeId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DayOverridesCompanion copyWith({
    Value<String>? id,
    Value<String>? ownerUserId,
    Value<String>? date,
    Value<String>? dayTypeId,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int>? rowid,
  }) {
    return DayOverridesCompanion(
      id: id ?? this.id,
      ownerUserId: ownerUserId ?? this.ownerUserId,
      date: date ?? this.date,
      dayTypeId: dayTypeId ?? this.dayTypeId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (ownerUserId.present) {
      map['owner_user_id'] = Variable<String>(ownerUserId.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (dayTypeId.present) {
      map['day_type_id'] = Variable<String>(dayTypeId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DayOverridesCompanion(')
          ..write('id: $id, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('date: $date, ')
          ..write('dayTypeId: $dayTypeId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WorkoutSessionsTable extends WorkoutSessions
    with TableInfo<$WorkoutSessionsTable, WorkoutSession> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutSessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ownerUserIdMeta = const VerificationMeta(
    'ownerUserId',
  );
  @override
  late final GeneratedColumn<String> ownerUserId = GeneratedColumn<String>(
    'owner_user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _dayTypeIdMeta = const VerificationMeta(
    'dayTypeId',
  );
  @override
  late final GeneratedColumn<String> dayTypeId = GeneratedColumn<String>(
    'day_type_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES day_types (id)',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<SessionStatus, String> status =
      GeneratedColumn<String>(
        'status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<SessionStatus>($WorkoutSessionsTable.$converterstatus);
  static const VerificationMeta _startedAtMeta = const VerificationMeta(
    'startedAt',
  );
  @override
  late final GeneratedColumn<int> startedAt = GeneratedColumn<int>(
    'started_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endedAtMeta = const VerificationMeta(
    'endedAt',
  );
  @override
  late final GeneratedColumn<int> endedAt = GeneratedColumn<int>(
    'ended_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _durationSecondsMeta = const VerificationMeta(
    'durationSeconds',
  );
  @override
  late final GeneratedColumn<int> durationSeconds = GeneratedColumn<int>(
    'duration_seconds',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    ownerUserId,
    dayTypeId,
    status,
    startedAt,
    endedAt,
    durationSeconds,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workout_sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<WorkoutSession> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('owner_user_id')) {
      context.handle(
        _ownerUserIdMeta,
        ownerUserId.isAcceptableOrUnknown(
          data['owner_user_id']!,
          _ownerUserIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_ownerUserIdMeta);
    }
    if (data.containsKey('day_type_id')) {
      context.handle(
        _dayTypeIdMeta,
        dayTypeId.isAcceptableOrUnknown(data['day_type_id']!, _dayTypeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_dayTypeIdMeta);
    }
    if (data.containsKey('started_at')) {
      context.handle(
        _startedAtMeta,
        startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('ended_at')) {
      context.handle(
        _endedAtMeta,
        endedAt.isAcceptableOrUnknown(data['ended_at']!, _endedAtMeta),
      );
    }
    if (data.containsKey('duration_seconds')) {
      context.handle(
        _durationSecondsMeta,
        durationSeconds.isAcceptableOrUnknown(
          data['duration_seconds']!,
          _durationSecondsMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkoutSession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutSession(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      ownerUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_user_id'],
      )!,
      dayTypeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}day_type_id'],
      )!,
      status: $WorkoutSessionsTable.$converterstatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}status'],
        )!,
      ),
      startedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}started_at'],
      )!,
      endedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ended_at'],
      ),
      durationSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_seconds'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $WorkoutSessionsTable createAlias(String alias) {
    return $WorkoutSessionsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<SessionStatus, String, String> $converterstatus =
      const EnumNameConverter<SessionStatus>(SessionStatus.values);
}

class WorkoutSession extends DataClass implements Insertable<WorkoutSession> {
  final String id;
  final String ownerUserId;
  final String dayTypeId;
  final SessionStatus status;
  final int startedAt;
  final int? endedAt;
  final int durationSeconds;
  final int createdAt;
  final int updatedAt;
  const WorkoutSession({
    required this.id,
    required this.ownerUserId,
    required this.dayTypeId,
    required this.status,
    required this.startedAt,
    this.endedAt,
    required this.durationSeconds,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['owner_user_id'] = Variable<String>(ownerUserId);
    map['day_type_id'] = Variable<String>(dayTypeId);
    {
      map['status'] = Variable<String>(
        $WorkoutSessionsTable.$converterstatus.toSql(status),
      );
    }
    map['started_at'] = Variable<int>(startedAt);
    if (!nullToAbsent || endedAt != null) {
      map['ended_at'] = Variable<int>(endedAt);
    }
    map['duration_seconds'] = Variable<int>(durationSeconds);
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  WorkoutSessionsCompanion toCompanion(bool nullToAbsent) {
    return WorkoutSessionsCompanion(
      id: Value(id),
      ownerUserId: Value(ownerUserId),
      dayTypeId: Value(dayTypeId),
      status: Value(status),
      startedAt: Value(startedAt),
      endedAt: endedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(endedAt),
      durationSeconds: Value(durationSeconds),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory WorkoutSession.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkoutSession(
      id: serializer.fromJson<String>(json['id']),
      ownerUserId: serializer.fromJson<String>(json['ownerUserId']),
      dayTypeId: serializer.fromJson<String>(json['dayTypeId']),
      status: $WorkoutSessionsTable.$converterstatus.fromJson(
        serializer.fromJson<String>(json['status']),
      ),
      startedAt: serializer.fromJson<int>(json['startedAt']),
      endedAt: serializer.fromJson<int?>(json['endedAt']),
      durationSeconds: serializer.fromJson<int>(json['durationSeconds']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'ownerUserId': serializer.toJson<String>(ownerUserId),
      'dayTypeId': serializer.toJson<String>(dayTypeId),
      'status': serializer.toJson<String>(
        $WorkoutSessionsTable.$converterstatus.toJson(status),
      ),
      'startedAt': serializer.toJson<int>(startedAt),
      'endedAt': serializer.toJson<int?>(endedAt),
      'durationSeconds': serializer.toJson<int>(durationSeconds),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  WorkoutSession copyWith({
    String? id,
    String? ownerUserId,
    String? dayTypeId,
    SessionStatus? status,
    int? startedAt,
    Value<int?> endedAt = const Value.absent(),
    int? durationSeconds,
    int? createdAt,
    int? updatedAt,
  }) => WorkoutSession(
    id: id ?? this.id,
    ownerUserId: ownerUserId ?? this.ownerUserId,
    dayTypeId: dayTypeId ?? this.dayTypeId,
    status: status ?? this.status,
    startedAt: startedAt ?? this.startedAt,
    endedAt: endedAt.present ? endedAt.value : this.endedAt,
    durationSeconds: durationSeconds ?? this.durationSeconds,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  WorkoutSession copyWithCompanion(WorkoutSessionsCompanion data) {
    return WorkoutSession(
      id: data.id.present ? data.id.value : this.id,
      ownerUserId: data.ownerUserId.present
          ? data.ownerUserId.value
          : this.ownerUserId,
      dayTypeId: data.dayTypeId.present ? data.dayTypeId.value : this.dayTypeId,
      status: data.status.present ? data.status.value : this.status,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      endedAt: data.endedAt.present ? data.endedAt.value : this.endedAt,
      durationSeconds: data.durationSeconds.present
          ? data.durationSeconds.value
          : this.durationSeconds,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutSession(')
          ..write('id: $id, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('dayTypeId: $dayTypeId, ')
          ..write('status: $status, ')
          ..write('startedAt: $startedAt, ')
          ..write('endedAt: $endedAt, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    ownerUserId,
    dayTypeId,
    status,
    startedAt,
    endedAt,
    durationSeconds,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutSession &&
          other.id == this.id &&
          other.ownerUserId == this.ownerUserId &&
          other.dayTypeId == this.dayTypeId &&
          other.status == this.status &&
          other.startedAt == this.startedAt &&
          other.endedAt == this.endedAt &&
          other.durationSeconds == this.durationSeconds &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class WorkoutSessionsCompanion extends UpdateCompanion<WorkoutSession> {
  final Value<String> id;
  final Value<String> ownerUserId;
  final Value<String> dayTypeId;
  final Value<SessionStatus> status;
  final Value<int> startedAt;
  final Value<int?> endedAt;
  final Value<int> durationSeconds;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int> rowid;
  const WorkoutSessionsCompanion({
    this.id = const Value.absent(),
    this.ownerUserId = const Value.absent(),
    this.dayTypeId = const Value.absent(),
    this.status = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.endedAt = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkoutSessionsCompanion.insert({
    required String id,
    required String ownerUserId,
    required String dayTypeId,
    required SessionStatus status,
    required int startedAt,
    this.endedAt = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       ownerUserId = Value(ownerUserId),
       dayTypeId = Value(dayTypeId),
       status = Value(status),
       startedAt = Value(startedAt),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<WorkoutSession> custom({
    Expression<String>? id,
    Expression<String>? ownerUserId,
    Expression<String>? dayTypeId,
    Expression<String>? status,
    Expression<int>? startedAt,
    Expression<int>? endedAt,
    Expression<int>? durationSeconds,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ownerUserId != null) 'owner_user_id': ownerUserId,
      if (dayTypeId != null) 'day_type_id': dayTypeId,
      if (status != null) 'status': status,
      if (startedAt != null) 'started_at': startedAt,
      if (endedAt != null) 'ended_at': endedAt,
      if (durationSeconds != null) 'duration_seconds': durationSeconds,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorkoutSessionsCompanion copyWith({
    Value<String>? id,
    Value<String>? ownerUserId,
    Value<String>? dayTypeId,
    Value<SessionStatus>? status,
    Value<int>? startedAt,
    Value<int?>? endedAt,
    Value<int>? durationSeconds,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int>? rowid,
  }) {
    return WorkoutSessionsCompanion(
      id: id ?? this.id,
      ownerUserId: ownerUserId ?? this.ownerUserId,
      dayTypeId: dayTypeId ?? this.dayTypeId,
      status: status ?? this.status,
      startedAt: startedAt ?? this.startedAt,
      endedAt: endedAt ?? this.endedAt,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (ownerUserId.present) {
      map['owner_user_id'] = Variable<String>(ownerUserId.value);
    }
    if (dayTypeId.present) {
      map['day_type_id'] = Variable<String>(dayTypeId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(
        $WorkoutSessionsTable.$converterstatus.toSql(status.value),
      );
    }
    if (startedAt.present) {
      map['started_at'] = Variable<int>(startedAt.value);
    }
    if (endedAt.present) {
      map['ended_at'] = Variable<int>(endedAt.value);
    }
    if (durationSeconds.present) {
      map['duration_seconds'] = Variable<int>(durationSeconds.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutSessionsCompanion(')
          ..write('id: $id, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('dayTypeId: $dayTypeId, ')
          ..write('status: $status, ')
          ..write('startedAt: $startedAt, ')
          ..write('endedAt: $endedAt, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SessionExerciseLogsTable extends SessionExerciseLogs
    with TableInfo<$SessionExerciseLogsTable, SessionExerciseLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SessionExerciseLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ownerUserIdMeta = const VerificationMeta(
    'ownerUserId',
  );
  @override
  late final GeneratedColumn<String> ownerUserId = GeneratedColumn<String>(
    'owner_user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _sessionIdMeta = const VerificationMeta(
    'sessionId',
  );
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
    'session_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES workout_sessions (id)',
    ),
  );
  static const VerificationMeta _plannedExerciseIdMeta = const VerificationMeta(
    'plannedExerciseId',
  );
  @override
  late final GeneratedColumn<String> plannedExerciseId =
      GeneratedColumn<String>(
        'planned_exercise_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES exercises (id)',
        ),
      );
  static const VerificationMeta _performedExerciseIdMeta =
      const VerificationMeta('performedExerciseId');
  @override
  late final GeneratedColumn<String> performedExerciseId =
      GeneratedColumn<String>(
        'performed_exercise_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES exercises (id)',
        ),
      );
  static const VerificationMeta _positionMeta = const VerificationMeta(
    'position',
  );
  @override
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
    'position',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    ownerUserId,
    sessionId,
    plannedExerciseId,
    performedExerciseId,
    position,
    notes,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'session_exercise_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<SessionExerciseLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('owner_user_id')) {
      context.handle(
        _ownerUserIdMeta,
        ownerUserId.isAcceptableOrUnknown(
          data['owner_user_id']!,
          _ownerUserIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_ownerUserIdMeta);
    }
    if (data.containsKey('session_id')) {
      context.handle(
        _sessionIdMeta,
        sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('planned_exercise_id')) {
      context.handle(
        _plannedExerciseIdMeta,
        plannedExerciseId.isAcceptableOrUnknown(
          data['planned_exercise_id']!,
          _plannedExerciseIdMeta,
        ),
      );
    }
    if (data.containsKey('performed_exercise_id')) {
      context.handle(
        _performedExerciseIdMeta,
        performedExerciseId.isAcceptableOrUnknown(
          data['performed_exercise_id']!,
          _performedExerciseIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_performedExerciseIdMeta);
    }
    if (data.containsKey('position')) {
      context.handle(
        _positionMeta,
        position.isAcceptableOrUnknown(data['position']!, _positionMeta),
      );
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SessionExerciseLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SessionExerciseLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      ownerUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_user_id'],
      )!,
      sessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}session_id'],
      )!,
      plannedExerciseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}planned_exercise_id'],
      ),
      performedExerciseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}performed_exercise_id'],
      )!,
      position: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}position'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $SessionExerciseLogsTable createAlias(String alias) {
    return $SessionExerciseLogsTable(attachedDatabase, alias);
  }
}

class SessionExerciseLog extends DataClass
    implements Insertable<SessionExerciseLog> {
  final String id;
  final String ownerUserId;
  final String sessionId;
  final String? plannedExerciseId;
  final String performedExerciseId;
  final int position;
  final String? notes;
  final int createdAt;
  final int updatedAt;
  const SessionExerciseLog({
    required this.id,
    required this.ownerUserId,
    required this.sessionId,
    this.plannedExerciseId,
    required this.performedExerciseId,
    required this.position,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['owner_user_id'] = Variable<String>(ownerUserId);
    map['session_id'] = Variable<String>(sessionId);
    if (!nullToAbsent || plannedExerciseId != null) {
      map['planned_exercise_id'] = Variable<String>(plannedExerciseId);
    }
    map['performed_exercise_id'] = Variable<String>(performedExerciseId);
    map['position'] = Variable<int>(position);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  SessionExerciseLogsCompanion toCompanion(bool nullToAbsent) {
    return SessionExerciseLogsCompanion(
      id: Value(id),
      ownerUserId: Value(ownerUserId),
      sessionId: Value(sessionId),
      plannedExerciseId: plannedExerciseId == null && nullToAbsent
          ? const Value.absent()
          : Value(plannedExerciseId),
      performedExerciseId: Value(performedExerciseId),
      position: Value(position),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory SessionExerciseLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SessionExerciseLog(
      id: serializer.fromJson<String>(json['id']),
      ownerUserId: serializer.fromJson<String>(json['ownerUserId']),
      sessionId: serializer.fromJson<String>(json['sessionId']),
      plannedExerciseId: serializer.fromJson<String?>(
        json['plannedExerciseId'],
      ),
      performedExerciseId: serializer.fromJson<String>(
        json['performedExerciseId'],
      ),
      position: serializer.fromJson<int>(json['position']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'ownerUserId': serializer.toJson<String>(ownerUserId),
      'sessionId': serializer.toJson<String>(sessionId),
      'plannedExerciseId': serializer.toJson<String?>(plannedExerciseId),
      'performedExerciseId': serializer.toJson<String>(performedExerciseId),
      'position': serializer.toJson<int>(position),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  SessionExerciseLog copyWith({
    String? id,
    String? ownerUserId,
    String? sessionId,
    Value<String?> plannedExerciseId = const Value.absent(),
    String? performedExerciseId,
    int? position,
    Value<String?> notes = const Value.absent(),
    int? createdAt,
    int? updatedAt,
  }) => SessionExerciseLog(
    id: id ?? this.id,
    ownerUserId: ownerUserId ?? this.ownerUserId,
    sessionId: sessionId ?? this.sessionId,
    plannedExerciseId: plannedExerciseId.present
        ? plannedExerciseId.value
        : this.plannedExerciseId,
    performedExerciseId: performedExerciseId ?? this.performedExerciseId,
    position: position ?? this.position,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  SessionExerciseLog copyWithCompanion(SessionExerciseLogsCompanion data) {
    return SessionExerciseLog(
      id: data.id.present ? data.id.value : this.id,
      ownerUserId: data.ownerUserId.present
          ? data.ownerUserId.value
          : this.ownerUserId,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      plannedExerciseId: data.plannedExerciseId.present
          ? data.plannedExerciseId.value
          : this.plannedExerciseId,
      performedExerciseId: data.performedExerciseId.present
          ? data.performedExerciseId.value
          : this.performedExerciseId,
      position: data.position.present ? data.position.value : this.position,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SessionExerciseLog(')
          ..write('id: $id, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('sessionId: $sessionId, ')
          ..write('plannedExerciseId: $plannedExerciseId, ')
          ..write('performedExerciseId: $performedExerciseId, ')
          ..write('position: $position, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    ownerUserId,
    sessionId,
    plannedExerciseId,
    performedExerciseId,
    position,
    notes,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SessionExerciseLog &&
          other.id == this.id &&
          other.ownerUserId == this.ownerUserId &&
          other.sessionId == this.sessionId &&
          other.plannedExerciseId == this.plannedExerciseId &&
          other.performedExerciseId == this.performedExerciseId &&
          other.position == this.position &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SessionExerciseLogsCompanion extends UpdateCompanion<SessionExerciseLog> {
  final Value<String> id;
  final Value<String> ownerUserId;
  final Value<String> sessionId;
  final Value<String?> plannedExerciseId;
  final Value<String> performedExerciseId;
  final Value<int> position;
  final Value<String?> notes;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int> rowid;
  const SessionExerciseLogsCompanion({
    this.id = const Value.absent(),
    this.ownerUserId = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.plannedExerciseId = const Value.absent(),
    this.performedExerciseId = const Value.absent(),
    this.position = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SessionExerciseLogsCompanion.insert({
    required String id,
    required String ownerUserId,
    required String sessionId,
    this.plannedExerciseId = const Value.absent(),
    required String performedExerciseId,
    required int position,
    this.notes = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       ownerUserId = Value(ownerUserId),
       sessionId = Value(sessionId),
       performedExerciseId = Value(performedExerciseId),
       position = Value(position),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<SessionExerciseLog> custom({
    Expression<String>? id,
    Expression<String>? ownerUserId,
    Expression<String>? sessionId,
    Expression<String>? plannedExerciseId,
    Expression<String>? performedExerciseId,
    Expression<int>? position,
    Expression<String>? notes,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ownerUserId != null) 'owner_user_id': ownerUserId,
      if (sessionId != null) 'session_id': sessionId,
      if (plannedExerciseId != null) 'planned_exercise_id': plannedExerciseId,
      if (performedExerciseId != null)
        'performed_exercise_id': performedExerciseId,
      if (position != null) 'position': position,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SessionExerciseLogsCompanion copyWith({
    Value<String>? id,
    Value<String>? ownerUserId,
    Value<String>? sessionId,
    Value<String?>? plannedExerciseId,
    Value<String>? performedExerciseId,
    Value<int>? position,
    Value<String?>? notes,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int>? rowid,
  }) {
    return SessionExerciseLogsCompanion(
      id: id ?? this.id,
      ownerUserId: ownerUserId ?? this.ownerUserId,
      sessionId: sessionId ?? this.sessionId,
      plannedExerciseId: plannedExerciseId ?? this.plannedExerciseId,
      performedExerciseId: performedExerciseId ?? this.performedExerciseId,
      position: position ?? this.position,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (ownerUserId.present) {
      map['owner_user_id'] = Variable<String>(ownerUserId.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (plannedExerciseId.present) {
      map['planned_exercise_id'] = Variable<String>(plannedExerciseId.value);
    }
    if (performedExerciseId.present) {
      map['performed_exercise_id'] = Variable<String>(
        performedExerciseId.value,
      );
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionExerciseLogsCompanion(')
          ..write('id: $id, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('sessionId: $sessionId, ')
          ..write('plannedExerciseId: $plannedExerciseId, ')
          ..write('performedExerciseId: $performedExerciseId, ')
          ..write('position: $position, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SetLogsTable extends SetLogs with TableInfo<$SetLogsTable, SetLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SetLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ownerUserIdMeta = const VerificationMeta(
    'ownerUserId',
  );
  @override
  late final GeneratedColumn<String> ownerUserId = GeneratedColumn<String>(
    'owner_user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _sessionExerciseLogIdMeta =
      const VerificationMeta('sessionExerciseLogId');
  @override
  late final GeneratedColumn<String> sessionExerciseLogId =
      GeneratedColumn<String>(
        'session_exercise_log_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES session_exercise_logs (id)',
        ),
      );
  static const VerificationMeta _setNumberMeta = const VerificationMeta(
    'setNumber',
  );
  @override
  late final GeneratedColumn<int> setNumber = GeneratedColumn<int>(
    'set_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _repsMeta = const VerificationMeta('reps');
  @override
  late final GeneratedColumn<int> reps = GeneratedColumn<int>(
    'reps',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
    'weight',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<SetType?, String> setType =
      GeneratedColumn<String>(
        'set_type',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<SetType?>($SetLogsTable.$convertersetTypen);
  static const VerificationMeta _rpeMeta = const VerificationMeta('rpe');
  @override
  late final GeneratedColumn<int> rpe = GeneratedColumn<int>(
    'rpe',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<int> completedAt = GeneratedColumn<int>(
    'completed_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    ownerUserId,
    sessionExerciseLogId,
    setNumber,
    reps,
    weight,
    setType,
    rpe,
    completedAt,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'set_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<SetLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('owner_user_id')) {
      context.handle(
        _ownerUserIdMeta,
        ownerUserId.isAcceptableOrUnknown(
          data['owner_user_id']!,
          _ownerUserIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_ownerUserIdMeta);
    }
    if (data.containsKey('session_exercise_log_id')) {
      context.handle(
        _sessionExerciseLogIdMeta,
        sessionExerciseLogId.isAcceptableOrUnknown(
          data['session_exercise_log_id']!,
          _sessionExerciseLogIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_sessionExerciseLogIdMeta);
    }
    if (data.containsKey('set_number')) {
      context.handle(
        _setNumberMeta,
        setNumber.isAcceptableOrUnknown(data['set_number']!, _setNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_setNumberMeta);
    }
    if (data.containsKey('reps')) {
      context.handle(
        _repsMeta,
        reps.isAcceptableOrUnknown(data['reps']!, _repsMeta),
      );
    } else if (isInserting) {
      context.missing(_repsMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(
        _weightMeta,
        weight.isAcceptableOrUnknown(data['weight']!, _weightMeta),
      );
    }
    if (data.containsKey('rpe')) {
      context.handle(
        _rpeMeta,
        rpe.isAcceptableOrUnknown(data['rpe']!, _rpeMeta),
      );
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_completedAtMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SetLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SetLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      ownerUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_user_id'],
      )!,
      sessionExerciseLogId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}session_exercise_log_id'],
      )!,
      setNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}set_number'],
      )!,
      reps: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reps'],
      )!,
      weight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight'],
      ),
      setType: $SetLogsTable.$convertersetTypen.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}set_type'],
        ),
      ),
      rpe: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rpe'],
      ),
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}completed_at'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $SetLogsTable createAlias(String alias) {
    return $SetLogsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<SetType, String, String> $convertersetType =
      const EnumNameConverter<SetType>(SetType.values);
  static JsonTypeConverter2<SetType?, String?, String?> $convertersetTypen =
      JsonTypeConverter2.asNullable($convertersetType);
}

class SetLog extends DataClass implements Insertable<SetLog> {
  final String id;
  final String ownerUserId;
  final String sessionExerciseLogId;
  final int setNumber;
  final int reps;
  final double? weight;
  final SetType? setType;
  final int? rpe;
  final int completedAt;
  final int createdAt;
  final int updatedAt;
  const SetLog({
    required this.id,
    required this.ownerUserId,
    required this.sessionExerciseLogId,
    required this.setNumber,
    required this.reps,
    this.weight,
    this.setType,
    this.rpe,
    required this.completedAt,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['owner_user_id'] = Variable<String>(ownerUserId);
    map['session_exercise_log_id'] = Variable<String>(sessionExerciseLogId);
    map['set_number'] = Variable<int>(setNumber);
    map['reps'] = Variable<int>(reps);
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<double>(weight);
    }
    if (!nullToAbsent || setType != null) {
      map['set_type'] = Variable<String>(
        $SetLogsTable.$convertersetTypen.toSql(setType),
      );
    }
    if (!nullToAbsent || rpe != null) {
      map['rpe'] = Variable<int>(rpe);
    }
    map['completed_at'] = Variable<int>(completedAt);
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  SetLogsCompanion toCompanion(bool nullToAbsent) {
    return SetLogsCompanion(
      id: Value(id),
      ownerUserId: Value(ownerUserId),
      sessionExerciseLogId: Value(sessionExerciseLogId),
      setNumber: Value(setNumber),
      reps: Value(reps),
      weight: weight == null && nullToAbsent
          ? const Value.absent()
          : Value(weight),
      setType: setType == null && nullToAbsent
          ? const Value.absent()
          : Value(setType),
      rpe: rpe == null && nullToAbsent ? const Value.absent() : Value(rpe),
      completedAt: Value(completedAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory SetLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SetLog(
      id: serializer.fromJson<String>(json['id']),
      ownerUserId: serializer.fromJson<String>(json['ownerUserId']),
      sessionExerciseLogId: serializer.fromJson<String>(
        json['sessionExerciseLogId'],
      ),
      setNumber: serializer.fromJson<int>(json['setNumber']),
      reps: serializer.fromJson<int>(json['reps']),
      weight: serializer.fromJson<double?>(json['weight']),
      setType: $SetLogsTable.$convertersetTypen.fromJson(
        serializer.fromJson<String?>(json['setType']),
      ),
      rpe: serializer.fromJson<int?>(json['rpe']),
      completedAt: serializer.fromJson<int>(json['completedAt']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'ownerUserId': serializer.toJson<String>(ownerUserId),
      'sessionExerciseLogId': serializer.toJson<String>(sessionExerciseLogId),
      'setNumber': serializer.toJson<int>(setNumber),
      'reps': serializer.toJson<int>(reps),
      'weight': serializer.toJson<double?>(weight),
      'setType': serializer.toJson<String?>(
        $SetLogsTable.$convertersetTypen.toJson(setType),
      ),
      'rpe': serializer.toJson<int?>(rpe),
      'completedAt': serializer.toJson<int>(completedAt),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  SetLog copyWith({
    String? id,
    String? ownerUserId,
    String? sessionExerciseLogId,
    int? setNumber,
    int? reps,
    Value<double?> weight = const Value.absent(),
    Value<SetType?> setType = const Value.absent(),
    Value<int?> rpe = const Value.absent(),
    int? completedAt,
    int? createdAt,
    int? updatedAt,
  }) => SetLog(
    id: id ?? this.id,
    ownerUserId: ownerUserId ?? this.ownerUserId,
    sessionExerciseLogId: sessionExerciseLogId ?? this.sessionExerciseLogId,
    setNumber: setNumber ?? this.setNumber,
    reps: reps ?? this.reps,
    weight: weight.present ? weight.value : this.weight,
    setType: setType.present ? setType.value : this.setType,
    rpe: rpe.present ? rpe.value : this.rpe,
    completedAt: completedAt ?? this.completedAt,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  SetLog copyWithCompanion(SetLogsCompanion data) {
    return SetLog(
      id: data.id.present ? data.id.value : this.id,
      ownerUserId: data.ownerUserId.present
          ? data.ownerUserId.value
          : this.ownerUserId,
      sessionExerciseLogId: data.sessionExerciseLogId.present
          ? data.sessionExerciseLogId.value
          : this.sessionExerciseLogId,
      setNumber: data.setNumber.present ? data.setNumber.value : this.setNumber,
      reps: data.reps.present ? data.reps.value : this.reps,
      weight: data.weight.present ? data.weight.value : this.weight,
      setType: data.setType.present ? data.setType.value : this.setType,
      rpe: data.rpe.present ? data.rpe.value : this.rpe,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SetLog(')
          ..write('id: $id, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('sessionExerciseLogId: $sessionExerciseLogId, ')
          ..write('setNumber: $setNumber, ')
          ..write('reps: $reps, ')
          ..write('weight: $weight, ')
          ..write('setType: $setType, ')
          ..write('rpe: $rpe, ')
          ..write('completedAt: $completedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    ownerUserId,
    sessionExerciseLogId,
    setNumber,
    reps,
    weight,
    setType,
    rpe,
    completedAt,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SetLog &&
          other.id == this.id &&
          other.ownerUserId == this.ownerUserId &&
          other.sessionExerciseLogId == this.sessionExerciseLogId &&
          other.setNumber == this.setNumber &&
          other.reps == this.reps &&
          other.weight == this.weight &&
          other.setType == this.setType &&
          other.rpe == this.rpe &&
          other.completedAt == this.completedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SetLogsCompanion extends UpdateCompanion<SetLog> {
  final Value<String> id;
  final Value<String> ownerUserId;
  final Value<String> sessionExerciseLogId;
  final Value<int> setNumber;
  final Value<int> reps;
  final Value<double?> weight;
  final Value<SetType?> setType;
  final Value<int?> rpe;
  final Value<int> completedAt;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int> rowid;
  const SetLogsCompanion({
    this.id = const Value.absent(),
    this.ownerUserId = const Value.absent(),
    this.sessionExerciseLogId = const Value.absent(),
    this.setNumber = const Value.absent(),
    this.reps = const Value.absent(),
    this.weight = const Value.absent(),
    this.setType = const Value.absent(),
    this.rpe = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SetLogsCompanion.insert({
    required String id,
    required String ownerUserId,
    required String sessionExerciseLogId,
    required int setNumber,
    required int reps,
    this.weight = const Value.absent(),
    this.setType = const Value.absent(),
    this.rpe = const Value.absent(),
    required int completedAt,
    required int createdAt,
    required int updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       ownerUserId = Value(ownerUserId),
       sessionExerciseLogId = Value(sessionExerciseLogId),
       setNumber = Value(setNumber),
       reps = Value(reps),
       completedAt = Value(completedAt),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<SetLog> custom({
    Expression<String>? id,
    Expression<String>? ownerUserId,
    Expression<String>? sessionExerciseLogId,
    Expression<int>? setNumber,
    Expression<int>? reps,
    Expression<double>? weight,
    Expression<String>? setType,
    Expression<int>? rpe,
    Expression<int>? completedAt,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ownerUserId != null) 'owner_user_id': ownerUserId,
      if (sessionExerciseLogId != null)
        'session_exercise_log_id': sessionExerciseLogId,
      if (setNumber != null) 'set_number': setNumber,
      if (reps != null) 'reps': reps,
      if (weight != null) 'weight': weight,
      if (setType != null) 'set_type': setType,
      if (rpe != null) 'rpe': rpe,
      if (completedAt != null) 'completed_at': completedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SetLogsCompanion copyWith({
    Value<String>? id,
    Value<String>? ownerUserId,
    Value<String>? sessionExerciseLogId,
    Value<int>? setNumber,
    Value<int>? reps,
    Value<double?>? weight,
    Value<SetType?>? setType,
    Value<int?>? rpe,
    Value<int>? completedAt,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int>? rowid,
  }) {
    return SetLogsCompanion(
      id: id ?? this.id,
      ownerUserId: ownerUserId ?? this.ownerUserId,
      sessionExerciseLogId: sessionExerciseLogId ?? this.sessionExerciseLogId,
      setNumber: setNumber ?? this.setNumber,
      reps: reps ?? this.reps,
      weight: weight ?? this.weight,
      setType: setType ?? this.setType,
      rpe: rpe ?? this.rpe,
      completedAt: completedAt ?? this.completedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (ownerUserId.present) {
      map['owner_user_id'] = Variable<String>(ownerUserId.value);
    }
    if (sessionExerciseLogId.present) {
      map['session_exercise_log_id'] = Variable<String>(
        sessionExerciseLogId.value,
      );
    }
    if (setNumber.present) {
      map['set_number'] = Variable<int>(setNumber.value);
    }
    if (reps.present) {
      map['reps'] = Variable<int>(reps.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (setType.present) {
      map['set_type'] = Variable<String>(
        $SetLogsTable.$convertersetTypen.toSql(setType.value),
      );
    }
    if (rpe.present) {
      map['rpe'] = Variable<int>(rpe.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<int>(completedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SetLogsCompanion(')
          ..write('id: $id, ')
          ..write('ownerUserId: $ownerUserId, ')
          ..write('sessionExerciseLogId: $sessionExerciseLogId, ')
          ..write('setNumber: $setNumber, ')
          ..write('reps: $reps, ')
          ..write('weight: $weight, ')
          ..write('setType: $setType, ')
          ..write('rpe: $rpe, ')
          ..write('completedAt: $completedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $ExercisesTable exercises = $ExercisesTable(this);
  late final $ExerciseSubstitutesTable exerciseSubstitutes =
      $ExerciseSubstitutesTable(this);
  late final $DayTypesTable dayTypes = $DayTypesTable(this);
  late final $DayTypeExercisesTable dayTypeExercises = $DayTypeExercisesTable(
    this,
  );
  late final $RoutinePatternsTable routinePatterns = $RoutinePatternsTable(
    this,
  );
  late final $WeeklyPatternSlotsTable weeklyPatternSlots =
      $WeeklyPatternSlotsTable(this);
  late final $CyclicPatternSlotsTable cyclicPatternSlots =
      $CyclicPatternSlotsTable(this);
  late final $DayOverridesTable dayOverrides = $DayOverridesTable(this);
  late final $WorkoutSessionsTable workoutSessions = $WorkoutSessionsTable(
    this,
  );
  late final $SessionExerciseLogsTable sessionExerciseLogs =
      $SessionExerciseLogsTable(this);
  late final $SetLogsTable setLogs = $SetLogsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    users,
    exercises,
    exerciseSubstitutes,
    dayTypes,
    dayTypeExercises,
    routinePatterns,
    weeklyPatternSlots,
    cyclicPatternSlots,
    dayOverrides,
    workoutSessions,
    sessionExerciseLogs,
    setLogs,
  ];
}

typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      required String id,
      Value<String> displayName,
      required int createdAt,
      required int updatedAt,
      Value<int> rowid,
    });
typedef $$UsersTableUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<String> id,
      Value<String> displayName,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int> rowid,
    });

final class $$UsersTableReferences
    extends BaseReferences<_$AppDatabase, $UsersTable, User> {
  $$UsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ExercisesTable, List<Exercise>>
  _exercisesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.exercises,
    aliasName: 'users__id__exercises__owner_user_id',
  );

  $$ExercisesTableProcessedTableManager get exercisesRefs {
    final manager = $$ExercisesTableTableManager(
      $_db,
      $_db.exercises,
    ).filter((f) => f.ownerUserId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_exercisesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $ExerciseSubstitutesTable,
    List<ExerciseSubstitute>
  >
  _exerciseSubstitutesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.exerciseSubstitutes,
        aliasName: 'users__id__exercise_substitutes__owner_user_id',
      );

  $$ExerciseSubstitutesTableProcessedTableManager get exerciseSubstitutesRefs {
    final manager = $$ExerciseSubstitutesTableTableManager(
      $_db,
      $_db.exerciseSubstitutes,
    ).filter((f) => f.ownerUserId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _exerciseSubstitutesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DayTypesTable, List<DayType>> _dayTypesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.dayTypes,
    aliasName: 'users__id__day_types__owner_user_id',
  );

  $$DayTypesTableProcessedTableManager get dayTypesRefs {
    final manager = $$DayTypesTableTableManager(
      $_db,
      $_db.dayTypes,
    ).filter((f) => f.ownerUserId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_dayTypesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DayTypeExercisesTable, List<DayTypeExercise>>
  _dayTypeExercisesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.dayTypeExercises,
    aliasName: 'users__id__day_type_exercises__owner_user_id',
  );

  $$DayTypeExercisesTableProcessedTableManager get dayTypeExercisesRefs {
    final manager = $$DayTypeExercisesTableTableManager(
      $_db,
      $_db.dayTypeExercises,
    ).filter((f) => f.ownerUserId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _dayTypeExercisesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$RoutinePatternsTable, List<RoutinePattern>>
  _routinePatternsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.routinePatterns,
    aliasName: 'users__id__routine_patterns__owner_user_id',
  );

  $$RoutinePatternsTableProcessedTableManager get routinePatternsRefs {
    final manager = $$RoutinePatternsTableTableManager(
      $_db,
      $_db.routinePatterns,
    ).filter((f) => f.ownerUserId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _routinePatternsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DayOverridesTable, List<DayOverride>>
  _dayOverridesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.dayOverrides,
    aliasName: 'users__id__day_overrides__owner_user_id',
  );

  $$DayOverridesTableProcessedTableManager get dayOverridesRefs {
    final manager = $$DayOverridesTableTableManager(
      $_db,
      $_db.dayOverrides,
    ).filter((f) => f.ownerUserId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_dayOverridesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$WorkoutSessionsTable, List<WorkoutSession>>
  _workoutSessionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.workoutSessions,
    aliasName: 'users__id__workout_sessions__owner_user_id',
  );

  $$WorkoutSessionsTableProcessedTableManager get workoutSessionsRefs {
    final manager = $$WorkoutSessionsTableTableManager(
      $_db,
      $_db.workoutSessions,
    ).filter((f) => f.ownerUserId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _workoutSessionsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $SessionExerciseLogsTable,
    List<SessionExerciseLog>
  >
  _sessionExerciseLogsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.sessionExerciseLogs,
        aliasName: 'users__id__session_exercise_logs__owner_user_id',
      );

  $$SessionExerciseLogsTableProcessedTableManager get sessionExerciseLogsRefs {
    final manager = $$SessionExerciseLogsTableTableManager(
      $_db,
      $_db.sessionExerciseLogs,
    ).filter((f) => f.ownerUserId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _sessionExerciseLogsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SetLogsTable, List<SetLog>> _setLogsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.setLogs,
    aliasName: 'users__id__set_logs__owner_user_id',
  );

  $$SetLogsTableProcessedTableManager get setLogsRefs {
    final manager = $$SetLogsTableTableManager(
      $_db,
      $_db.setLogs,
    ).filter((f) => f.ownerUserId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_setLogsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> exercisesRefs(
    Expression<bool> Function($$ExercisesTableFilterComposer f) f,
  ) {
    final $$ExercisesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.exercises,
      getReferencedColumn: (t) => t.ownerUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisesTableFilterComposer(
            $db: $db,
            $table: $db.exercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> exerciseSubstitutesRefs(
    Expression<bool> Function($$ExerciseSubstitutesTableFilterComposer f) f,
  ) {
    final $$ExerciseSubstitutesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.exerciseSubstitutes,
      getReferencedColumn: (t) => t.ownerUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExerciseSubstitutesTableFilterComposer(
            $db: $db,
            $table: $db.exerciseSubstitutes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> dayTypesRefs(
    Expression<bool> Function($$DayTypesTableFilterComposer f) f,
  ) {
    final $$DayTypesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dayTypes,
      getReferencedColumn: (t) => t.ownerUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DayTypesTableFilterComposer(
            $db: $db,
            $table: $db.dayTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> dayTypeExercisesRefs(
    Expression<bool> Function($$DayTypeExercisesTableFilterComposer f) f,
  ) {
    final $$DayTypeExercisesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dayTypeExercises,
      getReferencedColumn: (t) => t.ownerUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DayTypeExercisesTableFilterComposer(
            $db: $db,
            $table: $db.dayTypeExercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> routinePatternsRefs(
    Expression<bool> Function($$RoutinePatternsTableFilterComposer f) f,
  ) {
    final $$RoutinePatternsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.routinePatterns,
      getReferencedColumn: (t) => t.ownerUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutinePatternsTableFilterComposer(
            $db: $db,
            $table: $db.routinePatterns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> dayOverridesRefs(
    Expression<bool> Function($$DayOverridesTableFilterComposer f) f,
  ) {
    final $$DayOverridesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dayOverrides,
      getReferencedColumn: (t) => t.ownerUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DayOverridesTableFilterComposer(
            $db: $db,
            $table: $db.dayOverrides,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> workoutSessionsRefs(
    Expression<bool> Function($$WorkoutSessionsTableFilterComposer f) f,
  ) {
    final $$WorkoutSessionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workoutSessions,
      getReferencedColumn: (t) => t.ownerUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutSessionsTableFilterComposer(
            $db: $db,
            $table: $db.workoutSessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> sessionExerciseLogsRefs(
    Expression<bool> Function($$SessionExerciseLogsTableFilterComposer f) f,
  ) {
    final $$SessionExerciseLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.sessionExerciseLogs,
      getReferencedColumn: (t) => t.ownerUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionExerciseLogsTableFilterComposer(
            $db: $db,
            $table: $db.sessionExerciseLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> setLogsRefs(
    Expression<bool> Function($$SetLogsTableFilterComposer f) f,
  ) {
    final $$SetLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.setLogs,
      getReferencedColumn: (t) => t.ownerUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SetLogsTableFilterComposer(
            $db: $db,
            $table: $db.setLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> exercisesRefs<T extends Object>(
    Expression<T> Function($$ExercisesTableAnnotationComposer a) f,
  ) {
    final $$ExercisesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.exercises,
      getReferencedColumn: (t) => t.ownerUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisesTableAnnotationComposer(
            $db: $db,
            $table: $db.exercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> exerciseSubstitutesRefs<T extends Object>(
    Expression<T> Function($$ExerciseSubstitutesTableAnnotationComposer a) f,
  ) {
    final $$ExerciseSubstitutesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.exerciseSubstitutes,
          getReferencedColumn: (t) => t.ownerUserId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ExerciseSubstitutesTableAnnotationComposer(
                $db: $db,
                $table: $db.exerciseSubstitutes,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> dayTypesRefs<T extends Object>(
    Expression<T> Function($$DayTypesTableAnnotationComposer a) f,
  ) {
    final $$DayTypesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dayTypes,
      getReferencedColumn: (t) => t.ownerUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DayTypesTableAnnotationComposer(
            $db: $db,
            $table: $db.dayTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> dayTypeExercisesRefs<T extends Object>(
    Expression<T> Function($$DayTypeExercisesTableAnnotationComposer a) f,
  ) {
    final $$DayTypeExercisesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dayTypeExercises,
      getReferencedColumn: (t) => t.ownerUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DayTypeExercisesTableAnnotationComposer(
            $db: $db,
            $table: $db.dayTypeExercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> routinePatternsRefs<T extends Object>(
    Expression<T> Function($$RoutinePatternsTableAnnotationComposer a) f,
  ) {
    final $$RoutinePatternsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.routinePatterns,
      getReferencedColumn: (t) => t.ownerUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutinePatternsTableAnnotationComposer(
            $db: $db,
            $table: $db.routinePatterns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> dayOverridesRefs<T extends Object>(
    Expression<T> Function($$DayOverridesTableAnnotationComposer a) f,
  ) {
    final $$DayOverridesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dayOverrides,
      getReferencedColumn: (t) => t.ownerUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DayOverridesTableAnnotationComposer(
            $db: $db,
            $table: $db.dayOverrides,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> workoutSessionsRefs<T extends Object>(
    Expression<T> Function($$WorkoutSessionsTableAnnotationComposer a) f,
  ) {
    final $$WorkoutSessionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workoutSessions,
      getReferencedColumn: (t) => t.ownerUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutSessionsTableAnnotationComposer(
            $db: $db,
            $table: $db.workoutSessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> sessionExerciseLogsRefs<T extends Object>(
    Expression<T> Function($$SessionExerciseLogsTableAnnotationComposer a) f,
  ) {
    final $$SessionExerciseLogsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.sessionExerciseLogs,
          getReferencedColumn: (t) => t.ownerUserId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SessionExerciseLogsTableAnnotationComposer(
                $db: $db,
                $table: $db.sessionExerciseLogs,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> setLogsRefs<T extends Object>(
    Expression<T> Function($$SetLogsTableAnnotationComposer a) f,
  ) {
    final $$SetLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.setLogs,
      getReferencedColumn: (t) => t.ownerUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SetLogsTableAnnotationComposer(
            $db: $db,
            $table: $db.setLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsersTable,
          User,
          $$UsersTableFilterComposer,
          $$UsersTableOrderingComposer,
          $$UsersTableAnnotationComposer,
          $$UsersTableCreateCompanionBuilder,
          $$UsersTableUpdateCompanionBuilder,
          (User, $$UsersTableReferences),
          User,
          PrefetchHooks Function({
            bool exercisesRefs,
            bool exerciseSubstitutesRefs,
            bool dayTypesRefs,
            bool dayTypeExercisesRefs,
            bool routinePatternsRefs,
            bool dayOverridesRefs,
            bool workoutSessionsRefs,
            bool sessionExerciseLogsRefs,
            bool setLogsRefs,
          })
        > {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> displayName = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion(
                id: id,
                displayName: displayName,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String> displayName = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion.insert(
                id: id,
                displayName: displayName,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$UsersTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                exercisesRefs = false,
                exerciseSubstitutesRefs = false,
                dayTypesRefs = false,
                dayTypeExercisesRefs = false,
                routinePatternsRefs = false,
                dayOverridesRefs = false,
                workoutSessionsRefs = false,
                sessionExerciseLogsRefs = false,
                setLogsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (exercisesRefs) db.exercises,
                    if (exerciseSubstitutesRefs) db.exerciseSubstitutes,
                    if (dayTypesRefs) db.dayTypes,
                    if (dayTypeExercisesRefs) db.dayTypeExercises,
                    if (routinePatternsRefs) db.routinePatterns,
                    if (dayOverridesRefs) db.dayOverrides,
                    if (workoutSessionsRefs) db.workoutSessions,
                    if (sessionExerciseLogsRefs) db.sessionExerciseLogs,
                    if (setLogsRefs) db.setLogs,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (exercisesRefs)
                        await $_getPrefetchedData<User, $UsersTable, Exercise>(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._exercisesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).exercisesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.ownerUserId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (exerciseSubstitutesRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          ExerciseSubstitute
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._exerciseSubstitutesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).exerciseSubstitutesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.ownerUserId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (dayTypesRefs)
                        await $_getPrefetchedData<User, $UsersTable, DayType>(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._dayTypesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).dayTypesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.ownerUserId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (dayTypeExercisesRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          DayTypeExercise
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._dayTypeExercisesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).dayTypeExercisesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.ownerUserId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (routinePatternsRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          RoutinePattern
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._routinePatternsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).routinePatternsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.ownerUserId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (dayOverridesRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          DayOverride
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._dayOverridesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).dayOverridesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.ownerUserId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (workoutSessionsRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          WorkoutSession
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._workoutSessionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).workoutSessionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.ownerUserId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (sessionExerciseLogsRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          SessionExerciseLog
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._sessionExerciseLogsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).sessionExerciseLogsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.ownerUserId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (setLogsRefs)
                        await $_getPrefetchedData<User, $UsersTable, SetLog>(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._setLogsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(db, table, p0).setLogsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.ownerUserId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$UsersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsersTable,
      User,
      $$UsersTableFilterComposer,
      $$UsersTableOrderingComposer,
      $$UsersTableAnnotationComposer,
      $$UsersTableCreateCompanionBuilder,
      $$UsersTableUpdateCompanionBuilder,
      (User, $$UsersTableReferences),
      User,
      PrefetchHooks Function({
        bool exercisesRefs,
        bool exerciseSubstitutesRefs,
        bool dayTypesRefs,
        bool dayTypeExercisesRefs,
        bool routinePatternsRefs,
        bool dayOverridesRefs,
        bool workoutSessionsRefs,
        bool sessionExerciseLogsRefs,
        bool setLogsRefs,
      })
    >;
typedef $$ExercisesTableCreateCompanionBuilder =
    ExercisesCompanion Function({
      required String id,
      required String ownerUserId,
      required String name,
      required EquipmentType equipmentType,
      required String primaryMuscle,
      Value<String?> externalGuideUrl,
      Value<ExerciseRating?> rating,
      Value<bool> isArchived,
      required int createdAt,
      required int updatedAt,
      Value<int> rowid,
    });
typedef $$ExercisesTableUpdateCompanionBuilder =
    ExercisesCompanion Function({
      Value<String> id,
      Value<String> ownerUserId,
      Value<String> name,
      Value<EquipmentType> equipmentType,
      Value<String> primaryMuscle,
      Value<String?> externalGuideUrl,
      Value<ExerciseRating?> rating,
      Value<bool> isArchived,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int> rowid,
    });

final class $$ExercisesTableReferences
    extends BaseReferences<_$AppDatabase, $ExercisesTable, Exercise> {
  $$ExercisesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _ownerUserIdTable(_$AppDatabase db) =>
      db.users.createAlias('exercises__owner_user_id__users__id');

  $$UsersTableProcessedTableManager get ownerUserId {
    final $_column = $_itemColumn<String>('owner_user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ownerUserIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $ExerciseSubstitutesTable,
    List<ExerciseSubstitute>
  >
  _substituteLinksTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.exerciseSubstitutes,
    aliasName: 'exercises__id__exercise_substitutes__exercise_id',
  );

  $$ExerciseSubstitutesTableProcessedTableManager get substituteLinks {
    final manager = $$ExerciseSubstitutesTableTableManager(
      $_db,
      $_db.exerciseSubstitutes,
    ).filter((f) => f.exerciseId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_substituteLinksTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $ExerciseSubstitutesTable,
    List<ExerciseSubstitute>
  >
  _substituteOfLinksTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.exerciseSubstitutes,
    aliasName: 'exercises__id__exercise_substitutes__substitute_exercise_id',
  );

  $$ExerciseSubstitutesTableProcessedTableManager get substituteOfLinks {
    final manager =
        $$ExerciseSubstitutesTableTableManager(
          $_db,
          $_db.exerciseSubstitutes,
        ).filter(
          (f) =>
              f.substituteExerciseId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(_substituteOfLinksTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DayTypeExercisesTable, List<DayTypeExercise>>
  _dayTypeExercisesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.dayTypeExercises,
    aliasName: 'exercises__id__day_type_exercises__exercise_id',
  );

  $$DayTypeExercisesTableProcessedTableManager get dayTypeExercisesRefs {
    final manager = $$DayTypeExercisesTableTableManager(
      $_db,
      $_db.dayTypeExercises,
    ).filter((f) => f.exerciseId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _dayTypeExercisesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $SessionExerciseLogsTable,
    List<SessionExerciseLog>
  >
  _plannedInSessionLogsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.sessionExerciseLogs,
    aliasName: 'exercises__id__session_exercise_logs__planned_exercise_id',
  );

  $$SessionExerciseLogsTableProcessedTableManager get plannedInSessionLogs {
    final manager =
        $$SessionExerciseLogsTableTableManager(
          $_db,
          $_db.sessionExerciseLogs,
        ).filter(
          (f) => f.plannedExerciseId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _plannedInSessionLogsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $SessionExerciseLogsTable,
    List<SessionExerciseLog>
  >
  _performedInSessionLogsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.sessionExerciseLogs,
        aliasName:
            'exercises__id__session_exercise_logs__performed_exercise_id',
      );

  $$SessionExerciseLogsTableProcessedTableManager get performedInSessionLogs {
    final manager =
        $$SessionExerciseLogsTableTableManager(
          $_db,
          $_db.sessionExerciseLogs,
        ).filter(
          (f) =>
              f.performedExerciseId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _performedInSessionLogsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ExercisesTableFilterComposer
    extends Composer<_$AppDatabase, $ExercisesTable> {
  $$ExercisesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<EquipmentType, EquipmentType, String>
  get equipmentType => $composableBuilder(
    column: $table.equipmentType,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get primaryMuscle => $composableBuilder(
    column: $table.primaryMuscle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get externalGuideUrl => $composableBuilder(
    column: $table.externalGuideUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<ExerciseRating?, ExerciseRating, String>
  get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get ownerUserId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> substituteLinks(
    Expression<bool> Function($$ExerciseSubstitutesTableFilterComposer f) f,
  ) {
    final $$ExerciseSubstitutesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.exerciseSubstitutes,
      getReferencedColumn: (t) => t.exerciseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExerciseSubstitutesTableFilterComposer(
            $db: $db,
            $table: $db.exerciseSubstitutes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> substituteOfLinks(
    Expression<bool> Function($$ExerciseSubstitutesTableFilterComposer f) f,
  ) {
    final $$ExerciseSubstitutesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.exerciseSubstitutes,
      getReferencedColumn: (t) => t.substituteExerciseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExerciseSubstitutesTableFilterComposer(
            $db: $db,
            $table: $db.exerciseSubstitutes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> dayTypeExercisesRefs(
    Expression<bool> Function($$DayTypeExercisesTableFilterComposer f) f,
  ) {
    final $$DayTypeExercisesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dayTypeExercises,
      getReferencedColumn: (t) => t.exerciseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DayTypeExercisesTableFilterComposer(
            $db: $db,
            $table: $db.dayTypeExercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> plannedInSessionLogs(
    Expression<bool> Function($$SessionExerciseLogsTableFilterComposer f) f,
  ) {
    final $$SessionExerciseLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.sessionExerciseLogs,
      getReferencedColumn: (t) => t.plannedExerciseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionExerciseLogsTableFilterComposer(
            $db: $db,
            $table: $db.sessionExerciseLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> performedInSessionLogs(
    Expression<bool> Function($$SessionExerciseLogsTableFilterComposer f) f,
  ) {
    final $$SessionExerciseLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.sessionExerciseLogs,
      getReferencedColumn: (t) => t.performedExerciseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionExerciseLogsTableFilterComposer(
            $db: $db,
            $table: $db.sessionExerciseLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ExercisesTableOrderingComposer
    extends Composer<_$AppDatabase, $ExercisesTable> {
  $$ExercisesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get equipmentType => $composableBuilder(
    column: $table.equipmentType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get primaryMuscle => $composableBuilder(
    column: $table.primaryMuscle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get externalGuideUrl => $composableBuilder(
    column: $table.externalGuideUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get ownerUserId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ExercisesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExercisesTable> {
  $$ExercisesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumnWithTypeConverter<EquipmentType, String> get equipmentType =>
      $composableBuilder(
        column: $table.equipmentType,
        builder: (column) => column,
      );

  GeneratedColumn<String> get primaryMuscle => $composableBuilder(
    column: $table.primaryMuscle,
    builder: (column) => column,
  );

  GeneratedColumn<String> get externalGuideUrl => $composableBuilder(
    column: $table.externalGuideUrl,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<ExerciseRating?, String> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$UsersTableAnnotationComposer get ownerUserId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> substituteLinks<T extends Object>(
    Expression<T> Function($$ExerciseSubstitutesTableAnnotationComposer a) f,
  ) {
    final $$ExerciseSubstitutesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.exerciseSubstitutes,
          getReferencedColumn: (t) => t.exerciseId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ExerciseSubstitutesTableAnnotationComposer(
                $db: $db,
                $table: $db.exerciseSubstitutes,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> substituteOfLinks<T extends Object>(
    Expression<T> Function($$ExerciseSubstitutesTableAnnotationComposer a) f,
  ) {
    final $$ExerciseSubstitutesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.exerciseSubstitutes,
          getReferencedColumn: (t) => t.substituteExerciseId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ExerciseSubstitutesTableAnnotationComposer(
                $db: $db,
                $table: $db.exerciseSubstitutes,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> dayTypeExercisesRefs<T extends Object>(
    Expression<T> Function($$DayTypeExercisesTableAnnotationComposer a) f,
  ) {
    final $$DayTypeExercisesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dayTypeExercises,
      getReferencedColumn: (t) => t.exerciseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DayTypeExercisesTableAnnotationComposer(
            $db: $db,
            $table: $db.dayTypeExercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> plannedInSessionLogs<T extends Object>(
    Expression<T> Function($$SessionExerciseLogsTableAnnotationComposer a) f,
  ) {
    final $$SessionExerciseLogsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.sessionExerciseLogs,
          getReferencedColumn: (t) => t.plannedExerciseId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SessionExerciseLogsTableAnnotationComposer(
                $db: $db,
                $table: $db.sessionExerciseLogs,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> performedInSessionLogs<T extends Object>(
    Expression<T> Function($$SessionExerciseLogsTableAnnotationComposer a) f,
  ) {
    final $$SessionExerciseLogsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.sessionExerciseLogs,
          getReferencedColumn: (t) => t.performedExerciseId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SessionExerciseLogsTableAnnotationComposer(
                $db: $db,
                $table: $db.sessionExerciseLogs,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ExercisesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExercisesTable,
          Exercise,
          $$ExercisesTableFilterComposer,
          $$ExercisesTableOrderingComposer,
          $$ExercisesTableAnnotationComposer,
          $$ExercisesTableCreateCompanionBuilder,
          $$ExercisesTableUpdateCompanionBuilder,
          (Exercise, $$ExercisesTableReferences),
          Exercise,
          PrefetchHooks Function({
            bool ownerUserId,
            bool substituteLinks,
            bool substituteOfLinks,
            bool dayTypeExercisesRefs,
            bool plannedInSessionLogs,
            bool performedInSessionLogs,
          })
        > {
  $$ExercisesTableTableManager(_$AppDatabase db, $ExercisesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExercisesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExercisesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExercisesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> ownerUserId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<EquipmentType> equipmentType = const Value.absent(),
                Value<String> primaryMuscle = const Value.absent(),
                Value<String?> externalGuideUrl = const Value.absent(),
                Value<ExerciseRating?> rating = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExercisesCompanion(
                id: id,
                ownerUserId: ownerUserId,
                name: name,
                equipmentType: equipmentType,
                primaryMuscle: primaryMuscle,
                externalGuideUrl: externalGuideUrl,
                rating: rating,
                isArchived: isArchived,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String ownerUserId,
                required String name,
                required EquipmentType equipmentType,
                required String primaryMuscle,
                Value<String?> externalGuideUrl = const Value.absent(),
                Value<ExerciseRating?> rating = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => ExercisesCompanion.insert(
                id: id,
                ownerUserId: ownerUserId,
                name: name,
                equipmentType: equipmentType,
                primaryMuscle: primaryMuscle,
                externalGuideUrl: externalGuideUrl,
                rating: rating,
                isArchived: isArchived,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ExercisesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                ownerUserId = false,
                substituteLinks = false,
                substituteOfLinks = false,
                dayTypeExercisesRefs = false,
                plannedInSessionLogs = false,
                performedInSessionLogs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (substituteLinks) db.exerciseSubstitutes,
                    if (substituteOfLinks) db.exerciseSubstitutes,
                    if (dayTypeExercisesRefs) db.dayTypeExercises,
                    if (plannedInSessionLogs) db.sessionExerciseLogs,
                    if (performedInSessionLogs) db.sessionExerciseLogs,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (ownerUserId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.ownerUserId,
                                    referencedTable: $$ExercisesTableReferences
                                        ._ownerUserIdTable(db),
                                    referencedColumn: $$ExercisesTableReferences
                                        ._ownerUserIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (substituteLinks)
                        await $_getPrefetchedData<
                          Exercise,
                          $ExercisesTable,
                          ExerciseSubstitute
                        >(
                          currentTable: table,
                          referencedTable: $$ExercisesTableReferences
                              ._substituteLinksTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ExercisesTableReferences(
                                db,
                                table,
                                p0,
                              ).substituteLinks,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.exerciseId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (substituteOfLinks)
                        await $_getPrefetchedData<
                          Exercise,
                          $ExercisesTable,
                          ExerciseSubstitute
                        >(
                          currentTable: table,
                          referencedTable: $$ExercisesTableReferences
                              ._substituteOfLinksTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ExercisesTableReferences(
                                db,
                                table,
                                p0,
                              ).substituteOfLinks,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.substituteExerciseId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (dayTypeExercisesRefs)
                        await $_getPrefetchedData<
                          Exercise,
                          $ExercisesTable,
                          DayTypeExercise
                        >(
                          currentTable: table,
                          referencedTable: $$ExercisesTableReferences
                              ._dayTypeExercisesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ExercisesTableReferences(
                                db,
                                table,
                                p0,
                              ).dayTypeExercisesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.exerciseId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (plannedInSessionLogs)
                        await $_getPrefetchedData<
                          Exercise,
                          $ExercisesTable,
                          SessionExerciseLog
                        >(
                          currentTable: table,
                          referencedTable: $$ExercisesTableReferences
                              ._plannedInSessionLogsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ExercisesTableReferences(
                                db,
                                table,
                                p0,
                              ).plannedInSessionLogs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.plannedExerciseId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (performedInSessionLogs)
                        await $_getPrefetchedData<
                          Exercise,
                          $ExercisesTable,
                          SessionExerciseLog
                        >(
                          currentTable: table,
                          referencedTable: $$ExercisesTableReferences
                              ._performedInSessionLogsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ExercisesTableReferences(
                                db,
                                table,
                                p0,
                              ).performedInSessionLogs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.performedExerciseId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ExercisesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExercisesTable,
      Exercise,
      $$ExercisesTableFilterComposer,
      $$ExercisesTableOrderingComposer,
      $$ExercisesTableAnnotationComposer,
      $$ExercisesTableCreateCompanionBuilder,
      $$ExercisesTableUpdateCompanionBuilder,
      (Exercise, $$ExercisesTableReferences),
      Exercise,
      PrefetchHooks Function({
        bool ownerUserId,
        bool substituteLinks,
        bool substituteOfLinks,
        bool dayTypeExercisesRefs,
        bool plannedInSessionLogs,
        bool performedInSessionLogs,
      })
    >;
typedef $$ExerciseSubstitutesTableCreateCompanionBuilder =
    ExerciseSubstitutesCompanion Function({
      required String id,
      required String ownerUserId,
      required String exerciseId,
      required String substituteExerciseId,
      required int createdAt,
      required int updatedAt,
      Value<int> rowid,
    });
typedef $$ExerciseSubstitutesTableUpdateCompanionBuilder =
    ExerciseSubstitutesCompanion Function({
      Value<String> id,
      Value<String> ownerUserId,
      Value<String> exerciseId,
      Value<String> substituteExerciseId,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int> rowid,
    });

final class $$ExerciseSubstitutesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ExerciseSubstitutesTable,
          ExerciseSubstitute
        > {
  $$ExerciseSubstitutesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UsersTable _ownerUserIdTable(_$AppDatabase db) =>
      db.users.createAlias('exercise_substitutes__owner_user_id__users__id');

  $$UsersTableProcessedTableManager get ownerUserId {
    final $_column = $_itemColumn<String>('owner_user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ownerUserIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ExercisesTable _exerciseIdTable(_$AppDatabase db) => db.exercises
      .createAlias('exercise_substitutes__exercise_id__exercises__id');

  $$ExercisesTableProcessedTableManager get exerciseId {
    final $_column = $_itemColumn<String>('exercise_id')!;

    final manager = $$ExercisesTableTableManager(
      $_db,
      $_db.exercises,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_exerciseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ExercisesTable _substituteExerciseIdTable(_$AppDatabase db) =>
      db.exercises.createAlias(
        'exercise_substitutes__substitute_exercise_id__exercises__id',
      );

  $$ExercisesTableProcessedTableManager get substituteExerciseId {
    final $_column = $_itemColumn<String>('substitute_exercise_id')!;

    final manager = $$ExercisesTableTableManager(
      $_db,
      $_db.exercises,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(
      _substituteExerciseIdTable($_db),
    );
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ExerciseSubstitutesTableFilterComposer
    extends Composer<_$AppDatabase, $ExerciseSubstitutesTable> {
  $$ExerciseSubstitutesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get ownerUserId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ExercisesTableFilterComposer get exerciseId {
    final $$ExercisesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.exerciseId,
      referencedTable: $db.exercises,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisesTableFilterComposer(
            $db: $db,
            $table: $db.exercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ExercisesTableFilterComposer get substituteExerciseId {
    final $$ExercisesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.substituteExerciseId,
      referencedTable: $db.exercises,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisesTableFilterComposer(
            $db: $db,
            $table: $db.exercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ExerciseSubstitutesTableOrderingComposer
    extends Composer<_$AppDatabase, $ExerciseSubstitutesTable> {
  $$ExerciseSubstitutesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get ownerUserId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ExercisesTableOrderingComposer get exerciseId {
    final $$ExercisesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.exerciseId,
      referencedTable: $db.exercises,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisesTableOrderingComposer(
            $db: $db,
            $table: $db.exercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ExercisesTableOrderingComposer get substituteExerciseId {
    final $$ExercisesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.substituteExerciseId,
      referencedTable: $db.exercises,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisesTableOrderingComposer(
            $db: $db,
            $table: $db.exercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ExerciseSubstitutesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExerciseSubstitutesTable> {
  $$ExerciseSubstitutesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$UsersTableAnnotationComposer get ownerUserId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ExercisesTableAnnotationComposer get exerciseId {
    final $$ExercisesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.exerciseId,
      referencedTable: $db.exercises,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisesTableAnnotationComposer(
            $db: $db,
            $table: $db.exercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ExercisesTableAnnotationComposer get substituteExerciseId {
    final $$ExercisesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.substituteExerciseId,
      referencedTable: $db.exercises,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisesTableAnnotationComposer(
            $db: $db,
            $table: $db.exercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ExerciseSubstitutesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExerciseSubstitutesTable,
          ExerciseSubstitute,
          $$ExerciseSubstitutesTableFilterComposer,
          $$ExerciseSubstitutesTableOrderingComposer,
          $$ExerciseSubstitutesTableAnnotationComposer,
          $$ExerciseSubstitutesTableCreateCompanionBuilder,
          $$ExerciseSubstitutesTableUpdateCompanionBuilder,
          (ExerciseSubstitute, $$ExerciseSubstitutesTableReferences),
          ExerciseSubstitute,
          PrefetchHooks Function({
            bool ownerUserId,
            bool exerciseId,
            bool substituteExerciseId,
          })
        > {
  $$ExerciseSubstitutesTableTableManager(
    _$AppDatabase db,
    $ExerciseSubstitutesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExerciseSubstitutesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExerciseSubstitutesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ExerciseSubstitutesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> ownerUserId = const Value.absent(),
                Value<String> exerciseId = const Value.absent(),
                Value<String> substituteExerciseId = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExerciseSubstitutesCompanion(
                id: id,
                ownerUserId: ownerUserId,
                exerciseId: exerciseId,
                substituteExerciseId: substituteExerciseId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String ownerUserId,
                required String exerciseId,
                required String substituteExerciseId,
                required int createdAt,
                required int updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => ExerciseSubstitutesCompanion.insert(
                id: id,
                ownerUserId: ownerUserId,
                exerciseId: exerciseId,
                substituteExerciseId: substituteExerciseId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ExerciseSubstitutesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                ownerUserId = false,
                exerciseId = false,
                substituteExerciseId = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (ownerUserId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.ownerUserId,
                                    referencedTable:
                                        $$ExerciseSubstitutesTableReferences
                                            ._ownerUserIdTable(db),
                                    referencedColumn:
                                        $$ExerciseSubstitutesTableReferences
                                            ._ownerUserIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (exerciseId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.exerciseId,
                                    referencedTable:
                                        $$ExerciseSubstitutesTableReferences
                                            ._exerciseIdTable(db),
                                    referencedColumn:
                                        $$ExerciseSubstitutesTableReferences
                                            ._exerciseIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (substituteExerciseId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.substituteExerciseId,
                                    referencedTable:
                                        $$ExerciseSubstitutesTableReferences
                                            ._substituteExerciseIdTable(db),
                                    referencedColumn:
                                        $$ExerciseSubstitutesTableReferences
                                            ._substituteExerciseIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$ExerciseSubstitutesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExerciseSubstitutesTable,
      ExerciseSubstitute,
      $$ExerciseSubstitutesTableFilterComposer,
      $$ExerciseSubstitutesTableOrderingComposer,
      $$ExerciseSubstitutesTableAnnotationComposer,
      $$ExerciseSubstitutesTableCreateCompanionBuilder,
      $$ExerciseSubstitutesTableUpdateCompanionBuilder,
      (ExerciseSubstitute, $$ExerciseSubstitutesTableReferences),
      ExerciseSubstitute,
      PrefetchHooks Function({
        bool ownerUserId,
        bool exerciseId,
        bool substituteExerciseId,
      })
    >;
typedef $$DayTypesTableCreateCompanionBuilder =
    DayTypesCompanion Function({
      required String id,
      required String ownerUserId,
      required String name,
      Value<bool> isRest,
      required int createdAt,
      required int updatedAt,
      Value<int> rowid,
    });
typedef $$DayTypesTableUpdateCompanionBuilder =
    DayTypesCompanion Function({
      Value<String> id,
      Value<String> ownerUserId,
      Value<String> name,
      Value<bool> isRest,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int> rowid,
    });

final class $$DayTypesTableReferences
    extends BaseReferences<_$AppDatabase, $DayTypesTable, DayType> {
  $$DayTypesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _ownerUserIdTable(_$AppDatabase db) =>
      db.users.createAlias('day_types__owner_user_id__users__id');

  $$UsersTableProcessedTableManager get ownerUserId {
    final $_column = $_itemColumn<String>('owner_user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ownerUserIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$DayTypeExercisesTable, List<DayTypeExercise>>
  _dayTypeExercisesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.dayTypeExercises,
    aliasName: 'day_types__id__day_type_exercises__day_type_id',
  );

  $$DayTypeExercisesTableProcessedTableManager get dayTypeExercisesRefs {
    final manager = $$DayTypeExercisesTableTableManager(
      $_db,
      $_db.dayTypeExercises,
    ).filter((f) => f.dayTypeId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _dayTypeExercisesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$WeeklyPatternSlotsTable, List<WeeklyPatternSlot>>
  _weeklyPatternSlotsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.weeklyPatternSlots,
        aliasName: 'day_types__id__weekly_pattern_slots__day_type_id',
      );

  $$WeeklyPatternSlotsTableProcessedTableManager get weeklyPatternSlotsRefs {
    final manager = $$WeeklyPatternSlotsTableTableManager(
      $_db,
      $_db.weeklyPatternSlots,
    ).filter((f) => f.dayTypeId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _weeklyPatternSlotsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CyclicPatternSlotsTable, List<CyclicPatternSlot>>
  _cyclicPatternSlotsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.cyclicPatternSlots,
        aliasName: 'day_types__id__cyclic_pattern_slots__day_type_id',
      );

  $$CyclicPatternSlotsTableProcessedTableManager get cyclicPatternSlotsRefs {
    final manager = $$CyclicPatternSlotsTableTableManager(
      $_db,
      $_db.cyclicPatternSlots,
    ).filter((f) => f.dayTypeId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _cyclicPatternSlotsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DayOverridesTable, List<DayOverride>>
  _dayOverridesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.dayOverrides,
    aliasName: 'day_types__id__day_overrides__day_type_id',
  );

  $$DayOverridesTableProcessedTableManager get dayOverridesRefs {
    final manager = $$DayOverridesTableTableManager(
      $_db,
      $_db.dayOverrides,
    ).filter((f) => f.dayTypeId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_dayOverridesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$WorkoutSessionsTable, List<WorkoutSession>>
  _workoutSessionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.workoutSessions,
    aliasName: 'day_types__id__workout_sessions__day_type_id',
  );

  $$WorkoutSessionsTableProcessedTableManager get workoutSessionsRefs {
    final manager = $$WorkoutSessionsTableTableManager(
      $_db,
      $_db.workoutSessions,
    ).filter((f) => f.dayTypeId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _workoutSessionsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DayTypesTableFilterComposer
    extends Composer<_$AppDatabase, $DayTypesTable> {
  $$DayTypesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isRest => $composableBuilder(
    column: $table.isRest,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get ownerUserId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> dayTypeExercisesRefs(
    Expression<bool> Function($$DayTypeExercisesTableFilterComposer f) f,
  ) {
    final $$DayTypeExercisesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dayTypeExercises,
      getReferencedColumn: (t) => t.dayTypeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DayTypeExercisesTableFilterComposer(
            $db: $db,
            $table: $db.dayTypeExercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> weeklyPatternSlotsRefs(
    Expression<bool> Function($$WeeklyPatternSlotsTableFilterComposer f) f,
  ) {
    final $$WeeklyPatternSlotsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.weeklyPatternSlots,
      getReferencedColumn: (t) => t.dayTypeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WeeklyPatternSlotsTableFilterComposer(
            $db: $db,
            $table: $db.weeklyPatternSlots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> cyclicPatternSlotsRefs(
    Expression<bool> Function($$CyclicPatternSlotsTableFilterComposer f) f,
  ) {
    final $$CyclicPatternSlotsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.cyclicPatternSlots,
      getReferencedColumn: (t) => t.dayTypeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CyclicPatternSlotsTableFilterComposer(
            $db: $db,
            $table: $db.cyclicPatternSlots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> dayOverridesRefs(
    Expression<bool> Function($$DayOverridesTableFilterComposer f) f,
  ) {
    final $$DayOverridesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dayOverrides,
      getReferencedColumn: (t) => t.dayTypeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DayOverridesTableFilterComposer(
            $db: $db,
            $table: $db.dayOverrides,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> workoutSessionsRefs(
    Expression<bool> Function($$WorkoutSessionsTableFilterComposer f) f,
  ) {
    final $$WorkoutSessionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workoutSessions,
      getReferencedColumn: (t) => t.dayTypeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutSessionsTableFilterComposer(
            $db: $db,
            $table: $db.workoutSessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DayTypesTableOrderingComposer
    extends Composer<_$AppDatabase, $DayTypesTable> {
  $$DayTypesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isRest => $composableBuilder(
    column: $table.isRest,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get ownerUserId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DayTypesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DayTypesTable> {
  $$DayTypesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get isRest =>
      $composableBuilder(column: $table.isRest, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$UsersTableAnnotationComposer get ownerUserId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> dayTypeExercisesRefs<T extends Object>(
    Expression<T> Function($$DayTypeExercisesTableAnnotationComposer a) f,
  ) {
    final $$DayTypeExercisesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dayTypeExercises,
      getReferencedColumn: (t) => t.dayTypeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DayTypeExercisesTableAnnotationComposer(
            $db: $db,
            $table: $db.dayTypeExercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> weeklyPatternSlotsRefs<T extends Object>(
    Expression<T> Function($$WeeklyPatternSlotsTableAnnotationComposer a) f,
  ) {
    final $$WeeklyPatternSlotsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.weeklyPatternSlots,
          getReferencedColumn: (t) => t.dayTypeId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$WeeklyPatternSlotsTableAnnotationComposer(
                $db: $db,
                $table: $db.weeklyPatternSlots,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> cyclicPatternSlotsRefs<T extends Object>(
    Expression<T> Function($$CyclicPatternSlotsTableAnnotationComposer a) f,
  ) {
    final $$CyclicPatternSlotsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.cyclicPatternSlots,
          getReferencedColumn: (t) => t.dayTypeId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CyclicPatternSlotsTableAnnotationComposer(
                $db: $db,
                $table: $db.cyclicPatternSlots,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> dayOverridesRefs<T extends Object>(
    Expression<T> Function($$DayOverridesTableAnnotationComposer a) f,
  ) {
    final $$DayOverridesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dayOverrides,
      getReferencedColumn: (t) => t.dayTypeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DayOverridesTableAnnotationComposer(
            $db: $db,
            $table: $db.dayOverrides,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> workoutSessionsRefs<T extends Object>(
    Expression<T> Function($$WorkoutSessionsTableAnnotationComposer a) f,
  ) {
    final $$WorkoutSessionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workoutSessions,
      getReferencedColumn: (t) => t.dayTypeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutSessionsTableAnnotationComposer(
            $db: $db,
            $table: $db.workoutSessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DayTypesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DayTypesTable,
          DayType,
          $$DayTypesTableFilterComposer,
          $$DayTypesTableOrderingComposer,
          $$DayTypesTableAnnotationComposer,
          $$DayTypesTableCreateCompanionBuilder,
          $$DayTypesTableUpdateCompanionBuilder,
          (DayType, $$DayTypesTableReferences),
          DayType,
          PrefetchHooks Function({
            bool ownerUserId,
            bool dayTypeExercisesRefs,
            bool weeklyPatternSlotsRefs,
            bool cyclicPatternSlotsRefs,
            bool dayOverridesRefs,
            bool workoutSessionsRefs,
          })
        > {
  $$DayTypesTableTableManager(_$AppDatabase db, $DayTypesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DayTypesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DayTypesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DayTypesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> ownerUserId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<bool> isRest = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DayTypesCompanion(
                id: id,
                ownerUserId: ownerUserId,
                name: name,
                isRest: isRest,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String ownerUserId,
                required String name,
                Value<bool> isRest = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => DayTypesCompanion.insert(
                id: id,
                ownerUserId: ownerUserId,
                name: name,
                isRest: isRest,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DayTypesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                ownerUserId = false,
                dayTypeExercisesRefs = false,
                weeklyPatternSlotsRefs = false,
                cyclicPatternSlotsRefs = false,
                dayOverridesRefs = false,
                workoutSessionsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (dayTypeExercisesRefs) db.dayTypeExercises,
                    if (weeklyPatternSlotsRefs) db.weeklyPatternSlots,
                    if (cyclicPatternSlotsRefs) db.cyclicPatternSlots,
                    if (dayOverridesRefs) db.dayOverrides,
                    if (workoutSessionsRefs) db.workoutSessions,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (ownerUserId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.ownerUserId,
                                    referencedTable: $$DayTypesTableReferences
                                        ._ownerUserIdTable(db),
                                    referencedColumn: $$DayTypesTableReferences
                                        ._ownerUserIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (dayTypeExercisesRefs)
                        await $_getPrefetchedData<
                          DayType,
                          $DayTypesTable,
                          DayTypeExercise
                        >(
                          currentTable: table,
                          referencedTable: $$DayTypesTableReferences
                              ._dayTypeExercisesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DayTypesTableReferences(
                                db,
                                table,
                                p0,
                              ).dayTypeExercisesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.dayTypeId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (weeklyPatternSlotsRefs)
                        await $_getPrefetchedData<
                          DayType,
                          $DayTypesTable,
                          WeeklyPatternSlot
                        >(
                          currentTable: table,
                          referencedTable: $$DayTypesTableReferences
                              ._weeklyPatternSlotsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DayTypesTableReferences(
                                db,
                                table,
                                p0,
                              ).weeklyPatternSlotsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.dayTypeId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (cyclicPatternSlotsRefs)
                        await $_getPrefetchedData<
                          DayType,
                          $DayTypesTable,
                          CyclicPatternSlot
                        >(
                          currentTable: table,
                          referencedTable: $$DayTypesTableReferences
                              ._cyclicPatternSlotsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DayTypesTableReferences(
                                db,
                                table,
                                p0,
                              ).cyclicPatternSlotsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.dayTypeId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (dayOverridesRefs)
                        await $_getPrefetchedData<
                          DayType,
                          $DayTypesTable,
                          DayOverride
                        >(
                          currentTable: table,
                          referencedTable: $$DayTypesTableReferences
                              ._dayOverridesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DayTypesTableReferences(
                                db,
                                table,
                                p0,
                              ).dayOverridesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.dayTypeId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (workoutSessionsRefs)
                        await $_getPrefetchedData<
                          DayType,
                          $DayTypesTable,
                          WorkoutSession
                        >(
                          currentTable: table,
                          referencedTable: $$DayTypesTableReferences
                              ._workoutSessionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DayTypesTableReferences(
                                db,
                                table,
                                p0,
                              ).workoutSessionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.dayTypeId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$DayTypesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DayTypesTable,
      DayType,
      $$DayTypesTableFilterComposer,
      $$DayTypesTableOrderingComposer,
      $$DayTypesTableAnnotationComposer,
      $$DayTypesTableCreateCompanionBuilder,
      $$DayTypesTableUpdateCompanionBuilder,
      (DayType, $$DayTypesTableReferences),
      DayType,
      PrefetchHooks Function({
        bool ownerUserId,
        bool dayTypeExercisesRefs,
        bool weeklyPatternSlotsRefs,
        bool cyclicPatternSlotsRefs,
        bool dayOverridesRefs,
        bool workoutSessionsRefs,
      })
    >;
typedef $$DayTypeExercisesTableCreateCompanionBuilder =
    DayTypeExercisesCompanion Function({
      required String id,
      required String ownerUserId,
      required String dayTypeId,
      required String exerciseId,
      required int position,
      required int targetRepMin,
      required int targetRepMax,
      Value<String?> supersetGroupId,
      required int createdAt,
      required int updatedAt,
      Value<int> rowid,
    });
typedef $$DayTypeExercisesTableUpdateCompanionBuilder =
    DayTypeExercisesCompanion Function({
      Value<String> id,
      Value<String> ownerUserId,
      Value<String> dayTypeId,
      Value<String> exerciseId,
      Value<int> position,
      Value<int> targetRepMin,
      Value<int> targetRepMax,
      Value<String?> supersetGroupId,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int> rowid,
    });

final class $$DayTypeExercisesTableReferences
    extends
        BaseReferences<_$AppDatabase, $DayTypeExercisesTable, DayTypeExercise> {
  $$DayTypeExercisesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UsersTable _ownerUserIdTable(_$AppDatabase db) =>
      db.users.createAlias('day_type_exercises__owner_user_id__users__id');

  $$UsersTableProcessedTableManager get ownerUserId {
    final $_column = $_itemColumn<String>('owner_user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ownerUserIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DayTypesTable _dayTypeIdTable(_$AppDatabase db) =>
      db.dayTypes.createAlias('day_type_exercises__day_type_id__day_types__id');

  $$DayTypesTableProcessedTableManager get dayTypeId {
    final $_column = $_itemColumn<String>('day_type_id')!;

    final manager = $$DayTypesTableTableManager(
      $_db,
      $_db.dayTypes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_dayTypeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ExercisesTable _exerciseIdTable(_$AppDatabase db) => db.exercises
      .createAlias('day_type_exercises__exercise_id__exercises__id');

  $$ExercisesTableProcessedTableManager get exerciseId {
    final $_column = $_itemColumn<String>('exercise_id')!;

    final manager = $$ExercisesTableTableManager(
      $_db,
      $_db.exercises,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_exerciseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DayTypeExercisesTableFilterComposer
    extends Composer<_$AppDatabase, $DayTypeExercisesTable> {
  $$DayTypeExercisesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get targetRepMin => $composableBuilder(
    column: $table.targetRepMin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get targetRepMax => $composableBuilder(
    column: $table.targetRepMax,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get supersetGroupId => $composableBuilder(
    column: $table.supersetGroupId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get ownerUserId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DayTypesTableFilterComposer get dayTypeId {
    final $$DayTypesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dayTypeId,
      referencedTable: $db.dayTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DayTypesTableFilterComposer(
            $db: $db,
            $table: $db.dayTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ExercisesTableFilterComposer get exerciseId {
    final $$ExercisesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.exerciseId,
      referencedTable: $db.exercises,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisesTableFilterComposer(
            $db: $db,
            $table: $db.exercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DayTypeExercisesTableOrderingComposer
    extends Composer<_$AppDatabase, $DayTypeExercisesTable> {
  $$DayTypeExercisesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get targetRepMin => $composableBuilder(
    column: $table.targetRepMin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get targetRepMax => $composableBuilder(
    column: $table.targetRepMax,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get supersetGroupId => $composableBuilder(
    column: $table.supersetGroupId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get ownerUserId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DayTypesTableOrderingComposer get dayTypeId {
    final $$DayTypesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dayTypeId,
      referencedTable: $db.dayTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DayTypesTableOrderingComposer(
            $db: $db,
            $table: $db.dayTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ExercisesTableOrderingComposer get exerciseId {
    final $$ExercisesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.exerciseId,
      referencedTable: $db.exercises,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisesTableOrderingComposer(
            $db: $db,
            $table: $db.exercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DayTypeExercisesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DayTypeExercisesTable> {
  $$DayTypeExercisesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get position =>
      $composableBuilder(column: $table.position, builder: (column) => column);

  GeneratedColumn<int> get targetRepMin => $composableBuilder(
    column: $table.targetRepMin,
    builder: (column) => column,
  );

  GeneratedColumn<int> get targetRepMax => $composableBuilder(
    column: $table.targetRepMax,
    builder: (column) => column,
  );

  GeneratedColumn<String> get supersetGroupId => $composableBuilder(
    column: $table.supersetGroupId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$UsersTableAnnotationComposer get ownerUserId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DayTypesTableAnnotationComposer get dayTypeId {
    final $$DayTypesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dayTypeId,
      referencedTable: $db.dayTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DayTypesTableAnnotationComposer(
            $db: $db,
            $table: $db.dayTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ExercisesTableAnnotationComposer get exerciseId {
    final $$ExercisesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.exerciseId,
      referencedTable: $db.exercises,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisesTableAnnotationComposer(
            $db: $db,
            $table: $db.exercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DayTypeExercisesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DayTypeExercisesTable,
          DayTypeExercise,
          $$DayTypeExercisesTableFilterComposer,
          $$DayTypeExercisesTableOrderingComposer,
          $$DayTypeExercisesTableAnnotationComposer,
          $$DayTypeExercisesTableCreateCompanionBuilder,
          $$DayTypeExercisesTableUpdateCompanionBuilder,
          (DayTypeExercise, $$DayTypeExercisesTableReferences),
          DayTypeExercise,
          PrefetchHooks Function({
            bool ownerUserId,
            bool dayTypeId,
            bool exerciseId,
          })
        > {
  $$DayTypeExercisesTableTableManager(
    _$AppDatabase db,
    $DayTypeExercisesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DayTypeExercisesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DayTypeExercisesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DayTypeExercisesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> ownerUserId = const Value.absent(),
                Value<String> dayTypeId = const Value.absent(),
                Value<String> exerciseId = const Value.absent(),
                Value<int> position = const Value.absent(),
                Value<int> targetRepMin = const Value.absent(),
                Value<int> targetRepMax = const Value.absent(),
                Value<String?> supersetGroupId = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DayTypeExercisesCompanion(
                id: id,
                ownerUserId: ownerUserId,
                dayTypeId: dayTypeId,
                exerciseId: exerciseId,
                position: position,
                targetRepMin: targetRepMin,
                targetRepMax: targetRepMax,
                supersetGroupId: supersetGroupId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String ownerUserId,
                required String dayTypeId,
                required String exerciseId,
                required int position,
                required int targetRepMin,
                required int targetRepMax,
                Value<String?> supersetGroupId = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => DayTypeExercisesCompanion.insert(
                id: id,
                ownerUserId: ownerUserId,
                dayTypeId: dayTypeId,
                exerciseId: exerciseId,
                position: position,
                targetRepMin: targetRepMin,
                targetRepMax: targetRepMax,
                supersetGroupId: supersetGroupId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DayTypeExercisesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({ownerUserId = false, dayTypeId = false, exerciseId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (ownerUserId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.ownerUserId,
                                    referencedTable:
                                        $$DayTypeExercisesTableReferences
                                            ._ownerUserIdTable(db),
                                    referencedColumn:
                                        $$DayTypeExercisesTableReferences
                                            ._ownerUserIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (dayTypeId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.dayTypeId,
                                    referencedTable:
                                        $$DayTypeExercisesTableReferences
                                            ._dayTypeIdTable(db),
                                    referencedColumn:
                                        $$DayTypeExercisesTableReferences
                                            ._dayTypeIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (exerciseId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.exerciseId,
                                    referencedTable:
                                        $$DayTypeExercisesTableReferences
                                            ._exerciseIdTable(db),
                                    referencedColumn:
                                        $$DayTypeExercisesTableReferences
                                            ._exerciseIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$DayTypeExercisesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DayTypeExercisesTable,
      DayTypeExercise,
      $$DayTypeExercisesTableFilterComposer,
      $$DayTypeExercisesTableOrderingComposer,
      $$DayTypeExercisesTableAnnotationComposer,
      $$DayTypeExercisesTableCreateCompanionBuilder,
      $$DayTypeExercisesTableUpdateCompanionBuilder,
      (DayTypeExercise, $$DayTypeExercisesTableReferences),
      DayTypeExercise,
      PrefetchHooks Function({
        bool ownerUserId,
        bool dayTypeId,
        bool exerciseId,
      })
    >;
typedef $$RoutinePatternsTableCreateCompanionBuilder =
    RoutinePatternsCompanion Function({
      required String id,
      required String ownerUserId,
      required PatternMode mode,
      Value<int?> cyclicPosition,
      required int createdAt,
      required int updatedAt,
      Value<int> rowid,
    });
typedef $$RoutinePatternsTableUpdateCompanionBuilder =
    RoutinePatternsCompanion Function({
      Value<String> id,
      Value<String> ownerUserId,
      Value<PatternMode> mode,
      Value<int?> cyclicPosition,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int> rowid,
    });

final class $$RoutinePatternsTableReferences
    extends
        BaseReferences<_$AppDatabase, $RoutinePatternsTable, RoutinePattern> {
  $$RoutinePatternsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UsersTable _ownerUserIdTable(_$AppDatabase db) =>
      db.users.createAlias('routine_patterns__owner_user_id__users__id');

  $$UsersTableProcessedTableManager get ownerUserId {
    final $_column = $_itemColumn<String>('owner_user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ownerUserIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$WeeklyPatternSlotsTable, List<WeeklyPatternSlot>>
  _weeklyPatternSlotsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.weeklyPatternSlots,
        aliasName: 'routine_patterns__id__weekly_pattern_slots__pattern_id',
      );

  $$WeeklyPatternSlotsTableProcessedTableManager get weeklyPatternSlotsRefs {
    final manager = $$WeeklyPatternSlotsTableTableManager(
      $_db,
      $_db.weeklyPatternSlots,
    ).filter((f) => f.patternId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _weeklyPatternSlotsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CyclicPatternSlotsTable, List<CyclicPatternSlot>>
  _cyclicPatternSlotsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.cyclicPatternSlots,
        aliasName: 'routine_patterns__id__cyclic_pattern_slots__pattern_id',
      );

  $$CyclicPatternSlotsTableProcessedTableManager get cyclicPatternSlotsRefs {
    final manager = $$CyclicPatternSlotsTableTableManager(
      $_db,
      $_db.cyclicPatternSlots,
    ).filter((f) => f.patternId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _cyclicPatternSlotsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RoutinePatternsTableFilterComposer
    extends Composer<_$AppDatabase, $RoutinePatternsTable> {
  $$RoutinePatternsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<PatternMode, PatternMode, String> get mode =>
      $composableBuilder(
        column: $table.mode,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<int> get cyclicPosition => $composableBuilder(
    column: $table.cyclicPosition,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get ownerUserId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> weeklyPatternSlotsRefs(
    Expression<bool> Function($$WeeklyPatternSlotsTableFilterComposer f) f,
  ) {
    final $$WeeklyPatternSlotsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.weeklyPatternSlots,
      getReferencedColumn: (t) => t.patternId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WeeklyPatternSlotsTableFilterComposer(
            $db: $db,
            $table: $db.weeklyPatternSlots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> cyclicPatternSlotsRefs(
    Expression<bool> Function($$CyclicPatternSlotsTableFilterComposer f) f,
  ) {
    final $$CyclicPatternSlotsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.cyclicPatternSlots,
      getReferencedColumn: (t) => t.patternId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CyclicPatternSlotsTableFilterComposer(
            $db: $db,
            $table: $db.cyclicPatternSlots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RoutinePatternsTableOrderingComposer
    extends Composer<_$AppDatabase, $RoutinePatternsTable> {
  $$RoutinePatternsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mode => $composableBuilder(
    column: $table.mode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cyclicPosition => $composableBuilder(
    column: $table.cyclicPosition,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get ownerUserId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RoutinePatternsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoutinePatternsTable> {
  $$RoutinePatternsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<PatternMode, String> get mode =>
      $composableBuilder(column: $table.mode, builder: (column) => column);

  GeneratedColumn<int> get cyclicPosition => $composableBuilder(
    column: $table.cyclicPosition,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$UsersTableAnnotationComposer get ownerUserId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> weeklyPatternSlotsRefs<T extends Object>(
    Expression<T> Function($$WeeklyPatternSlotsTableAnnotationComposer a) f,
  ) {
    final $$WeeklyPatternSlotsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.weeklyPatternSlots,
          getReferencedColumn: (t) => t.patternId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$WeeklyPatternSlotsTableAnnotationComposer(
                $db: $db,
                $table: $db.weeklyPatternSlots,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> cyclicPatternSlotsRefs<T extends Object>(
    Expression<T> Function($$CyclicPatternSlotsTableAnnotationComposer a) f,
  ) {
    final $$CyclicPatternSlotsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.cyclicPatternSlots,
          getReferencedColumn: (t) => t.patternId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CyclicPatternSlotsTableAnnotationComposer(
                $db: $db,
                $table: $db.cyclicPatternSlots,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$RoutinePatternsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RoutinePatternsTable,
          RoutinePattern,
          $$RoutinePatternsTableFilterComposer,
          $$RoutinePatternsTableOrderingComposer,
          $$RoutinePatternsTableAnnotationComposer,
          $$RoutinePatternsTableCreateCompanionBuilder,
          $$RoutinePatternsTableUpdateCompanionBuilder,
          (RoutinePattern, $$RoutinePatternsTableReferences),
          RoutinePattern,
          PrefetchHooks Function({
            bool ownerUserId,
            bool weeklyPatternSlotsRefs,
            bool cyclicPatternSlotsRefs,
          })
        > {
  $$RoutinePatternsTableTableManager(
    _$AppDatabase db,
    $RoutinePatternsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoutinePatternsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoutinePatternsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoutinePatternsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> ownerUserId = const Value.absent(),
                Value<PatternMode> mode = const Value.absent(),
                Value<int?> cyclicPosition = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoutinePatternsCompanion(
                id: id,
                ownerUserId: ownerUserId,
                mode: mode,
                cyclicPosition: cyclicPosition,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String ownerUserId,
                required PatternMode mode,
                Value<int?> cyclicPosition = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => RoutinePatternsCompanion.insert(
                id: id,
                ownerUserId: ownerUserId,
                mode: mode,
                cyclicPosition: cyclicPosition,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RoutinePatternsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                ownerUserId = false,
                weeklyPatternSlotsRefs = false,
                cyclicPatternSlotsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (weeklyPatternSlotsRefs) db.weeklyPatternSlots,
                    if (cyclicPatternSlotsRefs) db.cyclicPatternSlots,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (ownerUserId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.ownerUserId,
                                    referencedTable:
                                        $$RoutinePatternsTableReferences
                                            ._ownerUserIdTable(db),
                                    referencedColumn:
                                        $$RoutinePatternsTableReferences
                                            ._ownerUserIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (weeklyPatternSlotsRefs)
                        await $_getPrefetchedData<
                          RoutinePattern,
                          $RoutinePatternsTable,
                          WeeklyPatternSlot
                        >(
                          currentTable: table,
                          referencedTable: $$RoutinePatternsTableReferences
                              ._weeklyPatternSlotsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RoutinePatternsTableReferences(
                                db,
                                table,
                                p0,
                              ).weeklyPatternSlotsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.patternId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (cyclicPatternSlotsRefs)
                        await $_getPrefetchedData<
                          RoutinePattern,
                          $RoutinePatternsTable,
                          CyclicPatternSlot
                        >(
                          currentTable: table,
                          referencedTable: $$RoutinePatternsTableReferences
                              ._cyclicPatternSlotsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RoutinePatternsTableReferences(
                                db,
                                table,
                                p0,
                              ).cyclicPatternSlotsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.patternId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$RoutinePatternsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RoutinePatternsTable,
      RoutinePattern,
      $$RoutinePatternsTableFilterComposer,
      $$RoutinePatternsTableOrderingComposer,
      $$RoutinePatternsTableAnnotationComposer,
      $$RoutinePatternsTableCreateCompanionBuilder,
      $$RoutinePatternsTableUpdateCompanionBuilder,
      (RoutinePattern, $$RoutinePatternsTableReferences),
      RoutinePattern,
      PrefetchHooks Function({
        bool ownerUserId,
        bool weeklyPatternSlotsRefs,
        bool cyclicPatternSlotsRefs,
      })
    >;
typedef $$WeeklyPatternSlotsTableCreateCompanionBuilder =
    WeeklyPatternSlotsCompanion Function({
      required String id,
      required String patternId,
      required int dayOfWeek,
      required String dayTypeId,
      Value<int> rowid,
    });
typedef $$WeeklyPatternSlotsTableUpdateCompanionBuilder =
    WeeklyPatternSlotsCompanion Function({
      Value<String> id,
      Value<String> patternId,
      Value<int> dayOfWeek,
      Value<String> dayTypeId,
      Value<int> rowid,
    });

final class $$WeeklyPatternSlotsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $WeeklyPatternSlotsTable,
          WeeklyPatternSlot
        > {
  $$WeeklyPatternSlotsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $RoutinePatternsTable _patternIdTable(_$AppDatabase db) => db
      .routinePatterns
      .createAlias('weekly_pattern_slots__pattern_id__routine_patterns__id');

  $$RoutinePatternsTableProcessedTableManager get patternId {
    final $_column = $_itemColumn<String>('pattern_id')!;

    final manager = $$RoutinePatternsTableTableManager(
      $_db,
      $_db.routinePatterns,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_patternIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DayTypesTable _dayTypeIdTable(_$AppDatabase db) => db.dayTypes
      .createAlias('weekly_pattern_slots__day_type_id__day_types__id');

  $$DayTypesTableProcessedTableManager get dayTypeId {
    final $_column = $_itemColumn<String>('day_type_id')!;

    final manager = $$DayTypesTableTableManager(
      $_db,
      $_db.dayTypes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_dayTypeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$WeeklyPatternSlotsTableFilterComposer
    extends Composer<_$AppDatabase, $WeeklyPatternSlotsTable> {
  $$WeeklyPatternSlotsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dayOfWeek => $composableBuilder(
    column: $table.dayOfWeek,
    builder: (column) => ColumnFilters(column),
  );

  $$RoutinePatternsTableFilterComposer get patternId {
    final $$RoutinePatternsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.patternId,
      referencedTable: $db.routinePatterns,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutinePatternsTableFilterComposer(
            $db: $db,
            $table: $db.routinePatterns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DayTypesTableFilterComposer get dayTypeId {
    final $$DayTypesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dayTypeId,
      referencedTable: $db.dayTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DayTypesTableFilterComposer(
            $db: $db,
            $table: $db.dayTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WeeklyPatternSlotsTableOrderingComposer
    extends Composer<_$AppDatabase, $WeeklyPatternSlotsTable> {
  $$WeeklyPatternSlotsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dayOfWeek => $composableBuilder(
    column: $table.dayOfWeek,
    builder: (column) => ColumnOrderings(column),
  );

  $$RoutinePatternsTableOrderingComposer get patternId {
    final $$RoutinePatternsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.patternId,
      referencedTable: $db.routinePatterns,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutinePatternsTableOrderingComposer(
            $db: $db,
            $table: $db.routinePatterns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DayTypesTableOrderingComposer get dayTypeId {
    final $$DayTypesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dayTypeId,
      referencedTable: $db.dayTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DayTypesTableOrderingComposer(
            $db: $db,
            $table: $db.dayTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WeeklyPatternSlotsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WeeklyPatternSlotsTable> {
  $$WeeklyPatternSlotsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get dayOfWeek =>
      $composableBuilder(column: $table.dayOfWeek, builder: (column) => column);

  $$RoutinePatternsTableAnnotationComposer get patternId {
    final $$RoutinePatternsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.patternId,
      referencedTable: $db.routinePatterns,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutinePatternsTableAnnotationComposer(
            $db: $db,
            $table: $db.routinePatterns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DayTypesTableAnnotationComposer get dayTypeId {
    final $$DayTypesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dayTypeId,
      referencedTable: $db.dayTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DayTypesTableAnnotationComposer(
            $db: $db,
            $table: $db.dayTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WeeklyPatternSlotsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WeeklyPatternSlotsTable,
          WeeklyPatternSlot,
          $$WeeklyPatternSlotsTableFilterComposer,
          $$WeeklyPatternSlotsTableOrderingComposer,
          $$WeeklyPatternSlotsTableAnnotationComposer,
          $$WeeklyPatternSlotsTableCreateCompanionBuilder,
          $$WeeklyPatternSlotsTableUpdateCompanionBuilder,
          (WeeklyPatternSlot, $$WeeklyPatternSlotsTableReferences),
          WeeklyPatternSlot,
          PrefetchHooks Function({bool patternId, bool dayTypeId})
        > {
  $$WeeklyPatternSlotsTableTableManager(
    _$AppDatabase db,
    $WeeklyPatternSlotsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WeeklyPatternSlotsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WeeklyPatternSlotsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WeeklyPatternSlotsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> patternId = const Value.absent(),
                Value<int> dayOfWeek = const Value.absent(),
                Value<String> dayTypeId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WeeklyPatternSlotsCompanion(
                id: id,
                patternId: patternId,
                dayOfWeek: dayOfWeek,
                dayTypeId: dayTypeId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String patternId,
                required int dayOfWeek,
                required String dayTypeId,
                Value<int> rowid = const Value.absent(),
              }) => WeeklyPatternSlotsCompanion.insert(
                id: id,
                patternId: patternId,
                dayOfWeek: dayOfWeek,
                dayTypeId: dayTypeId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$WeeklyPatternSlotsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({patternId = false, dayTypeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (patternId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.patternId,
                                referencedTable:
                                    $$WeeklyPatternSlotsTableReferences
                                        ._patternIdTable(db),
                                referencedColumn:
                                    $$WeeklyPatternSlotsTableReferences
                                        ._patternIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (dayTypeId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.dayTypeId,
                                referencedTable:
                                    $$WeeklyPatternSlotsTableReferences
                                        ._dayTypeIdTable(db),
                                referencedColumn:
                                    $$WeeklyPatternSlotsTableReferences
                                        ._dayTypeIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$WeeklyPatternSlotsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WeeklyPatternSlotsTable,
      WeeklyPatternSlot,
      $$WeeklyPatternSlotsTableFilterComposer,
      $$WeeklyPatternSlotsTableOrderingComposer,
      $$WeeklyPatternSlotsTableAnnotationComposer,
      $$WeeklyPatternSlotsTableCreateCompanionBuilder,
      $$WeeklyPatternSlotsTableUpdateCompanionBuilder,
      (WeeklyPatternSlot, $$WeeklyPatternSlotsTableReferences),
      WeeklyPatternSlot,
      PrefetchHooks Function({bool patternId, bool dayTypeId})
    >;
typedef $$CyclicPatternSlotsTableCreateCompanionBuilder =
    CyclicPatternSlotsCompanion Function({
      required String id,
      required String patternId,
      required int position,
      required String dayTypeId,
      Value<int> rowid,
    });
typedef $$CyclicPatternSlotsTableUpdateCompanionBuilder =
    CyclicPatternSlotsCompanion Function({
      Value<String> id,
      Value<String> patternId,
      Value<int> position,
      Value<String> dayTypeId,
      Value<int> rowid,
    });

final class $$CyclicPatternSlotsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $CyclicPatternSlotsTable,
          CyclicPatternSlot
        > {
  $$CyclicPatternSlotsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $RoutinePatternsTable _patternIdTable(_$AppDatabase db) => db
      .routinePatterns
      .createAlias('cyclic_pattern_slots__pattern_id__routine_patterns__id');

  $$RoutinePatternsTableProcessedTableManager get patternId {
    final $_column = $_itemColumn<String>('pattern_id')!;

    final manager = $$RoutinePatternsTableTableManager(
      $_db,
      $_db.routinePatterns,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_patternIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DayTypesTable _dayTypeIdTable(_$AppDatabase db) => db.dayTypes
      .createAlias('cyclic_pattern_slots__day_type_id__day_types__id');

  $$DayTypesTableProcessedTableManager get dayTypeId {
    final $_column = $_itemColumn<String>('day_type_id')!;

    final manager = $$DayTypesTableTableManager(
      $_db,
      $_db.dayTypes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_dayTypeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CyclicPatternSlotsTableFilterComposer
    extends Composer<_$AppDatabase, $CyclicPatternSlotsTable> {
  $$CyclicPatternSlotsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnFilters(column),
  );

  $$RoutinePatternsTableFilterComposer get patternId {
    final $$RoutinePatternsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.patternId,
      referencedTable: $db.routinePatterns,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutinePatternsTableFilterComposer(
            $db: $db,
            $table: $db.routinePatterns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DayTypesTableFilterComposer get dayTypeId {
    final $$DayTypesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dayTypeId,
      referencedTable: $db.dayTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DayTypesTableFilterComposer(
            $db: $db,
            $table: $db.dayTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CyclicPatternSlotsTableOrderingComposer
    extends Composer<_$AppDatabase, $CyclicPatternSlotsTable> {
  $$CyclicPatternSlotsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnOrderings(column),
  );

  $$RoutinePatternsTableOrderingComposer get patternId {
    final $$RoutinePatternsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.patternId,
      referencedTable: $db.routinePatterns,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutinePatternsTableOrderingComposer(
            $db: $db,
            $table: $db.routinePatterns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DayTypesTableOrderingComposer get dayTypeId {
    final $$DayTypesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dayTypeId,
      referencedTable: $db.dayTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DayTypesTableOrderingComposer(
            $db: $db,
            $table: $db.dayTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CyclicPatternSlotsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CyclicPatternSlotsTable> {
  $$CyclicPatternSlotsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get position =>
      $composableBuilder(column: $table.position, builder: (column) => column);

  $$RoutinePatternsTableAnnotationComposer get patternId {
    final $$RoutinePatternsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.patternId,
      referencedTable: $db.routinePatterns,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoutinePatternsTableAnnotationComposer(
            $db: $db,
            $table: $db.routinePatterns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DayTypesTableAnnotationComposer get dayTypeId {
    final $$DayTypesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dayTypeId,
      referencedTable: $db.dayTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DayTypesTableAnnotationComposer(
            $db: $db,
            $table: $db.dayTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CyclicPatternSlotsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CyclicPatternSlotsTable,
          CyclicPatternSlot,
          $$CyclicPatternSlotsTableFilterComposer,
          $$CyclicPatternSlotsTableOrderingComposer,
          $$CyclicPatternSlotsTableAnnotationComposer,
          $$CyclicPatternSlotsTableCreateCompanionBuilder,
          $$CyclicPatternSlotsTableUpdateCompanionBuilder,
          (CyclicPatternSlot, $$CyclicPatternSlotsTableReferences),
          CyclicPatternSlot,
          PrefetchHooks Function({bool patternId, bool dayTypeId})
        > {
  $$CyclicPatternSlotsTableTableManager(
    _$AppDatabase db,
    $CyclicPatternSlotsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CyclicPatternSlotsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CyclicPatternSlotsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CyclicPatternSlotsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> patternId = const Value.absent(),
                Value<int> position = const Value.absent(),
                Value<String> dayTypeId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CyclicPatternSlotsCompanion(
                id: id,
                patternId: patternId,
                position: position,
                dayTypeId: dayTypeId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String patternId,
                required int position,
                required String dayTypeId,
                Value<int> rowid = const Value.absent(),
              }) => CyclicPatternSlotsCompanion.insert(
                id: id,
                patternId: patternId,
                position: position,
                dayTypeId: dayTypeId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CyclicPatternSlotsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({patternId = false, dayTypeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (patternId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.patternId,
                                referencedTable:
                                    $$CyclicPatternSlotsTableReferences
                                        ._patternIdTable(db),
                                referencedColumn:
                                    $$CyclicPatternSlotsTableReferences
                                        ._patternIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (dayTypeId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.dayTypeId,
                                referencedTable:
                                    $$CyclicPatternSlotsTableReferences
                                        ._dayTypeIdTable(db),
                                referencedColumn:
                                    $$CyclicPatternSlotsTableReferences
                                        ._dayTypeIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CyclicPatternSlotsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CyclicPatternSlotsTable,
      CyclicPatternSlot,
      $$CyclicPatternSlotsTableFilterComposer,
      $$CyclicPatternSlotsTableOrderingComposer,
      $$CyclicPatternSlotsTableAnnotationComposer,
      $$CyclicPatternSlotsTableCreateCompanionBuilder,
      $$CyclicPatternSlotsTableUpdateCompanionBuilder,
      (CyclicPatternSlot, $$CyclicPatternSlotsTableReferences),
      CyclicPatternSlot,
      PrefetchHooks Function({bool patternId, bool dayTypeId})
    >;
typedef $$DayOverridesTableCreateCompanionBuilder =
    DayOverridesCompanion Function({
      required String id,
      required String ownerUserId,
      required String date,
      required String dayTypeId,
      required int createdAt,
      required int updatedAt,
      Value<int> rowid,
    });
typedef $$DayOverridesTableUpdateCompanionBuilder =
    DayOverridesCompanion Function({
      Value<String> id,
      Value<String> ownerUserId,
      Value<String> date,
      Value<String> dayTypeId,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int> rowid,
    });

final class $$DayOverridesTableReferences
    extends BaseReferences<_$AppDatabase, $DayOverridesTable, DayOverride> {
  $$DayOverridesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _ownerUserIdTable(_$AppDatabase db) =>
      db.users.createAlias('day_overrides__owner_user_id__users__id');

  $$UsersTableProcessedTableManager get ownerUserId {
    final $_column = $_itemColumn<String>('owner_user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ownerUserIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DayTypesTable _dayTypeIdTable(_$AppDatabase db) =>
      db.dayTypes.createAlias('day_overrides__day_type_id__day_types__id');

  $$DayTypesTableProcessedTableManager get dayTypeId {
    final $_column = $_itemColumn<String>('day_type_id')!;

    final manager = $$DayTypesTableTableManager(
      $_db,
      $_db.dayTypes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_dayTypeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DayOverridesTableFilterComposer
    extends Composer<_$AppDatabase, $DayOverridesTable> {
  $$DayOverridesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get ownerUserId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DayTypesTableFilterComposer get dayTypeId {
    final $$DayTypesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dayTypeId,
      referencedTable: $db.dayTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DayTypesTableFilterComposer(
            $db: $db,
            $table: $db.dayTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DayOverridesTableOrderingComposer
    extends Composer<_$AppDatabase, $DayOverridesTable> {
  $$DayOverridesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get ownerUserId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DayTypesTableOrderingComposer get dayTypeId {
    final $$DayTypesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dayTypeId,
      referencedTable: $db.dayTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DayTypesTableOrderingComposer(
            $db: $db,
            $table: $db.dayTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DayOverridesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DayOverridesTable> {
  $$DayOverridesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$UsersTableAnnotationComposer get ownerUserId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DayTypesTableAnnotationComposer get dayTypeId {
    final $$DayTypesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dayTypeId,
      referencedTable: $db.dayTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DayTypesTableAnnotationComposer(
            $db: $db,
            $table: $db.dayTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DayOverridesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DayOverridesTable,
          DayOverride,
          $$DayOverridesTableFilterComposer,
          $$DayOverridesTableOrderingComposer,
          $$DayOverridesTableAnnotationComposer,
          $$DayOverridesTableCreateCompanionBuilder,
          $$DayOverridesTableUpdateCompanionBuilder,
          (DayOverride, $$DayOverridesTableReferences),
          DayOverride,
          PrefetchHooks Function({bool ownerUserId, bool dayTypeId})
        > {
  $$DayOverridesTableTableManager(_$AppDatabase db, $DayOverridesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DayOverridesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DayOverridesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DayOverridesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> ownerUserId = const Value.absent(),
                Value<String> date = const Value.absent(),
                Value<String> dayTypeId = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DayOverridesCompanion(
                id: id,
                ownerUserId: ownerUserId,
                date: date,
                dayTypeId: dayTypeId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String ownerUserId,
                required String date,
                required String dayTypeId,
                required int createdAt,
                required int updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => DayOverridesCompanion.insert(
                id: id,
                ownerUserId: ownerUserId,
                date: date,
                dayTypeId: dayTypeId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DayOverridesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({ownerUserId = false, dayTypeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (ownerUserId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.ownerUserId,
                                referencedTable: $$DayOverridesTableReferences
                                    ._ownerUserIdTable(db),
                                referencedColumn: $$DayOverridesTableReferences
                                    ._ownerUserIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (dayTypeId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.dayTypeId,
                                referencedTable: $$DayOverridesTableReferences
                                    ._dayTypeIdTable(db),
                                referencedColumn: $$DayOverridesTableReferences
                                    ._dayTypeIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$DayOverridesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DayOverridesTable,
      DayOverride,
      $$DayOverridesTableFilterComposer,
      $$DayOverridesTableOrderingComposer,
      $$DayOverridesTableAnnotationComposer,
      $$DayOverridesTableCreateCompanionBuilder,
      $$DayOverridesTableUpdateCompanionBuilder,
      (DayOverride, $$DayOverridesTableReferences),
      DayOverride,
      PrefetchHooks Function({bool ownerUserId, bool dayTypeId})
    >;
typedef $$WorkoutSessionsTableCreateCompanionBuilder =
    WorkoutSessionsCompanion Function({
      required String id,
      required String ownerUserId,
      required String dayTypeId,
      required SessionStatus status,
      required int startedAt,
      Value<int?> endedAt,
      Value<int> durationSeconds,
      required int createdAt,
      required int updatedAt,
      Value<int> rowid,
    });
typedef $$WorkoutSessionsTableUpdateCompanionBuilder =
    WorkoutSessionsCompanion Function({
      Value<String> id,
      Value<String> ownerUserId,
      Value<String> dayTypeId,
      Value<SessionStatus> status,
      Value<int> startedAt,
      Value<int?> endedAt,
      Value<int> durationSeconds,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int> rowid,
    });

final class $$WorkoutSessionsTableReferences
    extends
        BaseReferences<_$AppDatabase, $WorkoutSessionsTable, WorkoutSession> {
  $$WorkoutSessionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UsersTable _ownerUserIdTable(_$AppDatabase db) =>
      db.users.createAlias('workout_sessions__owner_user_id__users__id');

  $$UsersTableProcessedTableManager get ownerUserId {
    final $_column = $_itemColumn<String>('owner_user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ownerUserIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DayTypesTable _dayTypeIdTable(_$AppDatabase db) =>
      db.dayTypes.createAlias('workout_sessions__day_type_id__day_types__id');

  $$DayTypesTableProcessedTableManager get dayTypeId {
    final $_column = $_itemColumn<String>('day_type_id')!;

    final manager = $$DayTypesTableTableManager(
      $_db,
      $_db.dayTypes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_dayTypeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $SessionExerciseLogsTable,
    List<SessionExerciseLog>
  >
  _sessionExerciseLogsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.sessionExerciseLogs,
        aliasName: 'workout_sessions__id__session_exercise_logs__session_id',
      );

  $$SessionExerciseLogsTableProcessedTableManager get sessionExerciseLogsRefs {
    final manager = $$SessionExerciseLogsTableTableManager(
      $_db,
      $_db.sessionExerciseLogs,
    ).filter((f) => f.sessionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _sessionExerciseLogsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$WorkoutSessionsTableFilterComposer
    extends Composer<_$AppDatabase, $WorkoutSessionsTable> {
  $$WorkoutSessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SessionStatus, SessionStatus, String>
  get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get endedAt => $composableBuilder(
    column: $table.endedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get ownerUserId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DayTypesTableFilterComposer get dayTypeId {
    final $$DayTypesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dayTypeId,
      referencedTable: $db.dayTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DayTypesTableFilterComposer(
            $db: $db,
            $table: $db.dayTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> sessionExerciseLogsRefs(
    Expression<bool> Function($$SessionExerciseLogsTableFilterComposer f) f,
  ) {
    final $$SessionExerciseLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.sessionExerciseLogs,
      getReferencedColumn: (t) => t.sessionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionExerciseLogsTableFilterComposer(
            $db: $db,
            $table: $db.sessionExerciseLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$WorkoutSessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkoutSessionsTable> {
  $$WorkoutSessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get endedAt => $composableBuilder(
    column: $table.endedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get ownerUserId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DayTypesTableOrderingComposer get dayTypeId {
    final $$DayTypesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dayTypeId,
      referencedTable: $db.dayTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DayTypesTableOrderingComposer(
            $db: $db,
            $table: $db.dayTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WorkoutSessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkoutSessionsTable> {
  $$WorkoutSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SessionStatus, String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<int> get endedAt =>
      $composableBuilder(column: $table.endedAt, builder: (column) => column);

  GeneratedColumn<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$UsersTableAnnotationComposer get ownerUserId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DayTypesTableAnnotationComposer get dayTypeId {
    final $$DayTypesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dayTypeId,
      referencedTable: $db.dayTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DayTypesTableAnnotationComposer(
            $db: $db,
            $table: $db.dayTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> sessionExerciseLogsRefs<T extends Object>(
    Expression<T> Function($$SessionExerciseLogsTableAnnotationComposer a) f,
  ) {
    final $$SessionExerciseLogsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.sessionExerciseLogs,
          getReferencedColumn: (t) => t.sessionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SessionExerciseLogsTableAnnotationComposer(
                $db: $db,
                $table: $db.sessionExerciseLogs,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$WorkoutSessionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WorkoutSessionsTable,
          WorkoutSession,
          $$WorkoutSessionsTableFilterComposer,
          $$WorkoutSessionsTableOrderingComposer,
          $$WorkoutSessionsTableAnnotationComposer,
          $$WorkoutSessionsTableCreateCompanionBuilder,
          $$WorkoutSessionsTableUpdateCompanionBuilder,
          (WorkoutSession, $$WorkoutSessionsTableReferences),
          WorkoutSession,
          PrefetchHooks Function({
            bool ownerUserId,
            bool dayTypeId,
            bool sessionExerciseLogsRefs,
          })
        > {
  $$WorkoutSessionsTableTableManager(
    _$AppDatabase db,
    $WorkoutSessionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkoutSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkoutSessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkoutSessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> ownerUserId = const Value.absent(),
                Value<String> dayTypeId = const Value.absent(),
                Value<SessionStatus> status = const Value.absent(),
                Value<int> startedAt = const Value.absent(),
                Value<int?> endedAt = const Value.absent(),
                Value<int> durationSeconds = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkoutSessionsCompanion(
                id: id,
                ownerUserId: ownerUserId,
                dayTypeId: dayTypeId,
                status: status,
                startedAt: startedAt,
                endedAt: endedAt,
                durationSeconds: durationSeconds,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String ownerUserId,
                required String dayTypeId,
                required SessionStatus status,
                required int startedAt,
                Value<int?> endedAt = const Value.absent(),
                Value<int> durationSeconds = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => WorkoutSessionsCompanion.insert(
                id: id,
                ownerUserId: ownerUserId,
                dayTypeId: dayTypeId,
                status: status,
                startedAt: startedAt,
                endedAt: endedAt,
                durationSeconds: durationSeconds,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$WorkoutSessionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                ownerUserId = false,
                dayTypeId = false,
                sessionExerciseLogsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (sessionExerciseLogsRefs) db.sessionExerciseLogs,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (ownerUserId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.ownerUserId,
                                    referencedTable:
                                        $$WorkoutSessionsTableReferences
                                            ._ownerUserIdTable(db),
                                    referencedColumn:
                                        $$WorkoutSessionsTableReferences
                                            ._ownerUserIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (dayTypeId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.dayTypeId,
                                    referencedTable:
                                        $$WorkoutSessionsTableReferences
                                            ._dayTypeIdTable(db),
                                    referencedColumn:
                                        $$WorkoutSessionsTableReferences
                                            ._dayTypeIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (sessionExerciseLogsRefs)
                        await $_getPrefetchedData<
                          WorkoutSession,
                          $WorkoutSessionsTable,
                          SessionExerciseLog
                        >(
                          currentTable: table,
                          referencedTable: $$WorkoutSessionsTableReferences
                              ._sessionExerciseLogsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$WorkoutSessionsTableReferences(
                                db,
                                table,
                                p0,
                              ).sessionExerciseLogsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.sessionId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$WorkoutSessionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WorkoutSessionsTable,
      WorkoutSession,
      $$WorkoutSessionsTableFilterComposer,
      $$WorkoutSessionsTableOrderingComposer,
      $$WorkoutSessionsTableAnnotationComposer,
      $$WorkoutSessionsTableCreateCompanionBuilder,
      $$WorkoutSessionsTableUpdateCompanionBuilder,
      (WorkoutSession, $$WorkoutSessionsTableReferences),
      WorkoutSession,
      PrefetchHooks Function({
        bool ownerUserId,
        bool dayTypeId,
        bool sessionExerciseLogsRefs,
      })
    >;
typedef $$SessionExerciseLogsTableCreateCompanionBuilder =
    SessionExerciseLogsCompanion Function({
      required String id,
      required String ownerUserId,
      required String sessionId,
      Value<String?> plannedExerciseId,
      required String performedExerciseId,
      required int position,
      Value<String?> notes,
      required int createdAt,
      required int updatedAt,
      Value<int> rowid,
    });
typedef $$SessionExerciseLogsTableUpdateCompanionBuilder =
    SessionExerciseLogsCompanion Function({
      Value<String> id,
      Value<String> ownerUserId,
      Value<String> sessionId,
      Value<String?> plannedExerciseId,
      Value<String> performedExerciseId,
      Value<int> position,
      Value<String?> notes,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int> rowid,
    });

final class $$SessionExerciseLogsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $SessionExerciseLogsTable,
          SessionExerciseLog
        > {
  $$SessionExerciseLogsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UsersTable _ownerUserIdTable(_$AppDatabase db) =>
      db.users.createAlias('session_exercise_logs__owner_user_id__users__id');

  $$UsersTableProcessedTableManager get ownerUserId {
    final $_column = $_itemColumn<String>('owner_user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ownerUserIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $WorkoutSessionsTable _sessionIdTable(_$AppDatabase db) => db
      .workoutSessions
      .createAlias('session_exercise_logs__session_id__workout_sessions__id');

  $$WorkoutSessionsTableProcessedTableManager get sessionId {
    final $_column = $_itemColumn<String>('session_id')!;

    final manager = $$WorkoutSessionsTableTableManager(
      $_db,
      $_db.workoutSessions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sessionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ExercisesTable _plannedExerciseIdTable(_$AppDatabase db) => db
      .exercises
      .createAlias('session_exercise_logs__planned_exercise_id__exercises__id');

  $$ExercisesTableProcessedTableManager? get plannedExerciseId {
    final $_column = $_itemColumn<String>('planned_exercise_id');
    if ($_column == null) return null;
    final manager = $$ExercisesTableTableManager(
      $_db,
      $_db.exercises,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_plannedExerciseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ExercisesTable _performedExerciseIdTable(_$AppDatabase db) =>
      db.exercises.createAlias(
        'session_exercise_logs__performed_exercise_id__exercises__id',
      );

  $$ExercisesTableProcessedTableManager get performedExerciseId {
    final $_column = $_itemColumn<String>('performed_exercise_id')!;

    final manager = $$ExercisesTableTableManager(
      $_db,
      $_db.exercises,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_performedExerciseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$SetLogsTable, List<SetLog>> _setLogsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.setLogs,
    aliasName: 'session_exercise_logs__id__set_logs__session_exercise_log_id',
  );

  $$SetLogsTableProcessedTableManager get setLogsRefs {
    final manager = $$SetLogsTableTableManager($_db, $_db.setLogs).filter(
      (f) => f.sessionExerciseLogId.id.sqlEquals($_itemColumn<String>('id')!),
    );

    final cache = $_typedResult.readTableOrNull(_setLogsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SessionExerciseLogsTableFilterComposer
    extends Composer<_$AppDatabase, $SessionExerciseLogsTable> {
  $$SessionExerciseLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get ownerUserId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$WorkoutSessionsTableFilterComposer get sessionId {
    final $$WorkoutSessionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.workoutSessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutSessionsTableFilterComposer(
            $db: $db,
            $table: $db.workoutSessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ExercisesTableFilterComposer get plannedExerciseId {
    final $$ExercisesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.plannedExerciseId,
      referencedTable: $db.exercises,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisesTableFilterComposer(
            $db: $db,
            $table: $db.exercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ExercisesTableFilterComposer get performedExerciseId {
    final $$ExercisesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.performedExerciseId,
      referencedTable: $db.exercises,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisesTableFilterComposer(
            $db: $db,
            $table: $db.exercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> setLogsRefs(
    Expression<bool> Function($$SetLogsTableFilterComposer f) f,
  ) {
    final $$SetLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.setLogs,
      getReferencedColumn: (t) => t.sessionExerciseLogId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SetLogsTableFilterComposer(
            $db: $db,
            $table: $db.setLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SessionExerciseLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $SessionExerciseLogsTable> {
  $$SessionExerciseLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get ownerUserId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$WorkoutSessionsTableOrderingComposer get sessionId {
    final $$WorkoutSessionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.workoutSessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutSessionsTableOrderingComposer(
            $db: $db,
            $table: $db.workoutSessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ExercisesTableOrderingComposer get plannedExerciseId {
    final $$ExercisesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.plannedExerciseId,
      referencedTable: $db.exercises,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisesTableOrderingComposer(
            $db: $db,
            $table: $db.exercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ExercisesTableOrderingComposer get performedExerciseId {
    final $$ExercisesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.performedExerciseId,
      referencedTable: $db.exercises,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisesTableOrderingComposer(
            $db: $db,
            $table: $db.exercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SessionExerciseLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SessionExerciseLogsTable> {
  $$SessionExerciseLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get position =>
      $composableBuilder(column: $table.position, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$UsersTableAnnotationComposer get ownerUserId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$WorkoutSessionsTableAnnotationComposer get sessionId {
    final $$WorkoutSessionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.workoutSessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutSessionsTableAnnotationComposer(
            $db: $db,
            $table: $db.workoutSessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ExercisesTableAnnotationComposer get plannedExerciseId {
    final $$ExercisesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.plannedExerciseId,
      referencedTable: $db.exercises,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisesTableAnnotationComposer(
            $db: $db,
            $table: $db.exercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ExercisesTableAnnotationComposer get performedExerciseId {
    final $$ExercisesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.performedExerciseId,
      referencedTable: $db.exercises,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisesTableAnnotationComposer(
            $db: $db,
            $table: $db.exercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> setLogsRefs<T extends Object>(
    Expression<T> Function($$SetLogsTableAnnotationComposer a) f,
  ) {
    final $$SetLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.setLogs,
      getReferencedColumn: (t) => t.sessionExerciseLogId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SetLogsTableAnnotationComposer(
            $db: $db,
            $table: $db.setLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SessionExerciseLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SessionExerciseLogsTable,
          SessionExerciseLog,
          $$SessionExerciseLogsTableFilterComposer,
          $$SessionExerciseLogsTableOrderingComposer,
          $$SessionExerciseLogsTableAnnotationComposer,
          $$SessionExerciseLogsTableCreateCompanionBuilder,
          $$SessionExerciseLogsTableUpdateCompanionBuilder,
          (SessionExerciseLog, $$SessionExerciseLogsTableReferences),
          SessionExerciseLog,
          PrefetchHooks Function({
            bool ownerUserId,
            bool sessionId,
            bool plannedExerciseId,
            bool performedExerciseId,
            bool setLogsRefs,
          })
        > {
  $$SessionExerciseLogsTableTableManager(
    _$AppDatabase db,
    $SessionExerciseLogsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SessionExerciseLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SessionExerciseLogsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$SessionExerciseLogsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> ownerUserId = const Value.absent(),
                Value<String> sessionId = const Value.absent(),
                Value<String?> plannedExerciseId = const Value.absent(),
                Value<String> performedExerciseId = const Value.absent(),
                Value<int> position = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SessionExerciseLogsCompanion(
                id: id,
                ownerUserId: ownerUserId,
                sessionId: sessionId,
                plannedExerciseId: plannedExerciseId,
                performedExerciseId: performedExerciseId,
                position: position,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String ownerUserId,
                required String sessionId,
                Value<String?> plannedExerciseId = const Value.absent(),
                required String performedExerciseId,
                required int position,
                Value<String?> notes = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => SessionExerciseLogsCompanion.insert(
                id: id,
                ownerUserId: ownerUserId,
                sessionId: sessionId,
                plannedExerciseId: plannedExerciseId,
                performedExerciseId: performedExerciseId,
                position: position,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SessionExerciseLogsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                ownerUserId = false,
                sessionId = false,
                plannedExerciseId = false,
                performedExerciseId = false,
                setLogsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [if (setLogsRefs) db.setLogs],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (ownerUserId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.ownerUserId,
                                    referencedTable:
                                        $$SessionExerciseLogsTableReferences
                                            ._ownerUserIdTable(db),
                                    referencedColumn:
                                        $$SessionExerciseLogsTableReferences
                                            ._ownerUserIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (sessionId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.sessionId,
                                    referencedTable:
                                        $$SessionExerciseLogsTableReferences
                                            ._sessionIdTable(db),
                                    referencedColumn:
                                        $$SessionExerciseLogsTableReferences
                                            ._sessionIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (plannedExerciseId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.plannedExerciseId,
                                    referencedTable:
                                        $$SessionExerciseLogsTableReferences
                                            ._plannedExerciseIdTable(db),
                                    referencedColumn:
                                        $$SessionExerciseLogsTableReferences
                                            ._plannedExerciseIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (performedExerciseId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.performedExerciseId,
                                    referencedTable:
                                        $$SessionExerciseLogsTableReferences
                                            ._performedExerciseIdTable(db),
                                    referencedColumn:
                                        $$SessionExerciseLogsTableReferences
                                            ._performedExerciseIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (setLogsRefs)
                        await $_getPrefetchedData<
                          SessionExerciseLog,
                          $SessionExerciseLogsTable,
                          SetLog
                        >(
                          currentTable: table,
                          referencedTable: $$SessionExerciseLogsTableReferences
                              ._setLogsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SessionExerciseLogsTableReferences(
                                db,
                                table,
                                p0,
                              ).setLogsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.sessionExerciseLogId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$SessionExerciseLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SessionExerciseLogsTable,
      SessionExerciseLog,
      $$SessionExerciseLogsTableFilterComposer,
      $$SessionExerciseLogsTableOrderingComposer,
      $$SessionExerciseLogsTableAnnotationComposer,
      $$SessionExerciseLogsTableCreateCompanionBuilder,
      $$SessionExerciseLogsTableUpdateCompanionBuilder,
      (SessionExerciseLog, $$SessionExerciseLogsTableReferences),
      SessionExerciseLog,
      PrefetchHooks Function({
        bool ownerUserId,
        bool sessionId,
        bool plannedExerciseId,
        bool performedExerciseId,
        bool setLogsRefs,
      })
    >;
typedef $$SetLogsTableCreateCompanionBuilder =
    SetLogsCompanion Function({
      required String id,
      required String ownerUserId,
      required String sessionExerciseLogId,
      required int setNumber,
      required int reps,
      Value<double?> weight,
      Value<SetType?> setType,
      Value<int?> rpe,
      required int completedAt,
      required int createdAt,
      required int updatedAt,
      Value<int> rowid,
    });
typedef $$SetLogsTableUpdateCompanionBuilder =
    SetLogsCompanion Function({
      Value<String> id,
      Value<String> ownerUserId,
      Value<String> sessionExerciseLogId,
      Value<int> setNumber,
      Value<int> reps,
      Value<double?> weight,
      Value<SetType?> setType,
      Value<int?> rpe,
      Value<int> completedAt,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int> rowid,
    });

final class $$SetLogsTableReferences
    extends BaseReferences<_$AppDatabase, $SetLogsTable, SetLog> {
  $$SetLogsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _ownerUserIdTable(_$AppDatabase db) =>
      db.users.createAlias('set_logs__owner_user_id__users__id');

  $$UsersTableProcessedTableManager get ownerUserId {
    final $_column = $_itemColumn<String>('owner_user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ownerUserIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $SessionExerciseLogsTable _sessionExerciseLogIdTable(
    _$AppDatabase db,
  ) => db.sessionExerciseLogs.createAlias(
    'set_logs__session_exercise_log_id__session_exercise_logs__id',
  );

  $$SessionExerciseLogsTableProcessedTableManager get sessionExerciseLogId {
    final $_column = $_itemColumn<String>('session_exercise_log_id')!;

    final manager = $$SessionExerciseLogsTableTableManager(
      $_db,
      $_db.sessionExerciseLogs,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(
      _sessionExerciseLogIdTable($_db),
    );
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SetLogsTableFilterComposer
    extends Composer<_$AppDatabase, $SetLogsTable> {
  $$SetLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get setNumber => $composableBuilder(
    column: $table.setNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reps => $composableBuilder(
    column: $table.reps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SetType?, SetType, String> get setType =>
      $composableBuilder(
        column: $table.setType,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<int> get rpe => $composableBuilder(
    column: $table.rpe,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get ownerUserId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SessionExerciseLogsTableFilterComposer get sessionExerciseLogId {
    final $$SessionExerciseLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionExerciseLogId,
      referencedTable: $db.sessionExerciseLogs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionExerciseLogsTableFilterComposer(
            $db: $db,
            $table: $db.sessionExerciseLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SetLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $SetLogsTable> {
  $$SetLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get setNumber => $composableBuilder(
    column: $table.setNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reps => $composableBuilder(
    column: $table.reps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get setType => $composableBuilder(
    column: $table.setType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rpe => $composableBuilder(
    column: $table.rpe,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get ownerUserId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SessionExerciseLogsTableOrderingComposer get sessionExerciseLogId {
    final $$SessionExerciseLogsTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.sessionExerciseLogId,
          referencedTable: $db.sessionExerciseLogs,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SessionExerciseLogsTableOrderingComposer(
                $db: $db,
                $table: $db.sessionExerciseLogs,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$SetLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SetLogsTable> {
  $$SetLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get setNumber =>
      $composableBuilder(column: $table.setNumber, builder: (column) => column);

  GeneratedColumn<int> get reps =>
      $composableBuilder(column: $table.reps, builder: (column) => column);

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SetType?, String> get setType =>
      $composableBuilder(column: $table.setType, builder: (column) => column);

  GeneratedColumn<int> get rpe =>
      $composableBuilder(column: $table.rpe, builder: (column) => column);

  GeneratedColumn<int> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$UsersTableAnnotationComposer get ownerUserId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SessionExerciseLogsTableAnnotationComposer get sessionExerciseLogId {
    final $$SessionExerciseLogsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.sessionExerciseLogId,
          referencedTable: $db.sessionExerciseLogs,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SessionExerciseLogsTableAnnotationComposer(
                $db: $db,
                $table: $db.sessionExerciseLogs,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$SetLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SetLogsTable,
          SetLog,
          $$SetLogsTableFilterComposer,
          $$SetLogsTableOrderingComposer,
          $$SetLogsTableAnnotationComposer,
          $$SetLogsTableCreateCompanionBuilder,
          $$SetLogsTableUpdateCompanionBuilder,
          (SetLog, $$SetLogsTableReferences),
          SetLog,
          PrefetchHooks Function({bool ownerUserId, bool sessionExerciseLogId})
        > {
  $$SetLogsTableTableManager(_$AppDatabase db, $SetLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SetLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SetLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SetLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> ownerUserId = const Value.absent(),
                Value<String> sessionExerciseLogId = const Value.absent(),
                Value<int> setNumber = const Value.absent(),
                Value<int> reps = const Value.absent(),
                Value<double?> weight = const Value.absent(),
                Value<SetType?> setType = const Value.absent(),
                Value<int?> rpe = const Value.absent(),
                Value<int> completedAt = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SetLogsCompanion(
                id: id,
                ownerUserId: ownerUserId,
                sessionExerciseLogId: sessionExerciseLogId,
                setNumber: setNumber,
                reps: reps,
                weight: weight,
                setType: setType,
                rpe: rpe,
                completedAt: completedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String ownerUserId,
                required String sessionExerciseLogId,
                required int setNumber,
                required int reps,
                Value<double?> weight = const Value.absent(),
                Value<SetType?> setType = const Value.absent(),
                Value<int?> rpe = const Value.absent(),
                required int completedAt,
                required int createdAt,
                required int updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => SetLogsCompanion.insert(
                id: id,
                ownerUserId: ownerUserId,
                sessionExerciseLogId: sessionExerciseLogId,
                setNumber: setNumber,
                reps: reps,
                weight: weight,
                setType: setType,
                rpe: rpe,
                completedAt: completedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SetLogsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({ownerUserId = false, sessionExerciseLogId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (ownerUserId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.ownerUserId,
                                    referencedTable: $$SetLogsTableReferences
                                        ._ownerUserIdTable(db),
                                    referencedColumn: $$SetLogsTableReferences
                                        ._ownerUserIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (sessionExerciseLogId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.sessionExerciseLogId,
                                    referencedTable: $$SetLogsTableReferences
                                        ._sessionExerciseLogIdTable(db),
                                    referencedColumn: $$SetLogsTableReferences
                                        ._sessionExerciseLogIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$SetLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SetLogsTable,
      SetLog,
      $$SetLogsTableFilterComposer,
      $$SetLogsTableOrderingComposer,
      $$SetLogsTableAnnotationComposer,
      $$SetLogsTableCreateCompanionBuilder,
      $$SetLogsTableUpdateCompanionBuilder,
      (SetLog, $$SetLogsTableReferences),
      SetLog,
      PrefetchHooks Function({bool ownerUserId, bool sessionExerciseLogId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$ExercisesTableTableManager get exercises =>
      $$ExercisesTableTableManager(_db, _db.exercises);
  $$ExerciseSubstitutesTableTableManager get exerciseSubstitutes =>
      $$ExerciseSubstitutesTableTableManager(_db, _db.exerciseSubstitutes);
  $$DayTypesTableTableManager get dayTypes =>
      $$DayTypesTableTableManager(_db, _db.dayTypes);
  $$DayTypeExercisesTableTableManager get dayTypeExercises =>
      $$DayTypeExercisesTableTableManager(_db, _db.dayTypeExercises);
  $$RoutinePatternsTableTableManager get routinePatterns =>
      $$RoutinePatternsTableTableManager(_db, _db.routinePatterns);
  $$WeeklyPatternSlotsTableTableManager get weeklyPatternSlots =>
      $$WeeklyPatternSlotsTableTableManager(_db, _db.weeklyPatternSlots);
  $$CyclicPatternSlotsTableTableManager get cyclicPatternSlots =>
      $$CyclicPatternSlotsTableTableManager(_db, _db.cyclicPatternSlots);
  $$DayOverridesTableTableManager get dayOverrides =>
      $$DayOverridesTableTableManager(_db, _db.dayOverrides);
  $$WorkoutSessionsTableTableManager get workoutSessions =>
      $$WorkoutSessionsTableTableManager(_db, _db.workoutSessions);
  $$SessionExerciseLogsTableTableManager get sessionExerciseLogs =>
      $$SessionExerciseLogsTableTableManager(_db, _db.sessionExerciseLogs);
  $$SetLogsTableTableManager get setLogs =>
      $$SetLogsTableTableManager(_db, _db.setLogs);
}
