import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/models/user_model.dart';

class Chat {
  final String chatId;
  final List<User> users;
  final List<Message> messages;

  Chat({required this.chatId, required this.users, required this.messages});

  Chat copyWith({
    String? chatId,
    List<User>? users,
    List<Message>? messages,
  }) {
    return Chat(
      chatId: chatId ?? this.chatId,
      users: users ?? this.users,
      messages: messages ?? this.messages,
    );
  }

  static List<Chat> chats = [
    Chat(
      chatId: "1",
      users:
          User.users.where((user) => user.id == "1" || user.id == "2").toList(),
      messages: Message.messages
          .where(
            (message) =>
                (message.senderId == "1" || message.senderId == "2") &&
                (message.receiverId == "1" || message.receiverId == "2"),
          )
          .toList(),
    ),
    Chat(
      chatId: "2",
      users:
          User.users.where((user) => user.id == "1" || user.id == "4").toList(),
      messages: Message.messages
          .where(
            (message) =>
                (message.senderId == "1" || message.senderId == "4") &&
                (message.receiverId == "1" || message.receiverId == "4"),
          )
          .toList(),
    ),
    Chat(
      chatId: "3",
      users:
          User.users.where((user) => user.id == "1" || user.id == "6").toList(),
      messages: Message.messages
          .where(
            (message) =>
                (message.senderId == "1" || message.senderId == "6") &&
                (message.receiverId == "1" || message.receiverId == "6"),
          )
          .toList(),
    ),
  ];
}
