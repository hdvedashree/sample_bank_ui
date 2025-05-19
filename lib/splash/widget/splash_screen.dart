import 'package:flutter/material.dart';
import 'package:sample_bank_app_ui/home/dashboard_screen.dart';
import 'package:sample_bank_app_ui/utilities/app_colors.dart';
import 'package:sample_bank_app_ui/utilities/app_text_styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset("assets/images/splash_screen.png"),
            SizedBox(height: 16),
            Text("Track Your Expense", style: AppTextStyles.regularBlack30w700),
            SizedBox(height: 12),
            Text(
              "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.",
              textAlign: TextAlign.center,
              style: AppTextStyles.regularBlack16w400,
            ),
            SizedBox(height: 50),
            Column(
              children: [
                _GetStartedButton(),
                _DoNotWantText(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _GetStartedButton extends StatelessWidget {
  const _GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (_, __, ___) => DashboardScreen(),
            transitionsBuilder: (_, animation, __, child) {
              const begin = Offset(1.0, 0.0); // Slide from right
              const end = Offset.zero;
              const curve = Curves.ease;

              final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              final offsetAnimation = animation.drive(tween);

              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
          ),
        );

      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9), color: AppColors.blackColor),
        child: Center(
          child: Text("Get Started", style: AppTextStyles.regularWhite12w400),
        ),
      ),
    );
  }
}

class _DoNotWantText extends StatelessWidget {
  const _DoNotWantText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Center(
        child: Text("I don’t want to", style: AppTextStyles.regularBlack12w400),
      ),
    );
  }
}
