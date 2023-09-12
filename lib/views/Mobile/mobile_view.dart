import 'package:flutter/material.dart';
import 'package:warehouse/views/Mobile/menu.dart';

class MobileView extends StatefulWidget {
  const MobileView({super.key});

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  @override
  Widget build(BuildContext context) {
    return const MobileMenu();
  }
}
