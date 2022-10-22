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
        var tmp = a; a = b; b = tmp;
    }

    while (b != 0) {
        a %= b;
        // Swap
        var tmp = a; a = b; b = tmp;
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