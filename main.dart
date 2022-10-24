import 'dart:math';

void main() {
  
  // Task 1
  print("Task 1");
  print("Calculated GCD = " + DelimetersCalculator().gcd(9, 6).toString());
  print("Calculated LCM = " + DelimetersCalculator().lcm(16, 6).toString());

  // Task 2
  print("\nTask 2");
  print("Decimal int to Binary String = " + (-145).toBIN());
  print("Pseudo Binary int to Decimal int = " + (10010001).toDEC().toString());
  print("Binary String to Decimal int = " + "-10010001".toDEC().toString());
  print("Pseudo Wrong Binary int to Decimal int = " + 12010001.toDEC().toString());
  print("Binary Wrong String to Decimal int = " + "1a010001".toDEC().toString());

  // Task 3
  print("\nTask 3");
  print("Parsed Numbers = " + StringNumberParser().parse("-0 one 2 three 3.4 five 6.0 seven 8 -9").toString());

  // Task 4
  print("\nTask 4");
  print("Count Words at List = " + ListHelper().countWords(['one', 'one', 'two', 'three', 'one', 'two', 'three', 'cat', 'dog']).toString());

  // Task 5
  print("\nTask 5");
  print("List Numbers from List = " + ListHelper().listNumbers(['one', 'one', 'two', 'three', 'one', 'two', 'three', 'cat', 'dog']).toString());

  // Task 6
  print("\nTask 6");
  print("Distance to Point = " + Point(10, 20, 30).distanceTo(Point(1, 2, 3)).toString());
  print("True Triangle Area = " + TriangleArea().calculate(Point(20, -10, 0), Point.origin(), Point.unitVector()).toString());
  print("Wrong Triangle Area = " + TriangleArea().calculate(Point(-1, -1, -1), Point.origin(), Point.unitVector()).toString());

  // Task 7
  print("\nTask 7");
  print("Sqrt = " + (-27).sqrt(3).toString());
  // print("Exception Sqrt = " + (3).sqrt(0).toString());
  // print("Exception Sqrt = " + (-25).sqrt(4).toString());

  // Task 8
  print("\nTask 8");
  // User wrong_user_0 = User('user_mail.ru');
  User user_1 = User('user_1@mail.ru');
  AdminUser user_2 = AdminUser('user_2@gmail.com');
  GeneralUser user_3 = GeneralUser('user_3@yandex.ru');
  print('Admin mail system = ' + user_2.getMailSystem());

  UserManager manager = UserManager();
  manager.addUser(user_1);
  manager.addUser(user_2);
  manager.addUser(user_3);
  print('Email list = ' + manager.listUserEmails().toString());
  manager.addUser(user_3);
  manager.removeUser(user_3);
  manager.removeUser(user_3);
  print('Email list = ' + manager.listUserEmails().toString());
}

// ============= TASK 1 =============
class DelimetersCalculator {
  int? gcd(int a, int b) {
    if (a == 0 && b == 0) {
      print('GCD for $a, $b is not defined');
      return null;
    }
    // One of nums non zero
    if (a < b) {
        // Swap
        final tmp = a; a = b; b = tmp;
    }

    while (b != 0) {
        a %= b;
        // Swap
        final tmp = a; a = b; b = tmp;
    }

    return a;
  }

  int? lcm(int a, int b) {
    if (a == 0 || b == 0) {
      print('LCM for $a, $b is not defined');
      return null;
    }
    // Both nums non zero
    return a ~/ gcd(a, b)! * b;
  }
}


// ============= TASK 2 =============
extension on int {
  String toBIN() {
    return this.toRadixString(2);
  }

  int? toDEC() {
    String _string = this.toString();
    return _string.toDEC();
  }
}

extension on String {
  int? toDEC() {
    if (RegExp(r'^[-]?[0-1]+$').hasMatch(this)) { // require 0, 1 and minus only
      return int.parse(this, radix: 2);
    } else {
      return null;
    }
  }
}


// ============= TASK 3 =============
class StringNumberParser {
  List<num> parse(String _string) {
    final splitted = _string.split(' ');
    List<num> numbers = [];
    for (String word in splitted) {
      num? number = int.tryParse(word) ?? double.tryParse(word) ?? null;
      if (number != null) {
        numbers.add(number);
      }
    }
    return numbers;
  }
}


// ============= TASK 4, 5 =============
class ListHelper {
  Map<String, int> countWords(List<String> _list) {
    Map<String, int> _map = {};
    for (String word in _list) {
      _map[word] = (_map[word] ?? 0) + 1;
    }
    return _map;
  }

  Set<int> listNumbers(List<String> _list) {
    Set<int> _set = {};
    for (String word in _list) {
      switch(word) {
        case 'zero': _set.add(0); break;
        case 'one': _set.add(1); break;
        case 'two': _set.add(2); break;
        case 'three': _set.add(3); break;
        case 'four': _set.add(4); break;
        case 'five': _set.add(5); break;
        case 'six': _set.add(6); break;
        case 'seven': _set.add(7); break;
        case 'eight': _set.add(8); break;
        case 'nine': _set.add(9); break;
      }
    }
    return _set;
  }
}


// ============= TASK 6 =============
class Point {

  final double x;
  final double y;
  final double z;

  Point(this.x, this.y, this.z);

  factory Point.origin() {
    return Point(0, 0, 0);
  }

  factory Point.unitVector() {
    return Point(1, 1, 1);
  }

  double distanceTo(Point _to) {
    final distance = sqrt(pow(x - _to.x, 2) + pow(y - _to.y, 2) + pow(z - _to.z, 2));
    return distance;
  }
}

class TriangleArea {
  double calculate(Point _A, Point _B, Point _C) {
    final AB = _A.distanceTo(_B);
    final BC = _B.distanceTo(_C);
    final CA = _C.distanceTo(_A);
    final p = _semiPerimeter(AB, BC, CA);
    final areaByHeron = sqrt(p * (p - AB) * (p - BC) * (p - CA));
    return areaByHeron;
  }

  double _semiPerimeter(double _AB, double _BC, double _CA) {
    final p = (_AB + _BC + _CA) / 2;
    return p;
  }
}


// ============= TASK 7 =============
extension on num {
  double sqrt(int n) {
    if (n <= 0) {
      throw ArgumentError('Root degree must be a positive number');
    }

    if (this < 0 && n % 2 == 0) {
      throw ArgumentError('Root degree must be odd if the number is negative');
    }

    final eps = 0.001;
    double A = this.toDouble();
    double X = A / n;
    double X_n1 = 1; // X^(n-1)
    double X_n = 0;

    while((X/X_n - 1).abs() >= eps) {
      X_n = X;

      X_n1 = 1;
      for (int i = 1; i < n; i++){
        X_n1 = X_n1 * X;
      }

      X = 1 / n * ((n - 1) * X + A / X_n1); // Newton method
    }

    return X;
  }
}


// ============= TASK 8 =============
class User {
  String email = 'undefined';

  User(String email) {
    if (RegExp(r'^\S+@\S+\.\S+$').hasMatch(email)) { // dev purpose only
      this.email = email;
    } else {
      throw ArgumentError('Email must be email');
    }
  }
}

mixin UserMailSystem on User {
  String getMailSystem() {
    return this.email.split('@')[1];
  }
}

class AdminUser extends User with UserMailSystem {
  AdminUser(super.email);
}

class GeneralUser extends User {
  GeneralUser(super.email);
}

//class UserManager<T extends User> { // ???
class UserManager {
  List<User> users = [];
  
  addUser(User user) { // void ???
    if (!users.contains(user)) {
      users.add(user);
      print('User ' + user.email + ' added');
    } else {
      print('User ' + user.email + ' already exists');
    }
  }

  removeUser(User user) { // void ???
    if (users.contains(user)) {
      users.removeWhere((element) => element == user);
      print('User ' + user.email + ' removed');
    } else {
      print('User ' + user.email + ' not exists');
    }
  }

  List<String> listUserEmails() {
    List<String> emails = [];
    for (User user in users) {
      emails.add(user is AdminUser ? user.getMailSystem() : user.email);
    }
    return emails;
  }
}