import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:warehouse/Routes/rutes_name.dart';
import 'package:warehouse/custom/table/row_data._modelName.dart';
import 'package:warehouse/custom/table/row_data_keyBoxName.dart';
import 'package:warehouse/custom/table/table_body.dart';
import 'package:warehouse/custom/table/table_header.dart';

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
                  Navigator.of(context).pushNamed(Routes.refrigatorToshipaEdit);
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
            const TableHeader(
              color1: 'SL',
              color2: 'CH',
            ),
            //! ______  ref 33T  _____
            TableBody(
                modelName: const RowDataModelName(componentName: 'Toshiba 33T'),
                quantity: RowDataKeyBoxName(
                    keyBoxName: data.get('total33T').toString()),
                color1KeyNme: RowDataKeyBoxName(
                    keyBoxName: data.get('33Tcolor1').toString()),
                color2KeyName: RowDataKeyBoxName(
                    keyBoxName: data.get('33Tcolor2').toString())),
            //!  ________  ref 37  ___________
            TableBody(
                modelName: const RowDataModelName(componentName: 'Toshiba 37'),
                quantity: RowDataKeyBoxName(
                    keyBoxName: data.get('total37').toString()),
                color1KeyNme: RowDataKeyBoxName(
                    keyBoxName: data.get('37color1').toString()),
                color2KeyName: RowDataKeyBoxName(
                    keyBoxName: data.get('37color2').toString())),
            //! ________  ref 37J  ____________
            TableBody(
                modelName: const RowDataModelName(componentName: 'Toshiba 37J'),
                quantity: RowDataKeyBoxName(
                    keyBoxName: data.get('total37J').toString()),
                color1KeyNme: RowDataKeyBoxName(
                    keyBoxName: data.get('37Jcolor1').toString()),
                color2KeyName: RowDataKeyBoxName(
                    keyBoxName: data.get('37Jcolor2').toString())),
            //! ________ ref 40pt __________
            TableBody(
                modelName:
                    const RowDataModelName(componentName: 'Toshiba 40PT'),
                quantity: RowDataKeyBoxName(
                    keyBoxName: data.get('total40pt').toString()),
                color1KeyNme: RowDataKeyBoxName(
                    keyBoxName: data.get('40ptcolor1').toString()),
                color2KeyName: RowDataKeyBoxName(
                    keyBoxName: data.get('40ptcolor2').toString())),
            //!  __________  ref 40pr  ______________
            TableBody(
                modelName:
                    const RowDataModelName(componentName: 'Toshiba 40PR'),
                quantity: RowDataKeyBoxName(
                    keyBoxName: data.get('total40pr').toString()),
                color1KeyNme: RowDataKeyBoxName(
                    keyBoxName: data.get('40prcolor1').toString()),
                color2KeyName: RowDataKeyBoxName(
                    keyBoxName: data.get('40prcolor2').toString())),
            //!  __________  ref 40pj ______________
            TableBody(
                modelName:
                    const RowDataModelName(componentName: 'Toshiba 40PJ'),
                quantity: RowDataKeyBoxName(
                    keyBoxName: data.get('total40pj').toString()),
                color1KeyNme: RowDataKeyBoxName(
                    keyBoxName: data.get('40pjcolor1').toString()),
                color2KeyName: RowDataKeyBoxName(
                    keyBoxName: data.get('40pjcolor2').toString())),
            //!  __________  ref 40ph ______________
            TableBody(
                modelName:
                    const RowDataModelName(componentName: 'Toshiba 40PH'),
                quantity: RowDataKeyBoxName(
                    keyBoxName: data.get('total40ph').toString()),
                color1KeyNme: RowDataKeyBoxName(
                    keyBoxName: data.get('40phcolor1').toString()),
                color2KeyName: RowDataKeyBoxName(
                    keyBoxName: data.get('40phcolor2').toString())),
            //!  __________  ref 51 ______________
            TableBody(
                modelName: const RowDataModelName(componentName: 'Toshiba 51'),
                quantity: RowDataKeyBoxName(
                    keyBoxName: data.get('total51').toString()),
                color1KeyNme: RowDataKeyBoxName(
                    keyBoxName: data.get('51color1').toString()),
                color2KeyName: RowDataKeyBoxName(
                    keyBoxName: data.get('51color2').toString())),
            //!  __________  ref 56 ______________
            TableBody(
                modelName: const RowDataModelName(componentName: 'Toshiba 56'),
                quantity: RowDataKeyBoxName(
                    keyBoxName: data.get('total56').toString()),
                color1KeyNme: RowDataKeyBoxName(
                    keyBoxName: data.get('56color1').toString()),
                color2KeyName: RowDataKeyBoxName(
                    keyBoxName: data.get('56color2').toString())),
          ],
        ));
  }
}
