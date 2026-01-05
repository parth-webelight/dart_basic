class User {
  String name;
  int age;
  User({required this.name, required this.age});
  User.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      age = json['age'];
}

void main() {
  User u1 = User(name: "Parth", age: 22);

  User u2 = User.fromJson({'name': 'Rahul', 'age': 25});

  print(u1.name);
  print(u2.name);
}
