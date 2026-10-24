abstract class Maintainable {
  void performMaintenance(); 
}

mixin AirConditioned {
  void turnOnAC() {
    print('Air conditioner is ON. Cabin is cooling down!');
  }
}

class Jeepney implements Maintainable {
  String route;
  int capacity;
  double _collectedFare = 0.0; 

  Jeepney(this.route, this.capacity);

  double get totalFare => _collectedFare;

  void collectFare(double amount) {
    _collectedFare += amount; 
  }

  void honk() {
    print('Standard Jeepney Horn: Beep beep!');
  }

  void performMaintenance() {
    print('Performing basic maintenance on jeepney (route: $route)...');
  }
}

class TraditionalJeepney extends Jeepney {
  TraditionalJeepney(String route, int capacity) : super(route, capacity);

  void honk() {
    print('Traditional Jeepney Horn: AHOOGA! Loud air horn!');
  }

  void performMaintenance() {
    print('Traditional Jeepney: Checking diesel engine oil and tires.');
  }
}

class ModernJeepney extends Jeepney with AirConditioned {
  ModernJeepney(String route, int capacity) : super(route, capacity);

  void honk() {
    print('Modern E-Jeepney Horn: Soft electronic chime chime!');
  }

  void performMaintenance() {
    print('Modern Jeepney: Checking electric battery health and AC filter.');
  }
}

void main() {
  print('=== Week 10: Enhanced OOP Jeepney Hierarchy ===\n');

  TraditionalJeepney traditionalJeep = TraditionalJeepney('Quiapo - Cubao', 20);
  ModernJeepney modernJeep = ModernJeepney('EDSA - Taft', 24);

  List<Jeepney> fleet = [traditionalJeep, modernJeep];

  for (var jeep in fleet) {
    print('--- Operating ${jeep.runtimeType} (${jeep.route}) ---');
    
    jeep.honk(); 
    
    jeep.collectFare(15.0 * 5);
    print('Total Collected Fare: ₱${jeep.totalFare}');
    
    jeep.performMaintenance();
    
    print('');
  }
  print('--- Testing Mixin Behavior ---');
  modernJeep.turnOnAC();
}