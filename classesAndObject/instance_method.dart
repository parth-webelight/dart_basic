class Bank {
  final String holderName;
  final String ifscCode;

  Bank({required this.holderName, required this.ifscCode});

  void displayDetail() {
    print(this.holderName);
    print(this.ifscCode);
  }

}

void main() {
  Bank bank = Bank(holderName: "Parth", ifscCode: "PUNB10099");
  bank.displayDetail();
}