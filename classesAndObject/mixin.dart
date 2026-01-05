mixin ElectricVariant {
  void electricVariant() {
    print('This is an electric variant');
  }
}

mixin PetrolVariant {
  void petrolVariant() {
    print('This is a petrol variant');
  }
}

class Car with  ElectricVariant, PetrolVariant {
  @override
  void electricVariant() {  }

  @override
  void petrolVariant() {  }
}
void main() {
  Car car = Car();
  car.electricVariant();
  car.petrolVariant();
}