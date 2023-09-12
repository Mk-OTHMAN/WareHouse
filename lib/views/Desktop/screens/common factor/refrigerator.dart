import 'package:flutter/material.dart';
import 'package:warehouse/custom/custom_model.dart';
import 'package:warehouse/custom/header_tabel.dart';

class RefrigeratorScreen extends StatefulWidget {
  const RefrigeratorScreen({super.key});

  @override
  State<RefrigeratorScreen> createState() => _RefrigeratorScreenState();
}

class _RefrigeratorScreenState extends State<RefrigeratorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigo,
        body: ListView(
          children: [
            const CustomHeaderTabel(),
            // ______________ 33T Model ______________
            ItemModelData(
                modelName: 'Toshiba 33T',
                totalQuantaty: 0,
                modelColorOne: 'SL',
                modelColorTwo: 'CH',
                colorOneQuantaty: 0,
                colorTwoQuantaty: 0),

            //  ________________ 37  _____________________

            ItemModelData(
                modelName: 'Toshiba 37',
                totalQuantaty: 0,
                modelColorOne: 'SL',
                modelColorTwo: 'CH',
                colorOneQuantaty: 0,
                colorTwoQuantaty: 0),

            //  ________________ 37J  _____________________

            ItemModelData(
                modelName: 'Toshiba 37J',
                totalQuantaty: 0,
                modelColorOne: 'SL',
                modelColorTwo: 'CH',
                colorOneQuantaty: 0,
                colorTwoQuantaty: 0),

            //  _____________ 40PT ________________

            ItemModelData(
                modelName: 'Toshiba 40PT',
                totalQuantaty: 0,
                modelColorOne: 'SL',
                modelColorTwo: 'CH',
                colorOneQuantaty: 0,
                colorTwoQuantaty: 0),

            //  ________________ 40PR  _____________________

            ItemModelData(
                modelName: 'Toshiba 40PR',
                totalQuantaty: 0,
                modelColorOne: 'SL',
                modelColorTwo: 'CH',
                colorOneQuantaty: 0,
                colorTwoQuantaty: 0),

            //  ________________ 40PJ  _____________________

            ItemModelData(
                modelName: 'Toshiba 40PJ',
                totalQuantaty: 0,
                modelColorOne: 'SL',
                modelColorTwo: 'CH',
                colorOneQuantaty: 0,
                colorTwoQuantaty: 0),

            //  ________________ 40PH  _____________________

            ItemModelData(
                modelName: 'Toshiba 40PH',
                totalQuantaty: 0,
                modelColorOne: 'SL',
                modelColorTwo: 'CH',
                colorOneQuantaty: 0,
                colorTwoQuantaty: 0),

            //  ________________ 45  _____________________

            ItemModelData(
                modelName: 'Toshiba 45',
                totalQuantaty: 0,
                modelColorOne: 'SL',
                modelColorTwo: 'CH',
                colorOneQuantaty: 0,
                colorTwoQuantaty: 0),

            //  ________________ 51  _____________________

            ItemModelData(
                modelName: 'Toshiba 51',
                totalQuantaty: 0,
                modelColorOne: 'SL',
                modelColorTwo: 'CH',
                colorOneQuantaty: 0,
                colorTwoQuantaty: 0),

            //  ________________ 56  _____________________

            ItemModelData(
                modelName: 'Toshiba 56',
                totalQuantaty: 0,
                modelColorOne: 'SL',
                modelColorTwo: 'CH',
                colorOneQuantaty: 0,
                colorTwoQuantaty: 0),
          ],
        ));
  }
}
