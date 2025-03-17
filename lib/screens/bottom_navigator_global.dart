import 'package:flutter/material.dart';
import 'package:test_case_wavex_intership/screens/history_screen/history_view_screen.dart';
import 'package:test_case_wavex_intership/screens/home_screen/home_view_screen.dart';
import 'package:test_case_wavex_intership/screens/profile_screen/profile_view_screen.dart';
import 'package:test_case_wavex_intership/screens/training_screen/training_view_screen.dart';

class BottomNavigatorGlobal extends StatefulWidget {
  const BottomNavigatorGlobal({super.key});

  @override
  State<BottomNavigatorGlobal> createState() => _BottomNavigatorGlobalState();
}

class _BottomNavigatorGlobalState extends State<BottomNavigatorGlobal> {
  int _selectedIndex = 1;
  final List<Widget> _widgetOptions = const <Widget>[
    HomeViewScreen(),
    TrainingViewScreen(),
    HistoryViewScreen(),
    ProfileViewScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // print("Selected Index: $_selectedIndex");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF356697).withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
          child: SizedBox(
            height: 80,
            child: BottomNavigationBar(
              enableFeedback: false,
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              backgroundColor: Colors.white,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      Image(
                          image: const AssetImage('assets/icon/home.png'),
                          width: 24,
                          height: 24,
                          color: _selectedIndex == 0
                              ? Theme.of(context)
                                  .bottomNavigationBarTheme
                                  .selectedItemColor
                              : Theme.of(context)
                                  .bottomNavigationBarTheme
                                  .unselectedItemColor),
                      const SizedBox(height: 4),
                    ],
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      Image(
                          image: const AssetImage('assets/icon/routing.png'),
                          width: 24,
                          height: 24,
                          color: _selectedIndex == 1
                              ? Theme.of(context)
                                  .bottomNavigationBarTheme
                                  .selectedItemColor
                              : Theme.of(context)
                                  .bottomNavigationBarTheme
                                  .unselectedItemColor),
                      const SizedBox(height: 4),
                    ],
                  ),
                  label: 'Training',
                ),
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      Image(
                          image: const AssetImage('assets/icon/history.png'),
                          width: 24,
                          height: 24,
                          color: _selectedIndex == 2
                              ? Theme.of(context)
                                  .bottomNavigationBarTheme
                                  .selectedItemColor
                              : Theme.of(context)
                                  .bottomNavigationBarTheme
                                  .unselectedItemColor),
                      const SizedBox(height: 4),
                    ],
                  ),
                  label: 'History',
                ),
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      Image(
                          image: const AssetImage('assets/icon/profile.png'),
                          width: 24,
                          height: 24,
                          color: _selectedIndex == 3
                              ? Theme.of(context)
                                  .bottomNavigationBarTheme
                                  .selectedItemColor
                              : Theme.of(context)
                                  .bottomNavigationBarTheme
                                  .unselectedItemColor),
                      const SizedBox(height: 4),
                    ],
                  ),
                  label: 'Profile',
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }
}
