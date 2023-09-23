import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:warehouse/Routes/rutes_name.dart';
import 'package:warehouse/custom/custom_model.dart';
import 'package:warehouse/custom/header_tabel.dart';

class FreezerScreen extends StatefulWidget {
  const FreezerScreen({super.key});
  @override
  State<FreezerScreen> createState() => _FreezerScreenState();
}

class _FreezerScreenState extends State<FreezerScreen> {
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
                  Navigator.of(context).pushNamed(Routes.freezerToshipaEdit);
                }
              });
            },
            items: const [
              Icon(Icons.arrow_back_ios),
              Icon(Icons.home),
              Icon(Icons.edit),
            ]),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const CustomHeaderTabel(),

            ItemModelData(
                modelName: 'DeepFreezer 22',
                totalQuantaty: data.get('freezer22Quantaty'),
                modelColorOne: 'SL',
                modelColorTwo: 'CH',
                colorOneQuantaty: data.get('freezer22color1'),
                colorTwoQuantaty: data.get('freezer22color2')),
            // ______ deepfreezer 18 _______

            ItemModelData(
                modelName: 'DeepFreezer 18',
                totalQuantaty: data.get('total18'),
                modelColorOne: 'SL',
                modelColorTwo: 'CH',
                colorOneQuantaty: data.get('color1'),
                colorTwoQuantaty: data.get('color2')),
          ],
        ));
  }
}
