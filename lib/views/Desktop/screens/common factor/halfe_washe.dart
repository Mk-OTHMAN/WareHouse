import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:warehouse/Routes/rutes_name.dart';
import 'package:warehouse/custom/table/row_data_keyBoxName.dart';
import 'package:warehouse/custom/table_without_color/body.dart';
import 'package:warehouse/custom/table_without_color/header.dart';
import 'package:warehouse/custom/table_without_color/row_data_pading.dart';

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
            TableBodyNoColor(
                modelName: const RowDataModelNamePading(componentName: '720'),
                quantity: RowDataKeyBoxName(
                    keyBoxName: data.get('total720').toString())),

            //!  ___________ 720p  ______________
            TableBodyNoColor(
                modelName: const RowDataModelNamePading(componentName: '720P'),
                quantity: RowDataKeyBoxName(
                    keyBoxName: data.get('total720p').toString())),
            //!  ___________ 1000  ______________
            TableBodyNoColor(
                modelName: const RowDataModelNamePading(componentName: '1000'),
                quantity: RowDataKeyBoxName(
                    keyBoxName: data.get('total1000').toString())),
            //!  ___________ 1000p  ______________
            TableBodyNoColor(
                modelName: const RowDataModelNamePading(componentName: '1000P'),
                quantity: RowDataKeyBoxName(
                    keyBoxName: data.get('total1000p').toString())),
            //!  ___________ 1210s ______________
            TableBodyNoColor(
                modelName: const RowDataModelNamePading(componentName: '1210S'),
                quantity: RowDataKeyBoxName(
                    keyBoxName: data.get('total1210s').toString())),
            //!  ___________ 1210sp  ______________
            TableBodyNoColor(
                modelName:
                    const RowDataModelNamePading(componentName: '1210SP'),
                quantity: RowDataKeyBoxName(
                    keyBoxName: data.get('total1210sp').toString())),
          ],
        ));
  }
}
