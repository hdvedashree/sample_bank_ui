class Transaction {
  final String title;
  final String description;
  final String time;
  final double amount;
  final bool isCredit;
  final String cardNumber;

  Transaction({
    required this.title,
    required this.description,
    required this.time,
    required this.amount,
    required this.isCredit,
    required this.cardNumber,
  });
}
