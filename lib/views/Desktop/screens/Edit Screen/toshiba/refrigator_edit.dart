import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/Routes/rutes_name.dart';
import 'package:warehouse/buttomsheet/sell_tosiba33T.dart';
import 'package:warehouse/buttomsheet/add_toshiba33T.dart';
import 'package:warehouse/custom/custom_add_sell_row.dart';

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
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AddSellRow(
                              addShowButtomSheetName: const Tosh33t(),
                              sellShowButtomSheetName: const Sell_Toshiba33T(),
                              modelName: 'Toshiba33T',
                              iconShape1: Icons.download,
                              iconSape2: Icons.upload),
                          // _________ sizedBox __________
                          SizedBox(height: 1.h),
                          //! ___________ 37 ____________
                          AddSellRow(
                              addShowButtomSheetName: const Tosh33t(),
                              sellShowButtomSheetName: const Sell_Toshiba33T(),
                              modelName: 'Toshiba37',
                              iconShape1: Icons.download,
                              iconSape2: Icons.upload),
                          SizedBox(height: 2.h),
                          //! _______  37J ____________
                          AddSellRow(
                              addShowButtomSheetName: const Tosh33t(),
                              sellShowButtomSheetName: const Sell_Toshiba33T(),
                              modelName: 'Toshiba37J',
                              iconShape1: Icons.download,
                              iconSape2: Icons.upload),
                          SizedBox(height: 2.h),
                          //!     _______ 40PT ________
                          AddSellRow(
                              addShowButtomSheetName: const Tosh33t(),
                              sellShowButtomSheetName: const Sell_Toshiba33T(),
                              modelName: 'Tosiba40PT',
                              iconShape1: Icons.download,
                              iconSape2: Icons.upload),
                          SizedBox(height: 2.h),
                          //!   __________  40PR ________
                          AddSellRow(
                              addShowButtomSheetName: const Tosh33t(),
                              sellShowButtomSheetName: const Sell_Toshiba33T(),
                              modelName: 'Toshiba40PR',
                              iconShape1: Icons.download,
                              iconSape2: Icons.upload),
                          SizedBox(height: 2.h),
                          //! _________  40PJ  __________
                          AddSellRow(
                              addShowButtomSheetName: const Tosh33t(),
                              sellShowButtomSheetName: const Sell_Toshiba33T(),
                              modelName: 'Toshiba40PJ',
                              iconShape1: Icons.download,
                              iconSape2: Icons.upload),
                          SizedBox(height: 2.h),
                          //! _________  40PH  __________
                          AddSellRow(
                              addShowButtomSheetName: const Tosh33t(),
                              sellShowButtomSheetName: const Sell_Toshiba33T(),
                              modelName: 'Toshiba40PH',
                              iconShape1: Icons.download,
                              iconSape2: Icons.upload),
                          SizedBox(height: 2.h),
                          //!  __________    45  __________
                          AddSellRow(
                              addShowButtomSheetName: const Tosh33t(),
                              sellShowButtomSheetName: const Sell_Toshiba33T(),
                              modelName: 'Toshiba45',
                              iconShape1: Icons.download,
                              iconSape2: Icons.upload),
                          SizedBox(height: 2.h),
                          //!  _______ 51  ______
                          AddSellRow(
                              addShowButtomSheetName: const Tosh33t(),
                              sellShowButtomSheetName: const Sell_Toshiba33T(),
                              modelName: 'Toshiba51',
                              iconShape1: Icons.download,
                              iconSape2: Icons.upload),
                          SizedBox(height: 2.h),
                          //!   _________   56  __________
                          AddSellRow(
                              addShowButtomSheetName: const Tosh33t(),
                              sellShowButtomSheetName: const Sell_Toshiba33T(),
                              modelName: 'Toshiba56',
                              iconShape1: Icons.download,
                              iconSape2: Icons.upload),
                          SizedBox(height: 2.h),
                        ],
                      ),
                    ),
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
