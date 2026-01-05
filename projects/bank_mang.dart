import 'dart:io';

class BankMangment {
  List<AccountHolderModel> accountHolders = [];


  void addAccountHolder() {
    print("Enter account number: ");
    String accountNumber = stdin.readLineSync()!;

    if (checkAccountStatus(accountNumber) != -1) {
      print("This account number already exists!");
      return;
    }

    print("Enter holder name: ");
    String holderName = stdin.readLineSync()!;

    print("Enter opening balance: ");
    double openingBalance = double.tryParse(stdin.readLineSync() ?? '') ?? 0;

    if (openingBalance < 0) {
      throw Exception("Invalid opening balance!");
    }

    accountHolders.add(
      AccountHolderModel(
        accountNumber: accountNumber,
        holderName: holderName,
        balance: openingBalance,
      ),
    );

    print("Account created successfully!");
  }

  void deposit() {
    print("Enter account number: ");
    String accountNumber = stdin.readLineSync()!;
    int index = checkAccountStatus(accountNumber);

    if (index == -1) {
      print("Account not found!");
      return;
    }

    print("Enter amount to deposit: ");
    double amount = double.parse(stdin.readLineSync()!);

    if (amount <= 0) {
      throw Exception("Invalid amount!");
    }

    accountHolders[index].balance += amount;
    print("Deposit successful. New balance: ${accountHolders[index].balance}");
  }

  void withdraw() {
    print("Enter account number: ");
    String accountNumber = stdin.readLineSync()!;
    int index = checkAccountStatus(accountNumber);

    if (index == -1) {
      throw Exception("Account not found!");
    }

    print("Enter amount to withdraw: ");
    double amount = double.parse(stdin.readLineSync()!);

    if (amount <= 0) {
      throw Exception("Invalid amount!");
    }

    if (accountHolders[index].balance >= amount) {
      accountHolders[index].balance -= amount;
      print("Withdrawal successful. New balance: ${accountHolders[index].balance}");
    } else {
      print("Insufficient balance!");
    }
  }

  void checkBalance() {
    print("Enter account number: ");
    String accountNumber = stdin.readLineSync()!;
    int index = checkAccountStatus(accountNumber);

    if (index == -1) {
      throw Exception("Account not found!");
    }

    print("Account Holder: ${accountHolders[index].holderName}");
    print("Balance: ${accountHolders[index].balance}");
  }

  void closeAccount() {
    print("Enter account number: ");
    String accountNumber = stdin.readLineSync()!;
    int index = checkAccountStatus(accountNumber);

    if (index == -1) {
      throw Exception("Account not found!");
    }

    accountHolders.removeAt(index);
    print("Account closed successfully!");
  }

  void transfer() {
    print("Enter FROM account number: ");
    String fromAcc = stdin.readLineSync()!;

    print("Enter TO account number: ");
    String toAcc = stdin.readLineSync()!;

    print("Enter transfer amount: ");
    double amount = double.parse(stdin.readLineSync()!);

    int fromIndex = checkAccountStatus(fromAcc);
    int toIndex = checkAccountStatus(toAcc);

    if (fromIndex == -1 || toIndex == -1) {
      throw Exception("One or both accounts not found!");
    }

    if (amount <= 0) {
      throw Exception("Invalid amount!");
    }

    if (accountHolders[fromIndex].balance >= amount) {
      accountHolders[fromIndex].balance -= amount;
      accountHolders[toIndex].balance += amount;
      print("Transfer successful!");
    } else {
      print("Insufficient balance!");
    }
  }

  void printAccountHolders() {
    if (accountHolders.isEmpty) {
      throw Exception("No accounts found!");
    }

    print("---- Account Holders ----");
    for (var acc in accountHolders) {
      print(
          "Account: ${acc.accountNumber}, Name: ${acc.holderName}, Balance: ${acc.balance}");
    }
  }

  int checkAccountStatus(String accountNumber) {
    return accountHolders.indexWhere(
        (acc) => acc.accountNumber == accountNumber);
  }
}

class AccountHolderModel {
  final String accountNumber;
  final String holderName;
  double balance;

  AccountHolderModel({
    required this.accountNumber,
    required this.holderName,
    required this.balance,
  });
}
void main() {
  BankMangment bank = BankMangment();
  String choice;

  do {
    print("\n--- Banking System ---");
    print("1. Add Account");
    print("2. Deposit");
    print("3. Withdraw");
    print("4. Check Balance");
    print("5. Close Account");
    print("6. Transfer Money");
    print("7. Show All Accounts");
    print("8. Exit");

    choice = stdin.readLineSync() ?? '8';

    switch (choice) {
      case '1':
        bank.addAccountHolder();
        break;
      case '2':
        bank.deposit();
        break;
      case '3':
        bank.withdraw();
        break;
      case '4':
        bank.checkBalance();
        break;
      case '5':
        bank.closeAccount();
        break;
      case '6':
        bank.transfer();
        break;
      case '7':
        bank.printAccountHolders();
        break;
      case '8':
        print("Exiting banking system...");
        break;
      default:
        print("Please choose between 1-8");
    }
  } while (choice != '8');
}