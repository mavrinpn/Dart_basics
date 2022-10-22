void main() {

  // Task 1
  print("Calculated GCD = " + DelimetersCalculator().gcd(9, 6).toString());
  print("Calculated LCM = " + DelimetersCalculator().lcm(16, 6).toString());

  // Task 2
  print("Decimal int to Binary String = " + 145.toBIN());
  print("Pseudo Binary int to Decimal int = " + 10010001.toDEC().toString());
  print("Binary String to Decimal int = " + "10010001".toDEC().toString());
}


class DelimetersCalculator {
  int gcd(int a, int b) {
    if (a < b) {
        // Swap
        var tmp = a;
        a = b;
        b = tmp;
    }

    while (b != 0) {
        a %= b;
        // Swap
        var tmp = a;
        a = b;
        b = tmp;
    }

    return a;
  }

  int lcm(int a, int b) {
    return a ~/ gcd(a, b) * b;
  }
}

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
    if (RegExp(r'^[0-1]+$').hasMatch(this)) { // require 0 and 1 only
      return int.parse(this, radix: 2);
    } else {
      return null;
    }
  }
}