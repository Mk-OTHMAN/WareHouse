import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddSellRow extends StatelessWidget {
  Widget addShowButtomSheetName;
  Widget sellShowButtomSheetName;
  String modelName;
  IconData iconShape1;
  IconData iconSape2;

  AddSellRow(
      {super.key,
      required this.addShowButtomSheetName,
      required this.sellShowButtomSheetName,
      required this.modelName,
      required this.iconShape1,
      required this.iconSape2});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 35.w,
          child: Text(
            modelName,
            style: TextStyle(fontSize: 5.sp, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          width: 20.w,
        ),
        IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return addShowButtomSheetName;
                  },
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100),
                        topRight: Radius.circular(100)),
                  ));
            },
            icon: Icon(
              iconShape1,
              size: 25,
            )),
        IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return sellShowButtomSheetName;
                  },
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100),
                        topRight: Radius.circular(100)),
                  ));
            },
            icon: Icon(
              iconSape2,
              size: 25,
            ))
      ],
    );
  }
}
