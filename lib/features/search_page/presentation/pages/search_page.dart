import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:t_gpt/core/local_db/db.dart';
import 'package:t_gpt/core/local_db/db.dart';
import 'package:t_gpt/core/model/chat_model.dart';
import 'package:t_gpt/features/search_page/presentation/widgets/bold_parser.dart';
import 'package:t_gpt/main.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var chatctrl = TextEditingController();

  var outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.shade300,
      ),
      borderRadius: BorderRadius.circular(30));
  final model = GenerativeModel(
    model: 'gemini-1.5-flash-latest',
    apiKey: "AIzaSyCPKo035_SCATFwl_y37JqohFhcHVZUgds",
    generationConfig: GenerationConfig(),
  );
  var scale = ValueNotifier(1.0);
  var loading = ValueNotifier(false);
  var chatHistory = ValueNotifier(<ChatModel>[]);

  late ChatSession session;
  ChatRoomData? chatRoomData;
  @override
  void initState() {
    session = model.startChat(
      generationConfig: GenerationConfig(candidateCount: 3),
    );
    super.initState();
    try {
      Future.delayed(
        Duration.zero,
        () async {
          chatRoomData = await appDatabase.chatRoomDao
              .insertChatRoom(ChatRoomCompanion.insert());
        },
      );
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        elevation: 5,
      ),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: chatHistory,
              builder: (context, chatList, child) => ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                reverse: true,
                itemCount: chatHistory.value.length,
                itemBuilder: (context, index) {
                  var item = chatList.elementAt(index);
                  var isEven = chatList.elementAt(index).isUser;
                  return Row(
                    mainAxisAlignment: isEven
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          color:
                              isEven ? Colors.blueAccent : Colors.grey.shade300,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(isEven ? 10 : 0),
                            topRight: Radius.circular(isEven ? 0 : 10),
                            bottomRight: const Radius.circular(10),
                            bottomLeft: const Radius.circular(10),
                          ),
                        ),
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * .8,
                          minHeight: 30,
                        ),
                        child: isEven
                            ? Text(
                                item.text,
                                style: const TextStyle(color: Colors.white),
                              )
                            : RichTextParser(
                                text: item.text,
                                textCololr: const Color(0xff121212),
                              ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: .5,
                    blurRadius: 10,
                    color: Colors.blueAccent.withOpacity(.5),
                  )
                ],
                color: Colors.white,
              ),
              child: TextFormField(
                controller: chatctrl,
                decoration: InputDecoration(
                    isDense: true,
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height / 4),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    border: outlineInputBorder,
                    errorBorder: outlineInputBorder,
                    enabledBorder: outlineInputBorder,
                    focusedBorder: outlineInputBorder,
                    disabledBorder: outlineInputBorder,
                    focusedErrorBorder: outlineInputBorder,
                    suffixIcon: ValueListenableBuilder(
                      valueListenable: loading,
                      builder: (context, isLoading, child) =>
                          ValueListenableBuilder(
                        valueListenable: scale,
                        builder: (context, value, child) => AnimatedScale(
                          scale: scale.value,
                          duration: const Duration(milliseconds: 100),
                          child: IconButton(
                            icon: isLoading
                                ? const CircularProgressIndicator()
                                : const Icon(
                                    Icons.send_rounded,
                                    size: 24,
                                    color: Colors.blueAccent,
                                  ),
                            onPressed: !isLoading ? onButtonClick : null,
                          ),
                        ),
                      ),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onButtonClick() async {
    FocusScope.of(context).unfocus();
    loading.value = true;
    var content = chatctrl.text.trim();

    scale.value = .7;
    await Future.delayed(const Duration(milliseconds: 50));
    scale.value = 1;
    var userModel = ChatModel(text: content, image: "", isUser: true);
    chatHistory.value.insert(0, userModel);
    chatHistory.notifyListeners();
    var response = session.sendMessageStream(Content.text(content));
    chatHistory.value
        .insert(0, const ChatModel(text: "", image: "", isUser: false));
    var data = chatHistory.value.elementAt(0);
    response.listen((event) {
      var text = data.text +
          event.candidates
              .map((candidate) => candidate.content.parts
                  .map((e) => (e as TextPart).text)
                  .join(""))
              .join("");
      data = data.copyWith(text: text);
      chatHistory.value[0] = data;
      chatHistory.notifyListeners();
    }, onDone: () {
      loading.value = false;
      appDatabase.chatHistoryDao.insertHistory(ChatHistoryCompanion.insert(
        userType: "user",
        message: content,
        chatRoomId: chatRoomData!.id,
        createdTime: DateTime.now(),
      ));
      appDatabase.chatHistoryDao.insertHistory(ChatHistoryCompanion.insert(
          userType: "model",
          message: chatHistory.value[0].text,
          createdTime: DateTime.now(),
          chatRoomId: chatRoomData!.id));
    }, onError: (error) {
      loading.value = false;
    });
  }
}
