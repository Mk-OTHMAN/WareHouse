import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:warehouse/Routes/rutes_name.dart';
import 'package:warehouse/custom/custom_model.dart';
import 'package:warehouse/custom/header_tabel.dart';

class RefrigeratorScreen extends StatefulWidget {
  const RefrigeratorScreen({super.key});

  @override
  State<RefrigeratorScreen> createState() => _RefrigeratorScreenState();
}

class _RefrigeratorScreenState extends State<RefrigeratorScreen> {
  Box data = Hive.box('data');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
            height: 40.h,
            buttonBackgroundColor: Colors.white70,
            color: Colors.blue,
            backgroundColor: Colors.white,
            onTap: (value) {
              setState(() {
                if (value == 1) {
                  Navigator.of(context).pushNamed(Routes.home);
                } else if (value == 0) {
                  Navigator.of(context).pushNamed(Routes.toshiba);
                } else if (value == 2) {
                  Navigator.of(context).pushNamed(Routes.RefrigatorToshipaEdit);
                }
              });
            },
            items: const [
              Icon(Icons.arrow_back_ios),
              Icon(Icons.home),
              Icon(Icons.edit),
            ]),
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            const CustomHeaderTabel(),
            // ______________ 33T Model ______________
            ItemModelData(
                modelName: 'Toshiba 33T',
                totalQuantaty: data.get('total33T'),
                modelColorOne: 'SL',
                modelColorTwo: 'CH',
                colorOneQuantaty: data.get('33Tcolor1'),
                colorTwoQuantaty: data.get('33Tcolor2')),

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
