import 'dart:io';

void main() {
  // IF ELSE IF
  print("Enter your age : ");
  String age = stdin.readLineSync()!;

  if (int.parse(age).isEven) {
    print("Your age is even");
  } else {
    print("Your age is odd");
  }

  // SWITCH CASE
  print("Enter your selection : ");
  String command = stdin.readLineSync()!;
  switch (command) {
    case 'CLOSED':
      print("CLOSED");
      break;
    case 'PENDING':
      print("PENDING");
      break;
    case 'APPROVED':
      print("APPROVED");
      break;
    case 'DENIED':
      print("DENIED");
      break;
    case 'OPEN':
      print("OPEN");
      break;
    default:
      print("NOT A SELECTION");
      break;
  }
}
