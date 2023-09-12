import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ItemModelData extends StatelessWidget {
  String modelName;
  String modelColorOne;
  String modelColorTwo;
  int totalQuantaty;
  int colorOneQuantaty;
  int colorTwoQuantaty;

  ItemModelData(
      {super.key,
      required this.modelName,
      required this.totalQuantaty,
      required this.modelColorOne,
      required this.modelColorTwo,
      required this.colorOneQuantaty,
      required this.colorTwoQuantaty});
  Box data = Hive.box('data');

  @override
  Widget build(BuildContext context) {
    double W = MediaQuery.of(context).size.width;
    double H = MediaQuery.of(context).size.height;
    return Row(
      children: [
        // **************** Model Name Container *******************
        Container(
          width: W / 3,
          height: H / 15,
          decoration: BoxDecoration(
              border:
                  Border.all(style: BorderStyle.solid, color: Colors.black)),
          child: Center(
            child: Text(
              modelName,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),

        // ***************  Model Quntaty Container  ******************

        Container(
          width: W / 3,
          height: H / 15,
          decoration: BoxDecoration(
              border:
                  Border.all(style: BorderStyle.solid, color: Colors.black)),
          child: Center(
            child: Text(
              '$totalQuantaty',
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),

        //  *****************  Color Item Container **************

        Container(
            width: W / 3,
            height: H / 15,
            decoration: BoxDecoration(
                border:
                    Border.all(style: BorderStyle.solid, color: Colors.black)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // ___________ Avilabel color Numbers _________
                Center(
                  child: Text(
                    '$modelColorOne : $colorOneQuantaty',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                // ___________  contiue Avilabel color Numbers __________
                Center(
                  child: Text(
                    '$modelColorTwo : $colorTwoQuantaty',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
