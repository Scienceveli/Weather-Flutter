import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../Models/Chat_model.dart.dart';
import '../../../../Models/Model.dart.dart';
import '../../../../Network/api_services.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatScreen> {
  String messagePrompt = '';
  int tokenValue = 500;
  List<Chat> chatList = [];
  List<Model> modelsList = [];
  late SharedPreferences prefs;
  @override
  void initState() {
    super.initState();
    getModels();
    initPrefs();
  }

  void getModels() async {
    modelsList = await submitGetModelsForm(context: context);
  }

  List<DropdownMenuItem<String>> get models {
    List<DropdownMenuItem<String>> menuItems =
        List.generate(modelsList.length, (i) {
      return DropdownMenuItem(
        value: modelsList[i].id,
        child: Text(modelsList[i].id),
      );
    });
    return menuItems;
  }

  void initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    tokenValue = prefs.getInt("token") ?? 500;
  }

  TextEditingController mesageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                _topChat(),
                _bodyChat(),
                const SizedBox(
                  height: 75,
                )
              ],
            ),
            _formChat(),
          ],
        ),
      ),
    );
  }

  void saveData(int value) {
    prefs.setInt("token", value);
  }

  int getData() {
    return prefs.getInt("token") ?? 1;
  }

  _topChat() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: Colors.white,
                ),
              ),
              const Text(
                'Chat GPT',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget chats() {
    return ListView.builder(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: chatList.length,
      itemBuilder: (context, index) => _itemChat(
        chat: chatList[index].chat,
        message: chatList[index].msg,
      ),
    );
  }

  Widget _bodyChat() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45)),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            children: [
              chats(),
            ],
          ),
        ),
      ),
    );
  }

  _itemChat({required int chat, required String message}) {
    return Row(
      mainAxisAlignment:
          chat == 0 ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          child: Container(
            margin: const EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              color: chat == 0 ? Colors.indigo.shade100 : Colors.indigo.shade50,
              borderRadius: chat == 0
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    )
                  : const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
            ),
            child: chatWidget(message),
          ),
        ),
      ],
    );
  }

  Widget chatWidget(String text) {
    return SizedBox(
      width: 220,
      child: AnimatedTextKit(
        animatedTexts: [
          TyperAnimatedText(
            text.replaceFirst('\n\n', ''),
          ),
        ],
        repeatForever: false,
        totalRepeatCount: 1,
      ),
    );
  }

  Widget _formChat() {
    return Positioned(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          color: Colors.white,
          child: TextField(
            controller: mesageController,
            decoration: InputDecoration(
              hintText: 'Enter your message...',
              suffixIcon: InkWell(
                onTap: (() async {
                  messagePrompt = mesageController.text.toString();
                  setState(() {
                    chatList.add(Chat(msg: messagePrompt, chat: 0));
                    mesageController.clear();
                  });
                  chatList.addAll(await submitGetChatsForm(
                    context: context,
                    prompt: messagePrompt,
                    tokenValue: tokenValue,
                  ));
                  setState(() {});
                }),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.teal),
                  padding: const EdgeInsets.all(15),
                  child: const Icon(
                    Icons.send_rounded,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
              filled: true,
              fillColor: Colors.blueGrey.shade50,
              labelStyle: const TextStyle(fontSize: 12),
              contentPadding: const EdgeInsets.all(20),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey.shade50),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                //! Outline Input Border
                borderSide: BorderSide(color: Colors.blueGrey.shade50),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
