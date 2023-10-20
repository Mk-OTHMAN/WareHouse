import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:warehouse/Routes/rutes_name.dart';
import 'package:warehouse/custom/table/row_data._modelName.dart';
import 'package:warehouse/custom/table/row_data_keyBoxName.dart';
import 'package:warehouse/custom/table/table_body.dart';
import 'package:warehouse/custom/table_without_color/header.dart';
import '../../../../custom/table/table_header.dart';

class HalfWasheScreen extends StatefulWidget {
  const HalfWasheScreen({super.key});
  @override
  State<HalfWasheScreen> createState() => _HalfWasheScreenState();
}

class _HalfWasheScreenState extends State<HalfWasheScreen> {
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
                  Navigator.of(context).pushNamed(Routes.halfeWasheToshibaEdit);
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
            const TableHeaderNoColor(),
            //! _________  720  ___________
            TableBody(
                modelName: const RowDataModelName(componentName: 'Toshiba 720'),
                quantity: RowDataKeyBoxName(
                    keyBoxName: data.get('total720').toString()),
                color1KeyNme: RowDataKeyBoxName(
                    keyBoxName: data.get('720color1').toString()),
                color2KeyName: RowDataKeyBoxName(
                    keyBoxName: data.get('720color2').toString())),
            //!  ___________ 720p  ______________
            TableBody(
                modelName:
                    const RowDataModelName(componentName: 'Toshiba 720P'),
                quantity: RowDataKeyBoxName(
                    keyBoxName: data.get('total720p').toString()),
                color1KeyNme: RowDataKeyBoxName(
                    keyBoxName: data.get('720pcolor1').toString()),
                color2KeyName: RowDataKeyBoxName(
                    keyBoxName: data.get('720pcolor2').toString())),
            //!  ___________ 1000  ______________
            TableBody(
                modelName:
                    const RowDataModelName(componentName: 'Toshiba 1000'),
                quantity: RowDataKeyBoxName(
                    keyBoxName: data.get('total1000').toString()),
                color1KeyNme: RowDataKeyBoxName(
                    keyBoxName: data.get('1000color1').toString()),
                color2KeyName: RowDataKeyBoxName(
                    keyBoxName: data.get('1000color2').toString())),
            //!  ___________ 1000p  ______________
            TableBody(
                modelName:
                    const RowDataModelName(componentName: 'Toshiba 1000P'),
                quantity: RowDataKeyBoxName(
                    keyBoxName: data.get('total1000p').toString()),
                color1KeyNme: RowDataKeyBoxName(
                    keyBoxName: data.get('1000pcolor1').toString()),
                color2KeyName: RowDataKeyBoxName(
                    keyBoxName: data.get('1000pcolor2').toString())),
            //!  ___________ 1210s ______________
            TableBody(
                modelName:
                    const RowDataModelName(componentName: 'Toshiba 1210S'),
                quantity: RowDataKeyBoxName(
                    keyBoxName: data.get('total1210s').toString()),
                color1KeyNme: RowDataKeyBoxName(
                    keyBoxName: data.get('1210scolor1').toString()),
                color2KeyName: RowDataKeyBoxName(
                    keyBoxName: data.get('1210scolor2').toString())),
            //!  ___________ 1210sp  ______________
            TableBody(
                modelName:
                    const RowDataModelName(componentName: 'Toshiba 1210Sp'),
                quantity: RowDataKeyBoxName(
                    keyBoxName: data.get('total1210sp').toString()),
                color1KeyNme: RowDataKeyBoxName(
                    keyBoxName: data.get('1210spcolor1').toString()),
                color2KeyName: RowDataKeyBoxName(
                    keyBoxName: data.get('1210spcolor2s').toString())),
          ],
        ));
  }
}
