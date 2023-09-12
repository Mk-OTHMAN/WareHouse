import 'package:flutter/material.dart';
import 'package:warehouse/custom/custom_model.dart';
import 'package:warehouse/custom/header_tabel.dart';

class HalfWasheScreen extends StatelessWidget {
  const HalfWasheScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        const CustomHeaderTabel(),
        //  ___________   720  __________________
        ItemModelData(
            modelName: 'Toshiba 720',
            totalQuantaty: 0,
            modelColorOne: 'WH',
            modelColorTwo: 'None',
            colorOneQuantaty: 0,
            colorTwoQuantaty: 0),

        //  ___________   720p  __________________
        ItemModelData(
            modelName: 'Toshiba 720p',
            totalQuantaty: 0,
            modelColorOne: 'WH',
            modelColorTwo: 'None',
            colorOneQuantaty: 0,
            colorTwoQuantaty: 0),

        //  ___________   1000  __________________
        ItemModelData(
            modelName: 'Toshiba 1000',
            totalQuantaty: 0,
            modelColorOne: 'WH',
            modelColorTwo: 'None',
            colorOneQuantaty: 0,
            colorTwoQuantaty: 0),

        //  ___________   1000P  __________________
        ItemModelData(
            modelName: 'Toshiba 1000P',
            totalQuantaty: 0,
            modelColorOne: 'WH',
            modelColorTwo: 'None',
            colorOneQuantaty: 0,
            colorTwoQuantaty: 0),

        //  ___________   1210S  __________________
        ItemModelData(
            modelName: 'Toshiba 1210S',
            totalQuantaty: 0,
            modelColorOne: 'WH',
            modelColorTwo: 'None',
            colorOneQuantaty: 0,
            colorTwoQuantaty: 0),

        //  ___________   1210SP  __________________
        ItemModelData(
            modelName: 'Toshiba 1210SP',
            totalQuantaty: 0,
            modelColorOne: 'WH',
            modelColorTwo: 'None',
            colorOneQuantaty: 0,
            colorTwoQuantaty: 0),
      ],
    ));
  }
}
