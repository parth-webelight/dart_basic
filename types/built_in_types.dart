// LATE VARIABLE
late String desc;

void main() {
  // VAR, STRING, INT, DOUBLE AND USE OF LATE VARIABLE
  var nameVar = "Parth";
  String nameString = "Parth";
  int day = 0;
  desc = "Sakdasariya";

  // NULL SAFETY 
  String? nameNull; // ONLY NULL OTHER WISE ASSIGNED VALUE
  // String namee; THIS IS ONLY ASSIGNED VALUE
  // FINAL OR CONST VARIABLE INSTANCE VARIABLE 
  final nameFinal = "Parth";
  final String nameFinalString = "Sakdasariya";
  final dayFinal = 0;
  final int dayFinalInt = 0;

  const bar = 100000;
  const double = 200000;

  // WILDCARD VARIABLE
  var _ = 1;

  print("Var : ${nameVar}, String : ${nameString}, Day : ${day}, Late : ${desc}");
  print("Null : ${nameNull}, final : ${nameFinal}, final String : ${nameFinalString}, final : ${dayFinal}, final int : ${dayFinalInt}");
  print("const : ${bar}, const double ${double}");

}