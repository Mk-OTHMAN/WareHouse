import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/Routes/rutes_name.dart';
import 'package:warehouse/custom/buttomsheet/deep_18.dart';
import 'package:warehouse/custom/buttomsheet/deep_22.dart';
import 'package:warehouse/custom/buttomsheet/toshiba33T.dart';

class RefrigatorToshipaEdit extends StatefulWidget {
  const RefrigatorToshipaEdit({super.key});

  @override
  State<RefrigatorToshipaEdit> createState() => _RefrigatorToshipaEditState();
}

class _RefrigatorToshipaEditState extends State<RefrigatorToshipaEdit> {
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
              Navigator.of(context).pushNamed(Routes.refrigerator);
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                        onPressed: () {
                          // ## Buttomsheet ..........
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return const Tosh33t();
                              },
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(100),
                                    topRight: Radius.circular(100)),
                              ));
                        },
                        child: Text(
                          'Toshiba 33T',
                          style: TextStyle(
                              fontSize: 5.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        )),
                    // _________ sizedBox __________
                    SizedBox(height: 7.h),
                    // ___________ secondtext ____________
                    TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return const DeepF18();
                              },
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(100),
                                    topRight: Radius.circular(100)),
                              ));
                        },
                        child: Text(
                          'Toshiba 37',
                          style: TextStyle(
                              fontSize: 5.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        )),
                    SizedBox(height: 7.h),
                    //! _______  37J ____________
                    TextButton(
                        onPressed: () {
                          // ## Buttomsheet ..........
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return const DeepF22();
                              },
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(100),
                                    topRight: Radius.circular(100)),
                              ));
                        },
                        child: Text(
                          'Toshiba 37J',
                          style: TextStyle(
                              fontSize: 5.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        )),
                    // _________ sizedBox __________
                    SizedBox(height: 7.h),
                    //!     _______ 40PT ________
                    TextButton(
                        onPressed: () {
                          // ## Buttomsheet ..........
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return const DeepF22();
                              },
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(100),
                                    topRight: Radius.circular(100)),
                              ));
                        },
                        child: Text(
                          'Toshiba 40PT',
                          style: TextStyle(
                              fontSize: 5.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        )),
                    // _________ sizedBox __________
                    SizedBox(height: 7.h),
                    //!    __________  40PR _________
                    TextButton(
                        onPressed: () {
                          // ## Buttomsheet ..........
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return const DeepF22();
                              },
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(100),
                                    topRight: Radius.circular(100)),
                              ));
                        },
                        child: Text(
                          'Toshiba 40PR',
                          style: TextStyle(
                              fontSize: 5.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        )),
                    // _________ sizedBox __________
                    SizedBox(height: 7.h),
                    //! _________  40PJ  __________
                    TextButton(
                        onPressed: () {
                          // ## Buttomsheet ..........
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return const DeepF22();
                              },
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(100),
                                    topRight: Radius.circular(100)),
                              ));
                        },
                        child: Text(
                          'Toshiba 40PJ',
                          style: TextStyle(
                              fontSize: 5.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        )),
                    // _________ sizedBox __________
                    SizedBox(height: 7.h),
                    //! _________  40PH  __________
                    TextButton(
                        onPressed: () {
                          // ## Buttomsheet ..........
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return const DeepF22();
                              },
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(100),
                                    topRight: Radius.circular(100)),
                              ));
                        },
                        child: Text(
                          'Toshiba 40PH',
                          style: TextStyle(
                              fontSize: 5.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        )),
                    // _________ sizedBox __________
                    SizedBox(height: 7.h),
                    //!  __________    45  __________
                    TextButton(
                        onPressed: () {
                          // ## Buttomsheet ..........
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return const DeepF22();
                              },
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(100),
                                    topRight: Radius.circular(100)),
                              ));
                        },
                        child: Text(
                          'Toshiba 45',
                          style: TextStyle(
                              fontSize: 5.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        )),
                    // _________ sizedBox __________
                    SizedBox(height: 7.h),
                    //!  _______ 51  ______
                    TextButton(
                        onPressed: () {
                          // ## Buttomsheet ..........
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return const DeepF22();
                              },
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(100),
                                    topRight: Radius.circular(100)),
                              ));
                        },
                        child: Text(
                          'Toshiba 51',
                          style: TextStyle(
                              fontSize: 5.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        )),
                    // _________ sizedBox __________
                    SizedBox(height: 7.h),
                    //!   _________   56  __________
                    TextButton(
                        onPressed: () {
                          // ## Buttomsheet ..........
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return const DeepF22();
                              },
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(100),
                                    topRight: Radius.circular(100)),
                              ));
                        },
                        child: Text(
                          'Toshiba 56',
                          style: TextStyle(
                              fontSize: 5.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        )),
                    // _________ sizedBox __________
                    SizedBox(height: 7.h),
                  ],
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