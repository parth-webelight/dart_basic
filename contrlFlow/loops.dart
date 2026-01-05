void mian() {
  // FOR
  var list = [1, 3, 4, 2, 1, 6, 5, 3, 4];
  for (var data in list) {
    print(data);
  }

  for (var i = 0; i <= list.length; i++) {
    print(list[i]);
  }

  // WHILE
  int i = 1;
  while (i <= 5) {
    print(i);
    i++;
  }

  // DO WHILE
  int number = 0;

  do {
    number++;
    print(number);
  } while (number < 5);

  // BREAK CONTINUE
  for (int i = 1; i <= 10; i++) {
    if (i == 5) {
      print("Breaking the loop at i = 5");
      break;
    }
    print("Current number: $i");
  }

  for (int i = 1; i <= 10; i++) {
    if (i == 5) {
      print("Skipping the rest of the code for i = 5");
      continue; 
    }
    print("Current number: $i");
  }
}
