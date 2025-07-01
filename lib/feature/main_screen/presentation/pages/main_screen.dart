import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/widgets/bottom_nav_bar.dart';
import '../../../home/presentation/cubit/home_cubit/home_cubit.dart';
import '../../../home/presentation/pages/home_screen.dart';
import '../../../my_appointment_screen/presentation/pages/my_appointment_screen.dart';
import '../../../profile_screen/presentation/pages/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    MyAppointmentScreen(),
    ProfileScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..getHomeData(),
      child: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: MyBottomNavBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onTabTapped,
        ),
      ),
    );
  }
}
