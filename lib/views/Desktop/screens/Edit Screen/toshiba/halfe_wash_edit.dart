import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/Routes/rutes_name.dart';
<<<<<<< HEAD
=======
import 'package:warehouse/buttomsheet/Toshiba/Freezer/Add/add_deep22.dart';
import 'package:warehouse/buttomsheet/Toshiba/Freezer/Sell/sell_deep22.dart';
>>>>>>> 6359593 (create half washer files)
import 'package:warehouse/buttomsheet/Toshiba/Half_Washe/Add/add_1000p.dart';
import 'package:warehouse/buttomsheet/Toshiba/Half_Washe/Add/add_1210s.dart';
import 'package:warehouse/buttomsheet/Toshiba/Half_Washe/Add/add_1210sp.dart';
import 'package:warehouse/buttomsheet/Toshiba/Half_Washe/Add/add_w1000.dart';
import 'package:warehouse/buttomsheet/Toshiba/Half_Washe/Add/add_w720p.dart';
import 'package:warehouse/buttomsheet/Toshiba/Half_Washe/Add/add_washer_720.dart';
import 'package:warehouse/buttomsheet/Toshiba/Half_Washe/Sell/sell_1000.dart';
import 'package:warehouse/buttomsheet/Toshiba/Half_Washe/Sell/sell_1000p.dart';
import 'package:warehouse/buttomsheet/Toshiba/Half_Washe/Sell/sell_1210s.dart';
import 'package:warehouse/buttomsheet/Toshiba/Half_Washe/Sell/sell_1210sp.dart';
import 'package:warehouse/buttomsheet/Toshiba/Half_Washe/Sell/sell_720p.dart';
import 'package:warehouse/buttomsheet/Toshiba/Half_Washe/Sell/sell_washer_720.dart';
import 'package:warehouse/custom/custom_add_sell_row.dart';

class HalfWasheEdit extends StatefulWidget {
  const HalfWasheEdit({super.key});

  @override
  State<HalfWasheEdit> createState() => _HalfWasheEditState();
}

class _HalfWasheEditState extends State<HalfWasheEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          height: 40.h,
          buttonBackgroundColor: Colors.white70,
          color: Colors.white70,
          backgroundColor: const Color(0xffFF735C),
          items: const [
            Icon(Icons.arrow_back_ios_new),
            Icon(Icons.home),
          ],
          onTap: (value) {
            if (value == 1) {
              Navigator.of(context).pushNamed(Routes.home);
            } else if (value == 0) {
              Navigator.of(context).pushNamed(Routes.halfeWashe);
            }
          }),
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
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Column(
                    children: [
                      AddSellRow(
                          addShowButtomSheetName: const AddWsher720(),
                          sellShowButtomSheetName: const SellW720(),
                          modelName: 'Washer 720', //?---->720
                          iconShape1: Icons.download,
                          iconSape2: Icons.upload),
                      AddSellRow(
                          addShowButtomSheetName: const AddWsher720p(),
                          sellShowButtomSheetName: const SellW720P(),
                          modelName: 'Washer 720p', //? ------> 720p
                          iconShape1: Icons.download,
                          iconSape2: Icons.upload),
                      AddSellRow(
                          addShowButtomSheetName: const AddWsher1000(),
                          sellShowButtomSheetName: const SellW1000(),
                          modelName: 'Washer 1000', //? ---->1000
                          iconShape1: Icons.download,
                          iconSape2: Icons.upload),
                      AddSellRow(
                          addShowButtomSheetName: const AddWsher1000p(),
                          sellShowButtomSheetName: const SellW1000p(),
                          modelName: 'Washer 1000p', //? ---->1000p
                          iconShape1: Icons.download,
                          iconSape2: Icons.upload),
                      AddSellRow(
                          addShowButtomSheetName: const AddWsher1210s(),
                          sellShowButtomSheetName: const SellW1210s(),
                          modelName: 'Washer 1210S', //? ---->1210s
                          iconShape1: Icons.download,
                          iconSape2: Icons.upload),
                      AddSellRow(
                          addShowButtomSheetName: const AddWsher1210sp(),
                          sellShowButtomSheetName: const SellW1210sp(),
                          modelName: 'Washer 1210Sp', //? ----> 1210sp
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
