import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:t_gpt/core/local_db/db_helper.dart';
import 'package:t_gpt/core/model/history_model.dart';

part 'db.g.dart';

@DriftDatabase(
    tables: [ChatHistory, ChatRoom],
    views: [ChatHistoryView],
    daos: [ChatHistoryDao, ChatRoomDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<ChatRoomData>> get getChatHistory => select(chatRoom).get();
  Future<ChatRoomData?> insertRoom(ChatRoomCompanion companion) =>
      into(chatRoom).insertReturningOrNull(companion);

  Future<List<HistoryModel>> getRooms() async {
    final rows = await ((select(chatHistory)
              ..where((tbl) => tbl.userType.equals('user')))
            .join([
      leftOuterJoin(chatRoom, chatRoom.id.equalsExp(chatHistory.chatRoomId))
    ])
          ..groupBy([chatRoom.id])
          ..orderBy([OrderingTerm.asc(chatHistory.createdTime)]))
        .get();
    var formattedRow = rows.map((e) {
      var roomData = e.readTable(chatRoom);
      var chatData = e.readTableOrNull(chatHistory);
      return HistoryModel(
        lastMessageTime: chatData?.createdTime ?? DateTime.now(),
        message: chatData?.message ?? '',
        roomId: roomData.id,
      );
    });
    return formattedRow.toList();
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    // Also work around limitations on old Android versions
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    // Make sqlite3 pick a more suitable location for temporary files - the
    // one from the system may be inaccessible due to sandboxing.
    final cachebase = (await getTemporaryDirectory()).path;
    // We can't access /tmp on Android, which sqlite3 would try by default.
    // Explicitly tell it about the correct temporary directory.
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}

class ChatRoom extends Table {
  DateTimeColumn get createdAt =>
      dateTime().withDefault(Constant(DateTime.now()))();
  IntColumn get id => integer().autoIncrement()();
}

class ChatHistory extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userType => text().check(userType.isIn(["user", "model"]))();
  TextColumn get message => text()();
  IntColumn get chatRoomId => integer().references(ChatRoom, #id)();
  DateTimeColumn get createdTime => dateTime()();
}

@DriftAccessor(tables: [ChatRoom, ChatHistory])
class ChatRoomDao extends DatabaseAccessor<AppDatabase>
    with _$ChatRoomDaoMixin {
  ChatRoomDao(AppDatabase attachedDatabase) : super(attachedDatabase);

  Future<ChatRoomData?> insertChatRoom(ChatRoomCompanion companion) =>
      into(chatRoom).insertReturningOrNull(companion);

  Future deleteChatRoom(int id) =>
      (delete(chatRoom)..where((tbl) => tbl.id.equals(id))).go();

  Future getChatHistoryByRoom() async {}
}

@DriftAccessor(tables: [ChatHistory])
class ChatHistoryDao extends DatabaseAccessor<AppDatabase>
    with _$ChatHistoryDaoMixin {
  ChatHistoryDao(AppDatabase attachedDatabase) : super(attachedDatabase);

  Future<ChatHistoryData?> insertHistory(ChatHistoryCompanion companion) =>
      into(chatHistory).insertReturningOrNull(companion);

  Future<List<ChatHistoryData>> getChatByRoomId(int roomId) =>
      (select(chatHistory)..where((row) => row.chatRoomId.equals(roomId)))
          .get();
}
