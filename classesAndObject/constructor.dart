// SIMPLE CONSTRUCTOR
class Student {
  String? name;
  int? age;
  int? rollNumber;
  Student(String name, int age, int rollNumber) {
    print("Constructor called");
    this.name = name;
    this.age = age;
    this.rollNumber = rollNumber;
  }
}

// DEFAULT CONSTRUCTOR
class Laptop {
  String? brand;
  int? price;
  Laptop() {
    print("This is a default constructor");
  }
}

// PARAMETERIZED CONSTRUCTOR
class StudentX {
  String? name;
  int? age;
  int? rollNumber;
  StudentX(this.name, this.age, this.rollNumber);
}

// NAMED CONSTRUCTOR
class Mobile {
  String? name;
  String? color;
  int? price;

  Mobile(this.name, this.color, this.price);
  Mobile.namedConstructor(this.name, this.color, [this.price = 0]);
  void displayMobileDetails() {
    print("Mobile name: $name.");
    print("Mobile color: $color.");
    print("Mobile price: $price");
  }
}

void main() {
  Student student = Student("John", 20, 1);
  print("Name: ${student.name}");
  print("Age: ${student.age}");
  print("Roll Number: ${student.rollNumber}");
  StudentX studentx = StudentX("John", 20, 1);
  print("Name: ${studentx.name}");
  print("Age: ${studentx.age}");
  print("Roll Number: ${studentx.rollNumber}");
  var mobile1 = Mobile("Samsung", "Black", 20000);
  mobile1.displayMobileDetails();
  var mobile2 = Mobile.namedConstructor("Apple", "White");
  mobile2.displayMobileDetails();
}

