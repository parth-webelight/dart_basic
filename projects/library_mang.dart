import 'dart:io';

class LibraryBook {
  final String isbn;
  final String title;
  final String author;
  int quantity;

  LibraryBook({
    required this.isbn,
    required this.title,
    required this.author,
    required this.quantity,
  });
}

class LibraryMember {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  int currentQuantity;

  LibraryMember({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    this.currentQuantity = 0,
  });
}

class IssuedBook {
  final String memberId;
  final String isbn;

  IssuedBook({required this.memberId, required this.isbn});
}

class ReturnedBook {
  final String memberId;
  final String isbn;

  ReturnedBook({required this.memberId, required this.isbn});
}

class LibraryManagement {
  List<LibraryBook> libraryBooks = [
    LibraryBook(
      isbn: "1234",
      title: "The",
      author: "The",
      quantity: 20,
    ),
  ];

  List<LibraryMember> libraryMembers = [
    LibraryMember(
      id: "12345",
      name: "Parth",
      email: "parth@gmail.com",
      phoneNumber: "1230654789",
    ),
  ];

  List<IssuedBook> issuedBooks = [];
  List<ReturnedBook> returnedBooks = [];


  void addBook() {
    print("Enter ISBN:");
    String isbn = stdin.readLineSync() ?? "";

    if (checkBookStatus(isbn) != -1) {
      print("Book already exists!");
      return;
    }

    print("Enter Title:");
    String title = stdin.readLineSync() ?? "";

    print("Enter Author:");
    String author = stdin.readLineSync() ?? "";

    print("Enter Quantity:");
    int quantity = int.tryParse(stdin.readLineSync() ?? "") ?? 0;

    if (isbn.isEmpty || title.isEmpty || author.isEmpty || quantity <= 0) {
      print("Invalid input!");
      return;
    }

    libraryBooks.add(
      LibraryBook(
        isbn: isbn,
        title: title,
        author: author,
        quantity: quantity,
      ),
    );

    print("Book added successfully!");
  }



  void registerMember() {
    String rawId = DateTime.now().millisecondsSinceEpoch.toString();
    String memberId =
        (int.parse(rawId) % 100000).toString().padLeft(5, '0');

    print("Enter Name:");
    String name = stdin.readLineSync() ?? "";

    print("Enter Email:");
    String email = stdin.readLineSync() ?? "";

    print("Enter Phone Number:");
    String phoneNumber = stdin.readLineSync() ?? "";

    if (name.isEmpty || email.isEmpty || phoneNumber.length != 10) {
      print("Invalid member details!");
      return;
    }

    libraryMembers.add(
      LibraryMember(
        id: memberId,
        name: name,
        email: email,
        phoneNumber: phoneNumber,
      ),
    );

    print("Member registered successfully!");
    print("Your Member ID: $memberId");
  }


  void issueBook() {
    print("Enter Member ID:");
    String memberId = stdin.readLineSync() ?? "";

    int memberIndex = checkMemberStatus(memberId);
    if (memberIndex == -1) {
      print("Member not found!");
      return;
    }

    print("Enter ISBN:");
    String isbn = stdin.readLineSync() ?? "";

    int bookIndex = checkBookStatus(isbn);
    if (bookIndex == -1) {
      print("Book not found!");
      return;
    }

    if (libraryBooks[bookIndex].quantity <= 0) {
      print("Book not available!");
      return;
    }

    libraryBooks[bookIndex].quantity--;
    libraryMembers[memberIndex].currentQuantity++;
    issuedBooks.add(IssuedBook(memberId: memberId, isbn: isbn));

    print("Book issued successfully!");
  }

  void returnBook() {
    print("Enter Member ID:");
    String memberId = stdin.readLineSync() ?? "";

    print("Enter ISBN:");
    String isbn = stdin.readLineSync() ?? "";

    int issueIndex = checkIssuedBookStatus(memberId, isbn);
    if (issueIndex == -1) {
      print("This book was not issued to this member!");
      return;
    }

    int bookIndex = checkBookStatus(isbn);
    libraryBooks[bookIndex].quantity++;

    returnedBooks.add(ReturnedBook(memberId: memberId, isbn: isbn));
    issuedBooks.removeAt(issueIndex);

    print("Book returned successfully!");
  }


  void checkMemberDetails() {
    print("Enter Member ID:");
    String memberId = stdin.readLineSync() ?? "";

    int index = checkMemberStatus(memberId);
    if (index == -1) {
      print("Member not found!");
      return;
    }

    var member = libraryMembers[index];

    print("\n=== MEMBER DETAILS ===");
    print("ID: ${member.id}");
    print("Name: ${member.name}");
    print("Email: ${member.email}");
    print("Phone: ${member.phoneNumber}");

    print("\nIssued Books:");
    getIssuedBooksByMember(memberId);
  }



  void checkBookDetails() {
    print("Enter ISBN:");
    String isbn = stdin.readLineSync() ?? "";

    int index = checkBookStatus(isbn);
    if (index == -1) {
      print("Book not found!");
      return;
    }

    var book = libraryBooks[index];
    print(
        "ISBN: ${book.isbn}, Title: ${book.title}, Author: ${book.author}, Available: ${book.quantity}");
  }

  

  void removeBook() {
    print("Enter ISBN:");
    String isbn = stdin.readLineSync() ?? "";

    int index = checkBookStatus(isbn);
    if (index == -1) {
      print("Book not found!");
      return;
    }

    libraryBooks.removeAt(index);
    print("Book removed!");
  }

  void removeMember() {
    print("Enter Member ID:");
    String memberId = stdin.readLineSync() ?? "";

    int index = checkMemberStatus(memberId);
    if (index == -1) {
      print("Member not found!");
      return;
    }
    if (libraryMembers[index].currentQuantity == 0 ) {
      libraryMembers.removeAt(index);
      print("Member removed!");
    } else {
      print("This member not return books !");
    }
  }



  void searchBook() {
    print("Enter Title or Author:");
    String query = stdin.readLineSync()!.toLowerCase();

    bool found = false;
    for (var book in libraryBooks) {
      if (book.title.toLowerCase().contains(query) ||
          book.author.toLowerCase().contains(query)) {
        print("${book.title} by ${book.author}");
        found = true;
      }
    }

    if (!found) print("No books found!");
  }



  void generateReport() {
    print("\n=== ALL BOOKS ===");
    for (var book in libraryBooks) {
      print(
          "${book.isbn} | ${book.title} | ${book.author} | Qty: ${book.quantity}");
    }

    print("\n=== ALL MEMBERS ===");
    for (var member in libraryMembers) {
      print("${member.id} | ${member.name} | ${member.phoneNumber}");
    }
  }



  void getIssuedBooksByMember(String memberId) {
    for (var issue in issuedBooks) {
      if (issue.memberId == memberId) {
        var book =
            libraryBooks.firstWhere((b) => b.isbn == issue.isbn);
            print("ISBN : ${book.isbn}");
        print("${book.title} by ${book.author}");
      }
    }
  }

  int checkBookStatus(String isbn) =>
      libraryBooks.indexWhere((book) => book.isbn == isbn);

  int checkMemberStatus(String id) =>
      libraryMembers.indexWhere((member) => member.id == id);

  int checkIssuedBookStatus(String memberId, String isbn) =>
      issuedBooks.indexWhere(
          (book) => book.memberId == memberId && book.isbn == isbn);
}
void main() {
  LibraryManagement library = LibraryManagement();
  String choice;

  do {
    print("\n--- LIBRARY SYSTEM ---");
    print("1. Add Book");
    print("2. Add Member");
    print("3. Issue Book");
    print("4. Return Book");
    print("5. Member Details");
    print("6. Book Details");
    print("7. Remove Member");
    print("8. Remove Book");
    print("9. Search Book");
    print("10. Generate Report");
    print("11. Exit");

    choice = stdin.readLineSync() ?? '11';

    switch (choice) {
      case '1':
        library.addBook();
        break;
      case '2':
        library.registerMember();
        break;
      case '3':
        library.issueBook();
        break;
      case '4':
        library.returnBook();
        break;
      case '5':
        library.checkMemberDetails();
        break;
      case '6':
        library.checkBookDetails();
        break;
      case '7':
        library.removeMember();
        break;
      case '8':
        library.removeBook();
        break;
      case '9':
        library.searchBook();
        break;
      case '10':
        library.generateReport();
        break;
      case '11':
        print("Exiting system...");
        break;
      default:
        print("Invalid choice!");
    }
  } while (choice != '11');
}
