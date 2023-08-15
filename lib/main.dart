import 'package:flutter/material.dart';

import 'features/dashboard/views/dashboard_view.dart';

void main() {
  runApp(const StumperApp());
}

class StumperApp extends StatelessWidget {
  const StumperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stumper',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.black87,
          unselectedItemColor: Colors.grey.shade400,
        ),
      ),
      home: const DashboardView(),
    );
  }
}
