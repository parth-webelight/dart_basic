void main(List<String> args) async {
  // 1. BASIC FUNCTION
  sayHello();

  // 2. FUNCTION WITH RETURN
  print("Add: ${add()}");

  // 3. FUNCTION WITH PARAMETERS
  greet("Parth");

  // 4. FUNCTION WITH RETURN + PARAMETERS
  print("Sum: ${sum(10, 20)}");

  // 5. ARROW FUNCTION
  print("Multiply: ${multiply(4, 5)}");

  // 6. OPTIONAL POSITIONAL PARAMETERS
  showInfo("Parth");
  showInfo("Parth", 22);

  // 7. OPTIONAL NAMED PARAMETERS
  login(username: "admin", password: "1234");

  // 8. REQUIRED NAMED PARAMETERS
  register(email: "test@mail.com", password: "pass123");

  // 9. DEFAULT VALUE PARAMETER
  setVolume();
  setVolume(10);

  // 10. ANONYMOUS FUNCTION
  var anon = () {
    print("Anonymous Function");
  };
  anon();

  // 11. ANONYMOUS FUNCTION WITH PARAMETERS
  var addAnon = (int a, int b) => a + b;
  print("Anon Add: ${addAnon(5, 6)}");

  // 12. HIGHER-ORDER FUNCTION
  calculate(5, 3, (a, b) => a * b);

  // 13. FUNCTION RETURNING FUNCTION
  var doubler = makeMultiplier(2);
  print("Doubler: ${doubler(5)}");

  // 14. RECURSIVE FUNCTION
  print("Factorial: ${factorial(5)}");

  // 15. ASYNC FUNCTION
  await fetchData();

  // 16. ASYNC FUNCTION WITH RETURN
  print("Async value: ${await getNumber()}");

  // 17. GENERATOR FUNCTION (SYNC*)
  for (var n in numbers()) {
    print("Sync*: $n");
  }

  // 18. ASYNC GENERATOR FUNCTION (ASYNC*)
  await for (var n in streamNumbers()) {
    print("Async*: $n");
  }

  // 19. CLASS METHOD
  Person p = Person();
  p.speak();

  // 20. STATIC METHOD
  print("Square: ${MathUtils.square(6)}");

  // 21 & 22. GETTER AND SETTER
  User u = User();
  u.password = "secret";
  print("Username: ${u.username}");
}

// 1. BASIC FUNCTION
void sayHello() {
  print("Hello Dart");
}

// 2. FUNCTION WITH RETURN
int add() {
  return 10 + 20;
}

// 3. FUNCTION WITH PARAMETERS
void greet(String name) {
  print("Hello $name");
}

// 4. FUNCTION WITH RETURN + PARAMETERS
int sum(int a, int b) {
  return a + b;
}

// 5. ARROW FUNCTION
int multiply(int a, int b) => a * b;

// 6. OPTIONAL POSITIONAL PARAMETERS
void showInfo(String name, [int? age]) {
  print("Name: $name");
  print("Age: ${age ?? 'Not provided'}");
}

// 7. OPTIONAL NAMED PARAMETERS
void login({String? username, String? password}) {
  print("Login: $username / $password");
}

// 8. REQUIRED NAMED PARAMETERS
void register({required String email, required String password}) {
  print("Registered: $email");
}

// 9. DEFAULT PARAMETER VALUE
void setVolume([int level = 5]) {
  print("Volume: $level");
}

// 12. HIGHER-ORDER FUNCTION
void calculate(int a, int b, Function operation) {
  print("Calculate: ${operation(a, b)}");
}

// 13. FUNCTION RETURNING FUNCTION
Function makeMultiplier(int n) {
  return (int x) => x * n;
}

// 14. RECURSIVE FUNCTION
int factorial(int n) {
  if (n <= 1) return 1;
  return n * factorial(n - 1);
}

// 15. ASYNC FUNCTION
Future<void> fetchData() async {
  await Future.delayed(Duration(seconds: 1));
  print("Data fetched");
}

// 16. ASYNC FUNCTION WITH RETURN
Future<int> getNumber() async {
  return 100;
}

// 17. GENERATOR FUNCTION (SYNC*)
Iterable<int> numbers() sync* {
  yield 1;
  yield 2;
  yield 3;
}

// 18. ASYNC GENERATOR FUNCTION (ASYNC*)
Stream<int> streamNumbers() async* {
  yield 10;
  yield 20;
}


// CLASS WITH METHOD
class Person {
  void speak() {
    print("Person speaking");
  }
}

// CLASS WITH STATIC METHOD
class MathUtils {
  static int square(int x) => x * x;
}

// CLASS WITH GETTER AND SETTER
class User {
  String name = "Parth";
  String _password = "";

  // GETTER
  String get username => name.toUpperCase();

  // SETTER
  set password(String value) {
    _password = value;
  }
}
