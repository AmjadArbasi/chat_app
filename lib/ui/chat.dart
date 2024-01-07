import 'package:chat_app/models/models.dart';
import 'package:chat_app/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late TextEditingController textEditingController;
  late User user;
  late Chat chat;
  String text = "";

  @override
  void initState() {
    user = Get.arguments[0];
    chat = Get.arguments[1];
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _CustomAppBar(user: user),
      body: CusttomContainer(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _ChatMessages(chat: chat),
            Container(
              margin: const EdgeInsets.all(15),
              child: TextFormField(
                controller: textEditingController,
                onChanged: (value) {
                  setState(() {
                    text = value;
                  });
                  debugPrint(text);
                },
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                      Get.isDarkMode ? Colors.grey[800] : Colors.grey[200],
                  hintText: "Type Message",
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.all(20.0),
                  suffixIcon: IconButton(
                    onPressed: () {
                      debugPrint(text);
                      Message message = Message(
                        senderId: "1",
                        receiverId: "2",
                        text: text,
                        createdAt: DateTime.now(),
                      );

                      List<Message> messages = List.from(chat.messages)
                        ..add(message);
                      messages.sort(
                        (a, b) => b.createdAt.compareTo(a.createdAt),
                      );
                      setState(() {
                        chat = chat.copyWith(messages: messages);
                      });
                      text = "";
                      textEditingController.clear();
                    },
                    icon: Icon(
                      Icons.send,
                      color: Get.isDarkMode
                          ? Colors.white
                          : Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChatMessages extends StatelessWidget {
  final Chat chat;
  const _ChatMessages({required this.chat});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        reverse: true,
        itemCount: chat.messages.length,
        itemBuilder: (BuildContext context, int index) {
          bool isSender = chat.messages[index].senderId == "1";
          return Align(
            alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 2,
              ),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: isSender
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.secondary,
              ),
              child: Text(
                chat.messages[index].text,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CustomAppBar({
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text("${user.firstName} ${user.lastName}"),
          const SizedBox(
            height: 4,
          ),
          Text(
            "Online",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
      elevation: 0,
      centerTitle: true,
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 10.0),
          child: CircleAvatar(
            radius: 22,
            backgroundImage: NetworkImage(user.image),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
