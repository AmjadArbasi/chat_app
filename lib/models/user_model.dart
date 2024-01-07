class User {
  final String id;
  final String firstName;
  final String lastName;
  final String image;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.image,
  });

  static List<User> users = [
    User(
      id: "1",
      firstName: "ahmad",
      lastName: "Emad",
      image:
          "https://images.unsplash.com/photo-1580489944761-15a19d654956?q=80&w=1961&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    ),
    User(
      id: "2",
      firstName: "Ali",
      lastName: "Ali",
      image:
          "https://images.unsplash.com/photo-1580489944761-15a19d654956?q=80&w=1961&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    ),
    User(
      id: "3",
      firstName: "Salah",
      lastName: "Salah",
      image:
          "https://images.unsplash.com/photo-1614583225683-69db8b9965e4?q=80&w=1872&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    ),
    User(
      id: "4",
      firstName: "Mohammad",
      lastName: "Abedallah",
      image:
          "https://images.unsplash.com/photo-1640499900704-b00dd6a1103a?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    ),
    User(
      id: "5",
      firstName: "Mohammad",
      lastName: "Kamal",
      image:
          "https://images.unsplash.com/photo-1640499900704-b00dd6a1103a?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    ),
    User(
      id: "6",
      firstName: "Jhon",
      lastName: "Sin",
      image:
          "https://images.unsplash.com/photo-1640499900704-b00dd6a1103a?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    ),
    User(
      id: "7",
      firstName: "Kai",
      lastName: "Kai",
      image:
          "https://images.unsplash.com/photo-1640499900704-b00dd6a1103a?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    ),
  ];
}
