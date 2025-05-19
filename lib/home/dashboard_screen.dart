import 'package:flutter/material.dart';
import 'package:sample_bank_app_ui/home/home_screen.dart';
import 'package:sample_bank_app_ui/utilities/app_colors.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 2; // Default to Home tab

  final List<Widget> _pages = const [
    DummyScreen("Search"),
    DummyScreen("Save"),
    HomeScreen(),
    DummyScreen("Message"),
    DummyScreen("Settings"),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Your logic here
            },
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: AppColors.blackColor,
          currentIndex: _currentIndex,
          selectedItemColor: AppColors.selectedBottomNavColor,
          unselectedItemColor: AppColors.unSelectedBottomNavColor,
          onTap: _onTabTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/search.png')),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/save.png')),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/home.png')),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/message.png')),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/setting.png')),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}

class DummyScreen extends StatelessWidget {
  final String title;
  const DummyScreen(this.title,{super.key});

  @override
  Widget build(BuildContext context) {
    return  Text(title);
  }
}
