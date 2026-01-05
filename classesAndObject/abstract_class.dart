abstract class Hosital {
  // ABSTRACT METHOD
  void checkList() {}
  void registerMember() {}
}

class Salby extends Hosital {
  @override
  void checkList() {}

  @override
  void registerMember() {}
}


void mian() {
  Salby salby = Salby();
  salby.checkList();
  salby.registerMember();
}