void main() {
  // SIMPLE CLASS AND OBJECT
  TeamWebelight teamWebelight = TeamWebelight();
  teamWebelight.getEmpData();
}

// SIMPLE CLASS AND METHOD
class TeamWebelight {
  final String empName = "Parth Sakdasariya";
  final String empRole = "Flutter Intern";
  void getEmpData() {
    print("Emp Name :- ${this.empName}");
    print("Emp Role :- ${this.empRole}");
  }
}

