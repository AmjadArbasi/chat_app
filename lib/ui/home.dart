// ignore_for_file: prefer_const_constructors

import 'package:chat_app/models/models.dart';
import 'package:chat_app/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    List<User> users = User.users;
    List<Message> messages =
        Message.messages.where((element) => element.senderId != "1").toList();
    return Scaffold(
      appBar: const _CustomAppBar(),
      body: Column(
        children: [
          _ChatContacts(users: users),
          Expanded(child: _ChatMessage(messages: messages, users: users)),
        ],
      ),
    );
  }
}

class _ChatMessage extends StatelessWidget {
  const _ChatMessage({
    required this.messages,
    required this.users,
  });

  final List<Message> messages;
  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return CusttomContainer(
      height: MediaQuery.of(context).size.height * 0.70,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, right: 8.0),
        child: ListView.builder(
          itemCount: messages.length,
          itemBuilder: (context, index) {
            User user = users
                .where((element) => element.id == messages[index].senderId)
                .first;

            List<Chat> chats = Chat.chats;

            chats[index].messages.sort(
                  (a, b) => b.createdAt.compareTo(a.createdAt),
                );

            return ListTile(
              onTap: () {
                Get.toNamed("/chat", arguments: [
                  user,
                  chats[index],
                ]);
              },
              title: Text(
                "${user.firstName} ${user.lastName}",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(user.image),
                radius: 35,
              ),
              subtitle: Text(
                messages[index].text,
                maxLines: 1,
                style: Theme.of(context).textTheme.bodySmall!,
              ),
              trailing: Text(
                "${messages[index].createdAt.hour}:${messages[index].createdAt.minute}",
                style: Theme.of(context).textTheme.bodySmall!,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _ChatContacts extends StatelessWidget {
  const _ChatContacts({
    super.key,
    required this.users,
  });

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.only(right: 10),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(users[index].image),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  users[index].firstName,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CustomAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Home',
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () {
            Get.changeThemeMode(
              Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
            );
          },
          icon: Icon(Get.isDarkMode ? Icons.dark_mode : Icons.light_mode),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
