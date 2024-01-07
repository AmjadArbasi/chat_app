class Message {
  final String senderId;
  final String receiverId;
  final String text;
  final DateTime createdAt;

  Message({
    required this.senderId,
    required this.receiverId,
    required this.text,
    required this.createdAt,
  });

  static List<Message> messages = [
    Message(
      senderId: "1",
      receiverId: "2",
      text: "How it is going ",
      createdAt: DateTime(2024, 1, 5, 18, 44),
    ),
    Message(
      senderId: "2",
      receiverId: "1",
      text: "Hello, it was lovely seeing you agin ",
      createdAt: DateTime(2024, 1, 5, 18, 44).add(const Duration(seconds: 50)),
    ),
    Message(
      senderId: "4",
      receiverId: "1",
      text: "What's up man, ",
      createdAt: DateTime(2024, 1, 5, 18, 44),
    ),
    Message(
      senderId: "1",
      receiverId: "4",
      text: "everything is fine, what about y bro? ",
      createdAt: DateTime(2024, 1, 5, 18, 44).add(const Duration(seconds: 50)),
    ),
    Message(
      senderId: "6",
      receiverId: "1",
      text: "How it is going ",
      createdAt: DateTime(2024, 1, 5, 18, 44),
    ),
    Message(
      senderId: "1",
      receiverId: "6",
      text: "Hello, it was lovely seeing you agin ",
      createdAt: DateTime(2024, 1, 5, 18, 44).add(const Duration(seconds: 50)),
    ),
  ];
}
