import 'package:flutter/material.dart';

import '../../cancelled/views/cancelled_view.dart';
import '../../projects/views/projects_view.dart';
import '../../settings/views/settings_view.dart';
import '../../sources/views/sources_view.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final List<Widget> _body = const [
    ProjectsView(),
    CancelledView(),
    SourcesView(),
    SettingsView(),
  ];

  int _currentIndex = 0;

  void _onTap(int i) {
    setState(() {
      _currentIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Projects',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.close),
            label: 'Cancelled',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt),
            label: 'Sources',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
