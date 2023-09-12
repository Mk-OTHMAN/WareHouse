import 'package:flutter/material.dart';
import 'package:warehouse/custom/custom_model.dart';
import 'package:warehouse/custom/header_tabel.dart';

class TopWasheScreen extends StatefulWidget {
  const TopWasheScreen({super.key});

  @override
  State<TopWasheScreen> createState() => _TopWasheScreenState();
}

class _TopWasheScreenState extends State<TopWasheScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        const CustomHeaderTabel(),

        //  ______________ 8460  ___________
        ItemModelData(
            modelName: 'Tosiba 8460',
            totalQuantaty: 0,
            modelColorOne: 'WH',
            modelColorTwo: 'SL',
            colorOneQuantaty: 0,
            colorTwoQuantaty: 0),

        //  ______________ 1050  ___________
        ItemModelData(
            modelName: 'Tosiba 1050',
            totalQuantaty: 0,
            modelColorOne: 'WH',
            modelColorTwo: 'SL',
            colorOneQuantaty: 0,
            colorTwoQuantaty: 0),

        //  ______________ 1150  ___________
        ItemModelData(
            modelName: 'Tosiba 1150',
            totalQuantaty: 0,
            modelColorOne: 'WH',
            modelColorTwo: 'SL',
            colorOneQuantaty: 0,
            colorTwoQuantaty: 0),

        //  ______________ 8460  ___________
        ItemModelData(
            modelName: 'Tosiba 13',
            totalQuantaty: 0,
            modelColorOne: 'WH',
            modelColorTwo: 'SL',
            colorOneQuantaty: 0,
            colorTwoQuantaty: 0),

        //  ______________ 15  ___________
        ItemModelData(
            modelName: 'Tosiba 15',
            totalQuantaty: 0,
            modelColorOne: 'WH',
            modelColorTwo: 'SL',
            colorOneQuantaty: 0,
            colorTwoQuantaty: 0),

        //  ______________ 17  ___________
        ItemModelData(
            modelName: 'Tosiba 17',
            totalQuantaty: 0,
            modelColorOne: 'WH',
            modelColorTwo: 'SL',
            colorOneQuantaty: 0,
            colorTwoQuantaty: 0),
      ],
    ));
  }
}
