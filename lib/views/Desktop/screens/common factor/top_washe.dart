import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:warehouse/Routes/rutes_name.dart';
import 'package:warehouse/custom/navigatin_Bar.dart';
import 'package:warehouse/custom/table/row_data._modelName.dart';
import 'package:warehouse/custom/table/row_data_keyBoxName.dart';
import 'package:warehouse/custom/table/table_body.dart';
import 'package:warehouse/custom/table/table_header.dart';

class TopWasheScreen extends StatefulWidget {
  const TopWasheScreen({super.key});

  @override
  State<TopWasheScreen> createState() => _TopWasheScreenState();
}

class _TopWasheScreenState extends State<TopWasheScreen> {
  Box data = Hive.box('data');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const CustomButtomNavigate(
            frontColor: Colors.white70,
            backColor: Colors.blue,
            back: Routes.toshiba,
            home: Routes.home,
            pageEdit: Routes.topWasheToshibaEdit),
        body: ListView(
          children: [
            const TableHeader(
              color1: 'WH',
              color2: 'SL',
            ),
            //? ________   8460  ________
            TableBody(
                modelName: const RowDataModelName(componentName: '8460'),
                quantity: RowDataKeyBoxName(
                    keyBoxName: data.get('total8460').toString()),
                color1KeyNme: RowDataKeyBoxName(
                    keyBoxName: data.get('8460color1').toString()),
                color2KeyName: RowDataKeyBoxName(
                    keyBoxName: data.get('8460color2').toString())),
            //?  _______ 1050 _______
            TableBody(
                modelName: const RowDataModelName(componentName: '1050'),
                quantity: RowDataKeyBoxName(
                    keyBoxName: data.get('total1050').toString()),
                color1KeyNme: RowDataKeyBoxName(
                    keyBoxName: data.get('1050color1').toString()),
                color2KeyName: RowDataKeyBoxName(
                    keyBoxName: data.get('1050color2').toString())),
            //?  _______ 1150 _______
            TableBody(
                modelName: const RowDataModelName(componentName: '1150'),
                quantity: RowDataKeyBoxName(
                    keyBoxName: data.get('total1150').toString()),
                color1KeyNme: RowDataKeyBoxName(
                    keyBoxName: data.get('1150color1').toString()),
                color2KeyName: RowDataKeyBoxName(
                    keyBoxName: data.get('1150color2').toString())),
            //? _______ 1300 ________
            TableBody(
                modelName: const RowDataModelName(componentName: '1300'),
                quantity: RowDataKeyBoxName(
                    keyBoxName: data.get('total1300').toString()),
                color1KeyNme: RowDataKeyBoxName(
                    keyBoxName: data.get('1300color1').toString()),
                color2KeyName: RowDataKeyBoxName(
                    keyBoxName: data.get('1300color2').toString())),
            //?  ______ 1500 _________
            TableBody(
                modelName: const RowDataModelName(componentName: '1500'),
                quantity: RowDataKeyBoxName(
                    keyBoxName: data.get('total1500').toString()),
                color1KeyNme: RowDataKeyBoxName(
                    keyBoxName: data.get('1500color1').toString()),
                color2KeyName: RowDataKeyBoxName(
                    keyBoxName: data.get('1500color2').toString())),
            //?  ________  1700   _______
            TableBody(
                modelName: const RowDataModelName(componentName: '1700'),
                quantity: RowDataKeyBoxName(
                    keyBoxName: data.get('total1700').toString()),
                color1KeyNme: RowDataKeyBoxName(
                    keyBoxName: data.get('1700color1').toString()),
                color2KeyName: RowDataKeyBoxName(
                    keyBoxName: data.get('1700color2').toString())),
          ],
        ));
  }
}
