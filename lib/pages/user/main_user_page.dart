// File: lib/pages/user/main_user_page.dart
import 'package:flutter/material.dart';
import 'dashboard_user_page.dart';
import 'inventory_user_page.dart';
import 'activity_page.dart';
import 'profile_page.dart';
import '../../widgets/user_navbar.dart';

class MainUserPage extends StatefulWidget {
  const MainUserPage({super.key});

  @override
  State<MainUserPage> createState() => _MainUserPageState();
}

class _MainUserPageState extends State<MainUserPage> {
  int _selectedIndex = 0;

  // 🔥 Pastikan di sini tidak ada kata 'const' sebelum tanda '['
  final List<Widget> _pages = [
    const DashboardUserPage(),
    const InventoryUserPage(),
    const ActivityPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: UserNavbar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
