void main() {
  // LIST
  var list = [1, 2, 3];
  assert(list.length == 3);
  assert(list[1] == 2);

  list[1] = 1;
  assert(list[1] == 1);

  // SET
  var elements = <String> {};
  elements.add("Hello !!");

  var henry = {'A','B','C','D'};
  print(henry);

  // MAP

  var userData = {
    'name' : 'Parth',
    'sureName' : 'Sakdasariya',
    'rollNumber' : '45'
  };

  userData['rollNumber'] = '91';

  print(userData);
}
