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
      firstName: "Maikel",
      lastName: "Jon",
      image:
          "https://images.unsplash.com/photo-1580489944761-15a19d654956?q=80&w=1961&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    ),
    User(
      id: "2",
      firstName: "Taffiny",
      lastName: "Fordly",
      image:
          "https://images.unsplash.com/photo-1590835188701-7066aefd8afc?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    ),
    User(
      id: "3",
      firstName: "Bander",
      lastName: "Queen",
      image:
          "https://images.unsplash.com/photo-1614583225683-69db8b9965e4?q=80&w=1872&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    ),
    User(
      id: "4",
      firstName: "Lowes",
      lastName: "Person",
      image:
          "https://images.unsplash.com/photo-1640499900704-b00dd6a1103a?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    ),
    User(
      id: "5",
      firstName: "Person 2",
      lastName: "Kamal",
      image:
          "https://plus.unsplash.com/premium_photo-1670523428382-369413c80114?q=80&w=1904&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    ),
    User(
      id: "6",
      firstName: "Jhon",
      lastName: "Sin",
      image:
          "https://images.unsplash.com/photo-1627125451522-2f35aed06077?q=80&w=1898&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
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
