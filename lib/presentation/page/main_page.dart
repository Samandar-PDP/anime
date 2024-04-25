import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/widget/bottom_tab.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomTab(
        selectedIndex: _selectedIndex,
        onClick: (index) => setState(() { _selectedIndex = index; }),
      ),
    );
  }
}
