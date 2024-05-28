import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:t_gpt/core/model/history_model.dart';
import 'package:t_gpt/main.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  var list = ValueNotifier(<HistoryModel>[]);

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      var response = await appDatabase.getRooms();
      list.value = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ValueListenableBuilder(
        valueListenable: list,
        builder: (context, value, child) => ListView.builder(
          itemCount: list.value.length,
          itemBuilder: (context, index) {
            var data = list.value.elementAt(index);
            return ListTile(
                title: Text("${data.message}"),
                subtitle: Text(DateFormat("dd-MM-yyyy hh:mm a")
                    .format(data.lastMessageTime)),
                trailing: IconButton.filledTonal(
                  onPressed: () {
                    appDatabase.chatRoomDao.deleteChatRoom(data.roomId);
                  },
                  icon: Icon(Icons.delete_forever_rounded),
                ));
          },
        ),
      ),
    );
  }
}
