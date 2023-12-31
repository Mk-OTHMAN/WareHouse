import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/Routes/rutes_name.dart';

import 'package:warehouse/buttomsheet/Toshiba/Refrigator/Add/add_51.dart';
import 'package:warehouse/buttomsheet/Toshiba/Refrigator/Add/add_56.dart';
import 'package:warehouse/buttomsheet/Toshiba/Refrigator/Add/add_ref37J.dart';
import 'package:warehouse/buttomsheet/Toshiba/Refrigator/Add/add_ref40ph.dart';
import 'package:warehouse/buttomsheet/Toshiba/Refrigator/Add/add_ref40pj.dart';
import 'package:warehouse/buttomsheet/Toshiba/Refrigator/Add/add_ref40pt.dart';
import 'package:warehouse/buttomsheet/Toshiba/Refrigator/Add/add_ref45.dart';
import 'package:warehouse/buttomsheet/Toshiba/Refrigator/Add/add_toshiba33T.dart';
import 'package:warehouse/buttomsheet/Toshiba/Refrigator/Add/add_toshiba37.dart';
import 'package:warehouse/buttomsheet/Toshiba/Refrigator/Add/addref40pr.dart';
import 'package:warehouse/buttomsheet/Toshiba/Refrigator/Sell/seel_ref37J.dart';
import 'package:warehouse/buttomsheet/Toshiba/Refrigator/Sell/sell_51.dart';
import 'package:warehouse/buttomsheet/Toshiba/Refrigator/Sell/sell_56.dart';
import 'package:warehouse/buttomsheet/Toshiba/Refrigator/Sell/sell_reef40pj.dart';
import 'package:warehouse/buttomsheet/Toshiba/Refrigator/Sell/sell_ref40ph.dart';
import 'package:warehouse/buttomsheet/Toshiba/Refrigator/Sell/sell_ref40pr.dart';
import 'package:warehouse/buttomsheet/Toshiba/Refrigator/Sell/sell_ref40pt.dart';
import 'package:warehouse/buttomsheet/Toshiba/Refrigator/Sell/sell_ref45.dart';
import 'package:warehouse/buttomsheet/Toshiba/Refrigator/Sell/sell_toshiba37.dart';
import 'package:warehouse/buttomsheet/Toshiba/Refrigator/Sell/sell_tosiba33T.dart';
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
                          const AddSellRow(
                              addShowButtomSheetName: Tosh33t(),
                              sellShowButtomSheetName: SellToshiba33T(),
                              modelName: 'Toshiba33T',
                              iconShape1: Icons.download,
                              iconSape2: Icons.upload),
                          // _________ sizedBox __________
                          SizedBox(height: 1.h),
                          //! ___________ 37 ____________

                          const AddSellRow(
                              addShowButtomSheetName: AddRef37(),
                              sellShowButtomSheetName: SellRef37(),
                              modelName: 'Toshiba37',
                              iconShape1: Icons.download,
                              iconSape2: Icons.upload),
                          SizedBox(height: 2.h),
                          //! _______  37J ____________
                          const AddSellRow(
                              addShowButtomSheetName: AddRef37J(),
                              sellShowButtomSheetName: SellRef37J(),
                              modelName: 'Toshiba37J',
                              iconShape1: Icons.download,
                              iconSape2: Icons.upload),
                          SizedBox(height: 2.h),
                          //!     _______ 40PT ________
                          const AddSellRow(
                              addShowButtomSheetName: AddRef40pt(),
                              sellShowButtomSheetName: SellRef40pt(),
                              modelName: 'Tosiba40PT',
                              iconShape1: Icons.download,
                              iconSape2: Icons.upload),
                          SizedBox(height: 2.h),
                          //!   __________  40PR ________
                          const AddSellRow(
                              addShowButtomSheetName: AddRef40pr(),
                              sellShowButtomSheetName: SellRef40pr(),
                              modelName: 'Toshiba40PR',
                              iconShape1: Icons.download,
                              iconSape2: Icons.upload),
                          SizedBox(height: 2.h),
                          //! _________  40PJ  __________
                          const AddSellRow(
                              addShowButtomSheetName: AddRef40pj(),
                              sellShowButtomSheetName: SellRef40pj(),
                              modelName: 'Toshiba40PJ',
                              iconShape1: Icons.download,
                              iconSape2: Icons.upload),
                          SizedBox(height: 2.h),
                          //! _________  40PH  __________
                          const AddSellRow(
                              addShowButtomSheetName: AddRef40ph(),
                              sellShowButtomSheetName: SellRef40ph(),
                              modelName: 'Toshiba40PH',
                              iconShape1: Icons.download,
                              iconSape2: Icons.upload),
                          SizedBox(height: 2.h),
                          //!  __________    45  __________
                          const AddSellRow(
                              addShowButtomSheetName: AddRef45(),
                              sellShowButtomSheetName: SellRef45(),
                              modelName: 'Toshiba45',
                              iconShape1: Icons.download,
                              iconSape2: Icons.upload),
                          SizedBox(height: 2.h),
                          //!  _______ 51  ______
                          const AddSellRow(
                              addShowButtomSheetName: AddRef51(),
                              sellShowButtomSheetName: SellRef51(),
                              modelName: 'Toshiba51',
                              iconShape1: Icons.download,
                              iconSape2: Icons.upload),
                          SizedBox(height: 2.h),
                          //!   _________   56  __________
                          const AddSellRow(
                              addShowButtomSheetName: AddRef56(),
                              sellShowButtomSheetName: SellRef56(),
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
