// File: lib/pages/admin/main_admin_page.dart
import 'package:flutter/material.dart';
import 'dashboard_admin_page.dart';
import 'inventory_admin_page.dart';
import 'approvals_admin_page.dart';
import 'maintenance_admin_page.dart';


class MainAdminPage extends StatefulWidget {
  const MainAdminPage({super.key});

  @override
  State<MainAdminPage> createState() => _MainAdminPageState();
}

class _MainAdminPageState extends State<MainAdminPage> {
  int _selectedIndex = 1; // Sesuai desain, default aktif di Inventory

  // Daftar halaman untuk admin
  final List<Widget> _pages = [
    const Center(child: Text('Dashboard Page')), // Placeholder untuk index 0
    const DashboardAdminPage(), // Ini halaman Daftar Inventaris yang tadi dibuat (index 1)
    const ApprovalsAdminPage(), // Halaman Approvals
    const MaintenanceAdminPage(), // Halaman Maintenance
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            activeIcon: Icon(Icons.dashboard),
            label: 'DASHBOARD',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.layers_outlined),
            activeIcon: Icon(Icons.layers),
            label: 'INVENTORY',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined),
            activeIcon: Icon(Icons.fact_check),
            label: 'APPROVALS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings),
            label: 'MAINTENANCE',
          ),
        ],
      ),
    );
  }
}
