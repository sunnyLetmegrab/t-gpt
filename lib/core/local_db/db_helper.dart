import 'package:drift/drift.dart';
import 'package:t_gpt/core/local_db/db.dart';

abstract class ChatHistoryView extends View {
  ChatHistory get chatHistoryData;
  ChatRoom get chatRoom;

  @override
  Query as() => select([
        chatRoom.id,
        chatRoom.createdAt,
      ]).from(chatRoom).join([
        leftOuterJoin(
          chatHistoryData,
          chatHistoryData.chatRoomId.equalsExp(chatRoom.id),
        )
      ]);
}
