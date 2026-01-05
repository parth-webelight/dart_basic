// FACTORY CONSTRUCTOR WITH DIFFRENT API RESPONCE
abstract class AppUser {
  String name;

  AppUser(this.name);

  factory AppUser.fromJson(Map<String, dynamic> json) {
    if (json['type'] == 'admin') {
      return AdminUser(json['name'], json['permissions']);
    } else {
      return NormalUser(json['name']);
    }
  }
}

class AdminUser extends AppUser {
  List<String> permissions;

  AdminUser(String name, this.permissions) : super(name);
}

class NormalUser extends AppUser {
  NormalUser(String name) : super(name);
}



// FACTORY CONSTRUCTOR WITH CONDITIONS
abstract class Payment {
  factory Payment(String type) {
    if (type == 'upi') {
      return UpiPayment();
    } else if (type == 'card') {
      return CardPayment();
    } else {
      throw Exception("Invalid payment type");
    }
  }

  void pay();
}

class UpiPayment implements Payment {
  @override
  void pay() => print("Paid using UPI");
}

class CardPayment implements Payment {
  @override
  void pay() => print("Paid using Card");
}

void main() {
  Payment p1 = Payment('upi');
  p1.pay();

  Payment p2 = Payment('card');
  p2.pay();

   var user = AppUser.fromJson({
    'type': 'admin',
    'name': 'Parth',
    'permissions': ['add', 'delete'],
  });

  print(user.runtimeType);
}