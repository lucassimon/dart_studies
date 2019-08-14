class Discount {
  final message = "Should be greater than zero!";
  // Amount is in cents. 300 cents is 3 dollars
  int amount;

  Discount(int amount) {
    if (amount <= 0) {
      throw ArgumentError(this.message);
    }

    this.amount = amount;
  }

  // Calculate the discount
  int calculate(int value, {bool isPercent = false }) {
    if (value <= 0) {
      throw ArgumentError(this.message);
    }

    if (isPercent) {
      double total = this.amount - (this.amount * value / 100);
      return total.toInt();
    }

    return amount - value;
  }
}