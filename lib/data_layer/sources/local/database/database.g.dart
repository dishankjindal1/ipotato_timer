// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class Task extends DataClass implements Insertable<Task> {
  final String uuid;
  final String title;
  final String? description;
  final int exitTimeStamp;
  final int? pausedTimeStamp;
  final int? createdAt;
  const Task(
      {required this.uuid,
      required this.title,
      this.description,
      required this.exitTimeStamp,
      this.pausedTimeStamp,
      this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['exit_time_stamp'] = Variable<int>(exitTimeStamp);
    if (!nullToAbsent || pausedTimeStamp != null) {
      map['paused_time_stamp'] = Variable<int>(pausedTimeStamp);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<int>(createdAt);
    }
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      uuid: Value(uuid),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      exitTimeStamp: Value(exitTimeStamp),
      pausedTimeStamp: pausedTimeStamp == null && nullToAbsent
          ? const Value.absent()
          : Value(pausedTimeStamp),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory Task.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Task(
      uuid: serializer.fromJson<String>(json['uuid']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      exitTimeStamp: serializer.fromJson<int>(json['exitTimeStamp']),
      pausedTimeStamp: serializer.fromJson<int?>(json['pausedTimeStamp']),
      createdAt: serializer.fromJson<int?>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'exitTimeStamp': serializer.toJson<int>(exitTimeStamp),
      'pausedTimeStamp': serializer.toJson<int?>(pausedTimeStamp),
      'createdAt': serializer.toJson<int?>(createdAt),
    };
  }

  Task copyWith(
          {String? uuid,
          String? title,
          Value<String?> description = const Value.absent(),
          int? exitTimeStamp,
          Value<int?> pausedTimeStamp = const Value.absent(),
          Value<int?> createdAt = const Value.absent()}) =>
      Task(
        uuid: uuid ?? this.uuid,
        title: title ?? this.title,
        description: description.present ? description.value : this.description,
        exitTimeStamp: exitTimeStamp ?? this.exitTimeStamp,
        pausedTimeStamp: pausedTimeStamp.present
            ? pausedTimeStamp.value
            : this.pausedTimeStamp,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('uuid: $uuid, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('exitTimeStamp: $exitTimeStamp, ')
          ..write('pausedTimeStamp: $pausedTimeStamp, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      uuid, title, description, exitTimeStamp, pausedTimeStamp, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Task &&
          other.uuid == this.uuid &&
          other.title == this.title &&
          other.description == this.description &&
          other.exitTimeStamp == this.exitTimeStamp &&
          other.pausedTimeStamp == this.pausedTimeStamp &&
          other.createdAt == this.createdAt);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<String> uuid;
  final Value<String> title;
  final Value<String?> description;
  final Value<int> exitTimeStamp;
  final Value<int?> pausedTimeStamp;
  final Value<int?> createdAt;
  const TasksCompanion({
    this.uuid = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.exitTimeStamp = const Value.absent(),
    this.pausedTimeStamp = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  TasksCompanion.insert({
    required String uuid,
    required String title,
    this.description = const Value.absent(),
    required int exitTimeStamp,
    this.pausedTimeStamp = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : uuid = Value(uuid),
        title = Value(title),
        exitTimeStamp = Value(exitTimeStamp);
  static Insertable<Task> custom({
    Expression<String>? uuid,
    Expression<String>? title,
    Expression<String>? description,
    Expression<int>? exitTimeStamp,
    Expression<int>? pausedTimeStamp,
    Expression<int>? createdAt,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (exitTimeStamp != null) 'exit_time_stamp': exitTimeStamp,
      if (pausedTimeStamp != null) 'paused_time_stamp': pausedTimeStamp,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  TasksCompanion copyWith(
      {Value<String>? uuid,
      Value<String>? title,
      Value<String?>? description,
      Value<int>? exitTimeStamp,
      Value<int?>? pausedTimeStamp,
      Value<int?>? createdAt}) {
    return TasksCompanion(
      uuid: uuid ?? this.uuid,
      title: title ?? this.title,
      description: description ?? this.description,
      exitTimeStamp: exitTimeStamp ?? this.exitTimeStamp,
      pausedTimeStamp: pausedTimeStamp ?? this.pausedTimeStamp,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (exitTimeStamp.present) {
      map['exit_time_stamp'] = Variable<int>(exitTimeStamp.value);
    }
    if (pausedTimeStamp.present) {
      map['paused_time_stamp'] = Variable<int>(pausedTimeStamp.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('uuid: $uuid, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('exitTimeStamp: $exitTimeStamp, ')
          ..write('pausedTimeStamp: $pausedTimeStamp, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $TasksTable extends Tasks with TableInfo<$TasksTable, Task> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _exitTimeStampMeta =
      const VerificationMeta('exitTimeStamp');
  @override
  late final GeneratedColumn<int> exitTimeStamp = GeneratedColumn<int>(
      'exit_time_stamp', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _pausedTimeStampMeta =
      const VerificationMeta('pausedTimeStamp');
  @override
  late final GeneratedColumn<int> pausedTimeStamp = GeneratedColumn<int>(
      'paused_time_stamp', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
      'created_at', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now().millisecondsSinceEpoch));
  @override
  List<GeneratedColumn> get $columns =>
      [uuid, title, description, exitTimeStamp, pausedTimeStamp, createdAt];
  @override
  String get aliasedName => _alias ?? 'tasks';
  @override
  String get actualTableName => 'tasks';
  @override
  VerificationContext validateIntegrity(Insertable<Task> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('exit_time_stamp')) {
      context.handle(
          _exitTimeStampMeta,
          exitTimeStamp.isAcceptableOrUnknown(
              data['exit_time_stamp']!, _exitTimeStampMeta));
    } else if (isInserting) {
      context.missing(_exitTimeStampMeta);
    }
    if (data.containsKey('paused_time_stamp')) {
      context.handle(
          _pausedTimeStampMeta,
          pausedTimeStamp.isAcceptableOrUnknown(
              data['paused_time_stamp']!, _pausedTimeStampMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Task map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Task(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      exitTimeStamp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}exit_time_stamp'])!,
      pausedTimeStamp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}paused_time_stamp']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_at']),
    );
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $TasksTable tasks = $TasksTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [tasks];
}
