class Dog {
  Dog({
    this.id = 0,
    required this.name,
    required this.age,
  });

  final int id;
  final String name;
  final int age;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }
}
