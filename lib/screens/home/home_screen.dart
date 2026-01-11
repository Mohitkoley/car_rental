import 'package:car/theme/color_palette.dart';
import 'package:car/widgets/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:common_extension/common_extension.dart';

import 'package:car/navigation/route_names.dart';
import 'package:car/widgets/common/brand_logo.dart';
import 'package:car/screens/home/profile_view.dart';
import 'package:car/widgets/common/common_image.dart';
import 'package:car/screens/booking/confirmed_bookings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final children = const [HomeView(), ConfirmedBookingsScreen(), ProfileView()];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.grey[50], // Light background
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: children,)
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: ColorPalette.primary, // Blue accent
        unselectedItemColor: ColorPalette.textSecondary,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  
}
