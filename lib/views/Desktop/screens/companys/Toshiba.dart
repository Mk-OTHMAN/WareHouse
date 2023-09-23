import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:warehouse/Routes/rutes_name.dart';
import 'package:warehouse/custom/custom_outlinebutton.dart';
import 'package:lottie/lottie.dart';

class Toshipa extends StatelessWidget {
  const Toshipa({super.key});

  @override
  Widget build(BuildContext context) {
    double W = MediaQuery.of(context).size.width;
    double H = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: const Color(0xff0759A7),

        // _____________  Buttom Navigation Bar   ________________________
        bottomNavigationBar: CurvedNavigationBar(
            // height: 30,
            buttonBackgroundColor: Colors.white70,
            color: Colors.white70,
            backgroundColor: const Color(0xff0759A7),
            items: const [
              Icon(Icons.home),
            ],
            onTap: (value) {
              if (value == 0) {
                Navigator.of(context).pushNamed(Routes.home);
              }
            }),

        // ________________ Body ____________

        body: Row(
          children: [
            SizedBox(
              width: 170.w,
              height: 400.h,
              child: Lottie.asset('Assets/lottie/Sun.json'),
            ),
            // __________ Column for outline Button items __________
            Column(
              children: [
                SizedBox(height: 50.h),
                Text(
                  'Toshiba',
                  style: GoogleFonts.laila(
                      color: Colors.black,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30.h),
                // ________ item 1 < freezer > ___________
                CustomOutlineButton(
                    buttonName: 'Freezer',
                    pagePath: Routes.freezer,
                    buttonColor: Colors.white,
                    fontSize: 5.sp,
                    fontColor: Colors.white,
                    width: 40.w,
                    height: 30.h),
                SizedBox(
                  height: 20.h,
                ),

                // ________ item 2 < Refrigerato > ___________
                CustomOutlineButton(
                    buttonName: 'Refrigerator',
                    pagePath: Routes.refrigerator,
                    buttonColor: Colors.white,
                    fontSize: 5.sp,
                    fontColor: Colors.white,
                    width: 60.w,
                    height: 30.h),
                SizedBox(
                  height: 20.h,
                ),

                // ________ item 3 < Top Washe > ___________
                CustomOutlineButton(
                    buttonName: 'Top Washe',
                    pagePath: Routes.topWashe,
                    buttonColor: Colors.white,
                    fontSize: 5.sp,
                    fontColor: Colors.white,
                    width: 60.w,
                    height: 30.h),
                SizedBox(
                  height: 20.h,
                ),

                // ________ item 3 < Half Washe > ___________
                CustomOutlineButton(
                    buttonName: 'Half Washe',
                    pagePath: Routes.halfeWashe,
                    buttonColor: Colors.white,
                    fontSize: 5.sp,
                    fontColor: Colors.white,
                    width: 60.w,
                    height: 30.h),
              ],
            ),
          ],
        ));
  }
}
