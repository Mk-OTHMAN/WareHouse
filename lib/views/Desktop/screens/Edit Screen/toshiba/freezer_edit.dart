import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/Routes/rutes_name.dart';
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD

=======
>>>>>>> 6359593 (create half washer files)
=======
>>>>>>> 60bde77 (test)
=======

>>>>>>> 58a8622 (edit)
import 'package:warehouse/buttomsheet/Toshiba/Freezer/Add/add_deep18.dart';
import 'package:warehouse/buttomsheet/Toshiba/Freezer/Add/add_deep22.dart';
import 'package:warehouse/buttomsheet/Toshiba/Freezer/Sell/sell_deep18.dart';
import 'package:warehouse/buttomsheet/Toshiba/Freezer/Sell/sell_deep22.dart';
<<<<<<< HEAD
<<<<<<< HEAD

=======
>>>>>>> 60bde77 (test)
=======

>>>>>>> 58a8622 (edit)
import 'package:warehouse/custom/custom_add_sell_row.dart';

class FreezerToshibaEdit extends StatefulWidget {
  const FreezerToshibaEdit({super.key});

  @override
  State<FreezerToshibaEdit> createState() => _FreezerToshibaEditState();
}

class _FreezerToshibaEditState extends State<FreezerToshibaEdit> {
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
              Navigator.of(context).pushNamed(Routes.freezer);
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
                const Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Column(
                    children: [
                      AddSellRow(
                          addShowButtomSheetName: AddDeep18(),
                          sellShowButtomSheetName: SellDeep18(),
                          modelName: 'Freezer18',
                          iconShape1: Icons.download,
                          iconSape2: Icons.upload),
                      AddSellRow(
                          addShowButtomSheetName: AddDeep22(),
                          sellShowButtomSheetName: SellDeep22(),
                          modelName: 'Freezer22',
                          iconShape1: Icons.download,
                          iconSape2: Icons.upload)
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
