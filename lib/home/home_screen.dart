import 'package:flutter/material.dart';
import 'package:sample_bank_app_ui/home/model/transaction.dart';
import 'package:sample_bank_app_ui/utilities/app_constants.dart';
import 'package:sample_bank_app_ui/utilities/app_text_styles.dart';

import '../utilities/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            BalanceCard(),
            SizedBox(
              height: 20,
            ),
            _TransactionLayout(),
            SizedBox(
              height: 20,
            ),
            Expanded(child: TransactionList()),
          ],
        ),
      ),
    );
  }
}

class TransactionList extends StatelessWidget {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: AppConstants.transactions.length,
        itemBuilder: (context, index) {
          return _TransactionItem(AppConstants.transactions[index]);
        });
  }
}

class _TransactionItem extends StatelessWidget {
  final Transaction transaction;

  const _TransactionItem(this.transaction, {super.key});

  @override
  Widget build(BuildContext context) {
    final isCredit = transaction.isCredit;
    final amountPrefix = isCredit ? '+' : '-';
    final amountColor = isCredit ? AppColors.redColor : AppColors.darkGreen;
    final iconPath = isCredit
        ? "assets/images/money_req.png"
        : "assets/images/money_send.png";

    return Container(
      color: AppColors.listTileBGColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(iconPath),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(transaction.title,
                          style: AppTextStyles.regularBlack12w400),
                      Text(transaction.description,
                          style: AppTextStyles.regularBlack10w400),
                      const SizedBox(height: 15),
                      Text(transaction.time,
                          style: AppTextStyles.regularBlack10w400),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '$amountPrefix\$${transaction.amount}',
                      style: AppTextStyles.regularBlack16w400.copyWith(
                        color: amountColor,
                        fontSize: 13.94,
                      ),
                    ),
                    Text(
                      'Visa ${transaction.cardNumber}',
                      style: AppTextStyles.regularBlack10w400,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            height: 1,
            color: AppColors.blackColor,
          ),
        ],
      ),
    );
  }
}

class _TransactionLayout extends StatelessWidget {
  const _TransactionLayout();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: const [
        Expanded(
          flex: 5,
          child: TransactionButton(
            iconPath: "assets/images/money_send.png",
            label: "Send Money",
          ),
        ),
        SizedBox(width: 50),
        Expanded(
          flex: 5,
          child: TransactionButton(
            iconPath: "assets/images/money_req.png",
            label: "Req Money",
          ),
        ),
      ],
    );
  }
}

class TransactionButton extends StatelessWidget {
  final String iconPath;
  final String label;

  const TransactionButton({
    super.key,
    required this.iconPath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: AppColors.blackColor,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconPath),
            const SizedBox(height: 4),
            Text(
              label,
              style: AppTextStyles.regularBlack12w400,
            ),
          ],
        ),
      ),
    );
  }
}

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        color: AppColors.selectedBottomNavColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              height: 85,
              decoration: BoxDecoration(
                color: AppColors.lightOliveGreen,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hi Inam",
                          style: AppTextStyles.interBlack13w400.copyWith(
                              fontSize: 28, fontWeight: FontWeight.bold)),
                      Text("Welcome back",
                          style: AppTextStyles.interBlack13w400
                              .copyWith(fontSize: 12)),
                      const SizedBox(height: 20),
                      Text("Your balance",
                          style: AppTextStyles.interBlack13w400
                              .copyWith(fontSize: 13.06)),
                      const SizedBox(height: 4),
                      Text("\$12,395",
                          style: AppTextStyles.interBlack13w400
                              .copyWith(fontSize: 13.06)),
                    ],
                  ),
                ),
                // Right side: Expense Circle
                CircularExpenseIndicator(
                  progress: 10,
                  amount: "\$2,004",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CircularExpenseIndicator extends StatelessWidget {
  final double progress;
  final String amount;

  const CircularExpenseIndicator({
    super.key,
    required this.progress,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Your Expense",
                style: AppTextStyles.interBlack13w400
                    .copyWith(fontSize: 9.98, fontWeight: FontWeight.w400)),
            const SizedBox(height: 4),
            Text(amount,
                style: AppTextStyles.interBlack13w400
                    .copyWith(fontSize: 16.45, fontWeight: FontWeight.w400)),
          ],
        ),
        SizedBox(
          height: 100,
          width: 100,
          child: CircularProgressIndicator(
            value: progress,
            strokeWidth: 4,
            backgroundColor: Colors.black12,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
          ),
        ),
      ],
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height * 0.6);

    path.quadraticBezierTo(
        size.width * 0.25, size.height, size.width * 0.5, size.height * 0.6);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.2, size.width, size.height * 0.6);

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
