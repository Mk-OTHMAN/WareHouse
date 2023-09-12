import 'package:flutter/material.dart';

class CustomHeaderTabel extends StatelessWidget {
  const CustomHeaderTabel({super.key});

  @override
  Widget build(BuildContext context) {
    double W = MediaQuery.of(context).size.width;
    double H = MediaQuery.of(context).size.height;
    return Row(
      children: [
        // **************** Model Name Container *******************
        Container(
          width: W / 3,
          height: H * 0.10,
          decoration: BoxDecoration(
              color: Colors.red,
              border:
                  Border.all(style: BorderStyle.solid, color: Colors.black)),
          child: const Center(
            child: Text(
              'Model Name',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ),

        // ***************  Model Quntaty Container  ******************

        Container(
          width: W / 3,
          height: H * 0.10,
          decoration: BoxDecoration(
              color: Colors.amber,
              border:
                  Border.all(style: BorderStyle.solid, color: Colors.black)),
          child: const Center(
            child: Text(
              ' QUANTATY ',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ),

        //  *****************  Color Item Container **************

        Container(
            width: W / 3,
            height: H * 0.10,
            decoration: BoxDecoration(
                color: Colors.green,
                border:
                    Border.all(style: BorderStyle.solid, color: Colors.black)),
            child: const Center(
              child: Text(
                ' Colors Avilabel From Model ',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            )),
      ],
    );
  }
}
