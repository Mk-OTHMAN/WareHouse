import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/Routes/rutes_name.dart';
import 'package:warehouse/buttomsheet/Toshiba/top_washer/add/add_1050.dart';
import 'package:warehouse/buttomsheet/Toshiba/top_washer/add/add_1150.dart';
import 'package:warehouse/buttomsheet/Toshiba/top_washer/add/add_1300.dart';
import 'package:warehouse/buttomsheet/Toshiba/top_washer/add/add_1500.dart';
import 'package:warehouse/buttomsheet/Toshiba/top_washer/add/add_1700.dart';
import 'package:warehouse/buttomsheet/Toshiba/top_washer/add/add_8460.dart';
import 'package:warehouse/buttomsheet/Toshiba/top_washer/sell/sell_1050.dart';
import 'package:warehouse/buttomsheet/Toshiba/top_washer/sell/sell_1150.dart';
import 'package:warehouse/buttomsheet/Toshiba/top_washer/sell/sell_1300.dart';
import 'package:warehouse/buttomsheet/Toshiba/top_washer/sell/sell_1500.dart';
import 'package:warehouse/buttomsheet/Toshiba/top_washer/sell/sell_1700.dart';
import 'package:warehouse/buttomsheet/Toshiba/top_washer/sell/sell_8460.dart';
import 'package:warehouse/custom/custom_add_sell_row.dart';
import 'package:warehouse/custom/navigationBar_forEditPage.dart';

// TopWasherToshibaEdit
class TopWasherToshibaEdit extends StatefulWidget {
  const TopWasherToshibaEdit({super.key});

  @override
  State<TopWasherToshibaEdit> createState() => _TopWasherToshibaEditState();
}

class _TopWasherToshibaEditState extends State<TopWasherToshibaEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomButtomNavigateForEditPage(
        frontColor: Colors.white70,
        backColor: Color(0xffFF735C),
        back: Routes.topWashe,
        home: Routes.home,
      ),
      // _____________ row body ___________________
      body: Row(children: [
        //  ________________ 1st container ________________
        Expanded(
            flex: 1,
            child: Container(
              color: const Color(0xffFF735C),
              // _____________ left side  ___________
              child: Column(children: [
                SizedBox(
                  height: 10.h,
                ),
                Text('Modifying',
                    style: GoogleFonts.rowdies(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                SizedBox(height: 1.h),
                Text('Now',
                    style: GoogleFonts.rowdies(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                SizedBox(height: 2.h),
                SizedBox(
                  width: 100.w,
                  height: 100.h,
                  child: Lottie.asset('Assets/lottie/down.json'),
                ),
                // _________- list text on left side ___________
                const Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Column(
                    children: [
                      //? ______   8460  ______
                      AddSellRow(
                          addShowButtomSheetName: Add8460(),
                          sellShowButtomSheetName: SellW8460(),
                          modelName: 'Washer 8460', //?---->8460
                          iconShape1: Icons.download,
                          iconSape2: Icons.upload),
                      //? ______   1050  ______
                      AddSellRow(
                          addShowButtomSheetName: Add1050(),
                          sellShowButtomSheetName: SellW1050(),
                          modelName: 'Washer 1050', //?---->1050
                          iconShape1: Icons.download,
                          iconSape2: Icons.upload),
                      //? ______   1150  ______
                      AddSellRow(
                          addShowButtomSheetName: Add1150(),
                          sellShowButtomSheetName: SellW1150(),
                          modelName: 'Washer 1150', //?---->1150
                          iconShape1: Icons.download,
                          iconSape2: Icons.upload),
                      //? ______   1300  ______
                      AddSellRow(
                          addShowButtomSheetName: Add1300(),
                          sellShowButtomSheetName: SellW1300(),
                          modelName: 'Washer 1300', //?---->1300
                          iconShape1: Icons.download,
                          iconSape2: Icons.upload),
                      //? ______   1500  ______
                      AddSellRow(
                          addShowButtomSheetName: Add1500(),
                          sellShowButtomSheetName: SellW1500(),
                          modelName: 'Washer 1500', //?---->1500
                          iconShape1: Icons.download,
                          iconSape2: Icons.upload),
                      //? ______   1700  ______
                      AddSellRow(
                          addShowButtomSheetName: Add1700(),
                          sellShowButtomSheetName: SellW1700(),
                          modelName: 'Washer 1700', //?---->1700
                          iconShape1: Icons.download,
                          iconSape2: Icons.upload),
                    ],
                  ),
                )
              ]),
            )),
        Expanded(
          flex: 3,
          // ignore: avoid_unnecessary_containers
          child: Container(
            height: 500.h,
            width: 200.w,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('Assets/idea_01-removebg-preview.png'),
                    fit: BoxFit.contain)),
          ),
        )
      ]),
    );
  }
}
