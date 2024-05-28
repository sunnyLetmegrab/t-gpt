// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $ChatRoomTable extends ChatRoom
    with TableInfo<$ChatRoomTable, ChatRoomData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChatRoomTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  @override
  List<GeneratedColumn> get $columns => [createdAt, id];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'chat_room';
  @override
  VerificationContext validateIntegrity(Insertable<ChatRoomData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChatRoomData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChatRoomData(
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
    );
  }

  @override
  $ChatRoomTable createAlias(String alias) {
    return $ChatRoomTable(attachedDatabase, alias);
  }
}

class ChatRoomData extends DataClass implements Insertable<ChatRoomData> {
  final DateTime createdAt;
  final int id;
  const ChatRoomData({required this.createdAt, required this.id});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    map['id'] = Variable<int>(id);
    return map;
  }

  ChatRoomCompanion toCompanion(bool nullToAbsent) {
    return ChatRoomCompanion(
      createdAt: Value(createdAt),
      id: Value(id),
    );
  }

  factory ChatRoomData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChatRoomData(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      id: serializer.fromJson<int>(json['id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'id': serializer.toJson<int>(id),
    };
  }

  ChatRoomData copyWith({DateTime? createdAt, int? id}) => ChatRoomData(
        createdAt: createdAt ?? this.createdAt,
        id: id ?? this.id,
      );
  @override
  String toString() {
    return (StringBuffer('ChatRoomData(')
          ..write('createdAt: $createdAt, ')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(createdAt, id);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChatRoomData &&
          other.createdAt == this.createdAt &&
          other.id == this.id);
}

class ChatRoomCompanion extends UpdateCompanion<ChatRoomData> {
  final Value<DateTime> createdAt;
  final Value<int> id;
  const ChatRoomCompanion({
    this.createdAt = const Value.absent(),
    this.id = const Value.absent(),
  });
  ChatRoomCompanion.insert({
    this.createdAt = const Value.absent(),
    this.id = const Value.absent(),
  });
  static Insertable<ChatRoomData> custom({
    Expression<DateTime>? createdAt,
    Expression<int>? id,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (id != null) 'id': id,
    });
  }

  ChatRoomCompanion copyWith({Value<DateTime>? createdAt, Value<int>? id}) {
    return ChatRoomCompanion(
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChatRoomCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }
}

class $ChatHistoryTable extends ChatHistory
    with TableInfo<$ChatHistoryTable, ChatHistoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChatHistoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userTypeMeta =
      const VerificationMeta('userType');
  @override
  late final GeneratedColumn<String> userType = GeneratedColumn<String>(
      'user_type', aliasedName, false,
      check: () => userType.isIn(["user", "model"]),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _messageMeta =
      const VerificationMeta('message');
  @override
  late final GeneratedColumn<String> message = GeneratedColumn<String>(
      'message', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _chatRoomIdMeta =
      const VerificationMeta('chatRoomId');
  @override
  late final GeneratedColumn<int> chatRoomId = GeneratedColumn<int>(
      'chat_room_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES chat_room (id)'));
  static const VerificationMeta _createdTimeMeta =
      const VerificationMeta('createdTime');
  @override
  late final GeneratedColumn<DateTime> createdTime = GeneratedColumn<DateTime>(
      'created_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, userType, message, chatRoomId, createdTime];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'chat_history';
  @override
  VerificationContext validateIntegrity(Insertable<ChatHistoryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_type')) {
      context.handle(_userTypeMeta,
          userType.isAcceptableOrUnknown(data['user_type']!, _userTypeMeta));
    } else if (isInserting) {
      context.missing(_userTypeMeta);
    }
    if (data.containsKey('message')) {
      context.handle(_messageMeta,
          message.isAcceptableOrUnknown(data['message']!, _messageMeta));
    } else if (isInserting) {
      context.missing(_messageMeta);
    }
    if (data.containsKey('chat_room_id')) {
      context.handle(
          _chatRoomIdMeta,
          chatRoomId.isAcceptableOrUnknown(
              data['chat_room_id']!, _chatRoomIdMeta));
    } else if (isInserting) {
      context.missing(_chatRoomIdMeta);
    }
    if (data.containsKey('created_time')) {
      context.handle(
          _createdTimeMeta,
          createdTime.isAcceptableOrUnknown(
              data['created_time']!, _createdTimeMeta));
    } else if (isInserting) {
      context.missing(_createdTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChatHistoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChatHistoryData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_type'])!,
      message: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}message'])!,
      chatRoomId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}chat_room_id'])!,
      createdTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_time'])!,
    );
  }

  @override
  $ChatHistoryTable createAlias(String alias) {
    return $ChatHistoryTable(attachedDatabase, alias);
  }
}

class ChatHistoryData extends DataClass implements Insertable<ChatHistoryData> {
  final int id;
  final String userType;
  final String message;
  final int chatRoomId;
  final DateTime createdTime;
  const ChatHistoryData(
      {required this.id,
      required this.userType,
      required this.message,
      required this.chatRoomId,
      required this.createdTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_type'] = Variable<String>(userType);
    map['message'] = Variable<String>(message);
    map['chat_room_id'] = Variable<int>(chatRoomId);
    map['created_time'] = Variable<DateTime>(createdTime);
    return map;
  }

  ChatHistoryCompanion toCompanion(bool nullToAbsent) {
    return ChatHistoryCompanion(
      id: Value(id),
      userType: Value(userType),
      message: Value(message),
      chatRoomId: Value(chatRoomId),
      createdTime: Value(createdTime),
    );
  }

  factory ChatHistoryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChatHistoryData(
      id: serializer.fromJson<int>(json['id']),
      userType: serializer.fromJson<String>(json['userType']),
      message: serializer.fromJson<String>(json['message']),
      chatRoomId: serializer.fromJson<int>(json['chatRoomId']),
      createdTime: serializer.fromJson<DateTime>(json['createdTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userType': serializer.toJson<String>(userType),
      'message': serializer.toJson<String>(message),
      'chatRoomId': serializer.toJson<int>(chatRoomId),
      'createdTime': serializer.toJson<DateTime>(createdTime),
    };
  }

  ChatHistoryData copyWith(
          {int? id,
          String? userType,
          String? message,
          int? chatRoomId,
          DateTime? createdTime}) =>
      ChatHistoryData(
        id: id ?? this.id,
        userType: userType ?? this.userType,
        message: message ?? this.message,
        chatRoomId: chatRoomId ?? this.chatRoomId,
        createdTime: createdTime ?? this.createdTime,
      );
  @override
  String toString() {
    return (StringBuffer('ChatHistoryData(')
          ..write('id: $id, ')
          ..write('userType: $userType, ')
          ..write('message: $message, ')
          ..write('chatRoomId: $chatRoomId, ')
          ..write('createdTime: $createdTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userType, message, chatRoomId, createdTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChatHistoryData &&
          other.id == this.id &&
          other.userType == this.userType &&
          other.message == this.message &&
          other.chatRoomId == this.chatRoomId &&
          other.createdTime == this.createdTime);
}

class ChatHistoryCompanion extends UpdateCompanion<ChatHistoryData> {
  final Value<int> id;
  final Value<String> userType;
  final Value<String> message;
  final Value<int> chatRoomId;
  final Value<DateTime> createdTime;
  const ChatHistoryCompanion({
    this.id = const Value.absent(),
    this.userType = const Value.absent(),
    this.message = const Value.absent(),
    this.chatRoomId = const Value.absent(),
    this.createdTime = const Value.absent(),
  });
  ChatHistoryCompanion.insert({
    this.id = const Value.absent(),
    required String userType,
    required String message,
    required int chatRoomId,
    required DateTime createdTime,
  })  : userType = Value(userType),
        message = Value(message),
        chatRoomId = Value(chatRoomId),
        createdTime = Value(createdTime);
  static Insertable<ChatHistoryData> custom({
    Expression<int>? id,
    Expression<String>? userType,
    Expression<String>? message,
    Expression<int>? chatRoomId,
    Expression<DateTime>? createdTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userType != null) 'user_type': userType,
      if (message != null) 'message': message,
      if (chatRoomId != null) 'chat_room_id': chatRoomId,
      if (createdTime != null) 'created_time': createdTime,
    });
  }

  ChatHistoryCompanion copyWith(
      {Value<int>? id,
      Value<String>? userType,
      Value<String>? message,
      Value<int>? chatRoomId,
      Value<DateTime>? createdTime}) {
    return ChatHistoryCompanion(
      id: id ?? this.id,
      userType: userType ?? this.userType,
      message: message ?? this.message,
      chatRoomId: chatRoomId ?? this.chatRoomId,
      createdTime: createdTime ?? this.createdTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userType.present) {
      map['user_type'] = Variable<String>(userType.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (chatRoomId.present) {
      map['chat_room_id'] = Variable<int>(chatRoomId.value);
    }
    if (createdTime.present) {
      map['created_time'] = Variable<DateTime>(createdTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChatHistoryCompanion(')
          ..write('id: $id, ')
          ..write('userType: $userType, ')
          ..write('message: $message, ')
          ..write('chatRoomId: $chatRoomId, ')
          ..write('createdTime: $createdTime')
          ..write(')'))
        .toString();
  }
}

class ChatHistoryViewData extends DataClass {
  final int id;
  final DateTime createdAt;
  const ChatHistoryViewData({required this.id, required this.createdAt});
  factory ChatHistoryViewData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChatHistoryViewData(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ChatHistoryViewData copyWith({int? id, DateTime? createdAt}) =>
      ChatHistoryViewData(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('ChatHistoryViewData(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChatHistoryViewData &&
          other.id == this.id &&
          other.createdAt == this.createdAt);
}

class $ChatHistoryViewView
    extends ViewInfo<$ChatHistoryViewView, ChatHistoryViewData>
    implements HasResultSet {
  final String? _alias;
  @override
  final _$AppDatabase attachedDatabase;
  $ChatHistoryViewView(this.attachedDatabase, [this._alias]);
  $ChatHistoryTable get chatHistoryData =>
      attachedDatabase.chatHistory.createAlias('t0');
  $ChatRoomTable get chatRoom => attachedDatabase.chatRoom.createAlias('t1');
  @override
  List<GeneratedColumn> get $columns => [id, createdAt];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'chat_history_view';
  @override
  Map<SqlDialect, String>? get createViewStatements => null;
  @override
  $ChatHistoryViewView get asDslTable => this;
  @override
  ChatHistoryViewData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChatHistoryViewData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      generatedAs: GeneratedAs(chatRoom.id, false), type: DriftSqlType.int);
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      generatedAs: GeneratedAs(chatRoom.createdAt, false),
      type: DriftSqlType.dateTime);
  @override
  $ChatHistoryViewView createAlias(String alias) {
    return $ChatHistoryViewView(attachedDatabase, alias);
  }

  @override
  Query? get query =>
      (attachedDatabase.selectOnly(chatRoom)..addColumns($columns)).join([
        leftOuterJoin(
            chatHistoryData, chatHistoryData.chatRoomId.equalsExp(chatRoom.id))
      ]);
  @override
  Set<String> get readTables => const {'chat_history', 'chat_room'};
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $ChatRoomTable chatRoom = $ChatRoomTable(this);
  late final $ChatHistoryTable chatHistory = $ChatHistoryTable(this);
  late final $ChatHistoryViewView chatHistoryView = $ChatHistoryViewView(this);
  late final ChatHistoryDao chatHistoryDao =
      ChatHistoryDao(this as AppDatabase);
  late final ChatRoomDao chatRoomDao = ChatRoomDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [chatRoom, chatHistory, chatHistoryView];
}

typedef $$ChatRoomTableInsertCompanionBuilder = ChatRoomCompanion Function({
  Value<DateTime> createdAt,
  Value<int> id,
});
typedef $$ChatRoomTableUpdateCompanionBuilder = ChatRoomCompanion Function({
  Value<DateTime> createdAt,
  Value<int> id,
});

class $$ChatRoomTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ChatRoomTable,
    ChatRoomData,
    $$ChatRoomTableFilterComposer,
    $$ChatRoomTableOrderingComposer,
    $$ChatRoomTableProcessedTableManager,
    $$ChatRoomTableInsertCompanionBuilder,
    $$ChatRoomTableUpdateCompanionBuilder> {
  $$ChatRoomTableTableManager(_$AppDatabase db, $ChatRoomTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ChatRoomTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ChatRoomTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$ChatRoomTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> id = const Value.absent(),
          }) =>
              ChatRoomCompanion(
            createdAt: createdAt,
            id: id,
          ),
          getInsertCompanionBuilder: ({
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> id = const Value.absent(),
          }) =>
              ChatRoomCompanion.insert(
            createdAt: createdAt,
            id: id,
          ),
        ));
}

class $$ChatRoomTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $ChatRoomTable,
    ChatRoomData,
    $$ChatRoomTableFilterComposer,
    $$ChatRoomTableOrderingComposer,
    $$ChatRoomTableProcessedTableManager,
    $$ChatRoomTableInsertCompanionBuilder,
    $$ChatRoomTableUpdateCompanionBuilder> {
  $$ChatRoomTableProcessedTableManager(super.$state);
}

class $$ChatRoomTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ChatRoomTable> {
  $$ChatRoomTableFilterComposer(super.$state);
  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter chatHistoryRefs(
      ComposableFilter Function($$ChatHistoryTableFilterComposer f) f) {
    final $$ChatHistoryTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.chatHistory,
        getReferencedColumn: (t) => t.chatRoomId,
        builder: (joinBuilder, parentComposers) =>
            $$ChatHistoryTableFilterComposer(ComposerState($state.db,
                $state.db.chatHistory, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$ChatRoomTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ChatRoomTable> {
  $$ChatRoomTableOrderingComposer(super.$state);
  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$ChatHistoryTableInsertCompanionBuilder = ChatHistoryCompanion
    Function({
  Value<int> id,
  required String userType,
  required String message,
  required int chatRoomId,
  required DateTime createdTime,
});
typedef $$ChatHistoryTableUpdateCompanionBuilder = ChatHistoryCompanion
    Function({
  Value<int> id,
  Value<String> userType,
  Value<String> message,
  Value<int> chatRoomId,
  Value<DateTime> createdTime,
});

class $$ChatHistoryTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ChatHistoryTable,
    ChatHistoryData,
    $$ChatHistoryTableFilterComposer,
    $$ChatHistoryTableOrderingComposer,
    $$ChatHistoryTableProcessedTableManager,
    $$ChatHistoryTableInsertCompanionBuilder,
    $$ChatHistoryTableUpdateCompanionBuilder> {
  $$ChatHistoryTableTableManager(_$AppDatabase db, $ChatHistoryTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ChatHistoryTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ChatHistoryTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$ChatHistoryTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> userType = const Value.absent(),
            Value<String> message = const Value.absent(),
            Value<int> chatRoomId = const Value.absent(),
            Value<DateTime> createdTime = const Value.absent(),
          }) =>
              ChatHistoryCompanion(
            id: id,
            userType: userType,
            message: message,
            chatRoomId: chatRoomId,
            createdTime: createdTime,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String userType,
            required String message,
            required int chatRoomId,
            required DateTime createdTime,
          }) =>
              ChatHistoryCompanion.insert(
            id: id,
            userType: userType,
            message: message,
            chatRoomId: chatRoomId,
            createdTime: createdTime,
          ),
        ));
}

class $$ChatHistoryTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $ChatHistoryTable,
    ChatHistoryData,
    $$ChatHistoryTableFilterComposer,
    $$ChatHistoryTableOrderingComposer,
    $$ChatHistoryTableProcessedTableManager,
    $$ChatHistoryTableInsertCompanionBuilder,
    $$ChatHistoryTableUpdateCompanionBuilder> {
  $$ChatHistoryTableProcessedTableManager(super.$state);
}

class $$ChatHistoryTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ChatHistoryTable> {
  $$ChatHistoryTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get userType => $state.composableBuilder(
      column: $state.table.userType,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get message => $state.composableBuilder(
      column: $state.table.message,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdTime => $state.composableBuilder(
      column: $state.table.createdTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$ChatRoomTableFilterComposer get chatRoomId {
    final $$ChatRoomTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.chatRoomId,
        referencedTable: $state.db.chatRoom,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ChatRoomTableFilterComposer(ComposerState(
                $state.db, $state.db.chatRoom, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$ChatHistoryTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ChatHistoryTable> {
  $$ChatHistoryTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get userType => $state.composableBuilder(
      column: $state.table.userType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get message => $state.composableBuilder(
      column: $state.table.message,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdTime => $state.composableBuilder(
      column: $state.table.createdTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$ChatRoomTableOrderingComposer get chatRoomId {
    final $$ChatRoomTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.chatRoomId,
        referencedTable: $state.db.chatRoom,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ChatRoomTableOrderingComposer(ComposerState(
                $state.db, $state.db.chatRoom, joinBuilder, parentComposers)));
    return composer;
  }
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $$ChatRoomTableTableManager get chatRoom =>
      $$ChatRoomTableTableManager(_db, _db.chatRoom);
  $$ChatHistoryTableTableManager get chatHistory =>
      $$ChatHistoryTableTableManager(_db, _db.chatHistory);
}

mixin _$ChatHistoryDaoMixin on DatabaseAccessor<AppDatabase> {
  $ChatRoomTable get chatRoom => attachedDatabase.chatRoom;
  $ChatHistoryTable get chatHistory => attachedDatabase.chatHistory;
}
mixin _$ChatRoomDaoMixin on DatabaseAccessor<AppDatabase> {
  $ChatRoomTable get chatRoom => attachedDatabase.chatRoom;
  $ChatHistoryTable get chatHistory => attachedDatabase.chatHistory;
}
