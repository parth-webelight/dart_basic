enum Gender { Male, Female, Other }

enum Status {
  success(200, 'Success'),
  failure(500, 'Failure'),
  warning(300, 'Warning');

  const Status(this.code, this.description); 
  final int code; 
  final String description;
  bool isSuccess() => this == Status.success;
}

class Person {
  String? firstName;
  String? lastName;
  Gender? gender;

  Person(this.firstName, this.lastName, this.gender);

  void display() {
    print("First Name: $firstName");
    print("Last Name: $lastName");
    print("Gender: $gender");
  }
}

void main() {
  Person p1 = Person("John", "Doe", Gender.Male);
  p1.display();

  Person p2 = Person("Menuka", "Sharma", Gender.Female);
  p2.display();

  print(Status.success.isSuccess());
}