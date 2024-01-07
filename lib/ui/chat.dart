import 'package:chat_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late User user;
  late Chat chat;
  late String text;

  @override
  void initState() {
    user = Get.arguments[0];
    chat = Get.arguments[1];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _CustomAppBar(user: user),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: chat.messages.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  bool isSender = chat.messages[index].senderId == "1";
                  return Align(
                    alignment:
                        isSender ? Alignment.centerRight : Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: isSender
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            right: 15,
                            left: 15,
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
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            top: 4.0,
                            right: 20,
                            left: 20,
                            bottom: 10.0,
                          ),
                          child: Text(
                            "${chat.messages[index].createdAt.hour}:${chat.messages[index].createdAt.minute}",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                bottom: 20,
                right: 20,
                left: 20,
              ),
              child: TextFormField(
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
                  fillColor: Colors.grey[200],
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
                          createdAt: DateTime.now());

                      List<Message> messages = List.from(chat.messages)
                        ..add(message);

                      setState(() {
                        chat = chat.copyWith(messages: messages);
                      });
                    },
                    icon: const Icon(Icons.send),
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
