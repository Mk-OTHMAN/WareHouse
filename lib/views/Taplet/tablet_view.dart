import 'package:flutter/material.dart';
import 'package:warehouse/views/Desktop/screens/menu_screen.dart';

class TabletView extends StatefulWidget {
  const TabletView({super.key});

  @override
  State<TabletView> createState() => _TabletViewState();
}

class _TabletViewState extends State<TabletView> {
  @override
  Widget build(BuildContext context) {
    return const MenuScreen();
  }
}
