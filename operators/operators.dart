void main() {
  int firstNumber;
  int secondNumber;

  firstNumber = 0;
  secondNumber = ++firstNumber; // PREFIX INCREMENT
  assert(firstNumber == secondNumber);

  firstNumber = 0;
  secondNumber = firstNumber++; // POSTFIX INCREMENT
  assert(firstNumber != secondNumber);

  firstNumber = 0;
  secondNumber = --firstNumber; // PREFIX DECREMENT
  assert(firstNumber == secondNumber);

  firstNumber = 0;
  secondNumber = firstNumber--; // POSTFIX DECREMENT
  assert(firstNumber != secondNumber);

  // EQUALITY AND RELATIONAL OPERATORS
  assert(firstNumber == secondNumber);
  assert(firstNumber != secondNumber);
  assert(firstNumber > secondNumber);
  assert(firstNumber < secondNumber);
  assert(firstNumber >= secondNumber);
  assert(firstNumber <= secondNumber);

  // ASSIGNMENT OPERATORS
  // TO ASSIGNED VALUE
  firstNumber = firstNumber += 2;
  firstNumber = firstNumber -= 2;
  firstNumber = firstNumber *= 2;
  firstNumber != secondNumber;

  // CONDITIONAL OPERATORS || && ! ? :
  int num = 5;
  int numSecond = 0;

  num == 0 ? "TRUE" : "FALSE";
  numSecond <= 10 ? "TRUE" : "FALSE";

  String playerName(String? name) => name ?? "Parth";

  print(playerName(""));

  // BITWISE AND SHIFT OPP.

  final value = 0x22;
  final bitmask = 0x0f;

  assert((value & bitmask) == 0x02); // AND
  assert((value & ~bitmask) == 0x20); // AND NOT
  assert((value | bitmask) == 0x2f); // OR
  assert((value ^ bitmask) == 0x2d); // XOR

  assert((value << 4) == 0x220); // SHIFT LEFT
  assert((value >> 4) == 0x02); // SHIFT RIGHTT

  assert((-value >> 4) == -0x03);

  assert((value >>> 4) == 0x02); // UNSIGNED SHIFT RIGHTT
  assert((-value >>> 4) > 0); // UNSIGNED SHIFT LEFTT
}
