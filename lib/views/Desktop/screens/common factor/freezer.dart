import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:warehouse/Routes/rutes_name.dart';
import 'package:warehouse/custom/table/row_data._modelName.dart';
import 'package:warehouse/custom/table/row_data_keyBoxName.dart';
import 'package:warehouse/custom/table/table_body.dart';
import '../../../../custom/table/table_header.dart';

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
            const TableHeader(
              color1: 'SL',
              color2: 'CH',
            ),
            //! _________  freezer 18  ___________
            TableBody(
                modelName:
                    const RowDataModelName(componentName: 'Freezer Toshiba 18'),
                quantity: RowDataKeyBoxName(
                    keyBoxName: data.get('total18').toString()),
                color1KeyNme: RowDataKeyBoxName(
                    keyBoxName: data.get('color1').toString()),
                color2KeyName: RowDataKeyBoxName(
                    keyBoxName: data.get('color2').toString())),
            //!  ___________ freezer22  ______________
            TableBody(
                modelName:
                    const RowDataModelName(componentName: 'Freezer Toshiba 22'),
                quantity: RowDataKeyBoxName(
                    keyBoxName: data.get('freezer22Quantaty').toString()),
                color1KeyNme: RowDataKeyBoxName(
                    keyBoxName: data.get('freezer22color1').toString()),
                color2KeyName: RowDataKeyBoxName(
                    keyBoxName: data.get('freezer22color2').toString())),
          ],
        ));
  }
}
