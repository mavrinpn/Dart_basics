void main() {

  // Task 1
  print("gcd = " + DelimetersCalculator().gcd(9, 6).toString());
  print("lcm = " + DelimetersCalculator().lcm(16, 6).toString());

  
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

