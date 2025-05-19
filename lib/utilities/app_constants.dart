import 'package:sample_bank_app_ui/home/model/transaction.dart';

class AppConstants{


 static  final List<Transaction> transactions = [
    Transaction(
      title: 'Bank Transfer - Sadapay',
      description: 'Online Transaction',
      time: '9:23 pm',
      amount: 113.12,
      isCredit: false,
      cardNumber: '**** 7845',
    ),
    Transaction(
      title: 'Bank Transfer - Sadapay',
      description: 'Online Transaction',
      time: '9:23 pm',
      amount: 752.12,
      isCredit: true,
      cardNumber: '**** 7845',
    ),
    Transaction(
      title: 'Bank Transfer - Sadapay',
      description: 'Online Transaction',
      time: '9:23 pm',
      amount: 845.12,
      isCredit: false,
      cardNumber: '**** 7845',
    ),
    Transaction(
      title: 'Bank Transfer - Sadapay',
      description: 'Online Transaction',
      time: '9:23 pm',
      amount: 652.12,
      isCredit: true,
      cardNumber: '**** 7845',
    ),
    Transaction(
      title: 'Bank Transfer - Sadapay',
      description: 'Online Transaction',
      time: '9:23 pm',
      amount: 752.12,
      isCredit: false,
      cardNumber: '**** 7845',
    ),
  ];

}