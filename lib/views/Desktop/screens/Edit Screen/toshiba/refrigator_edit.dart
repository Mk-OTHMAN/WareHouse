import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/Routes/rutes_name.dart';
<<<<<<< HEAD

=======
>>>>>>> 6359593 (create half washer files)
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
<<<<<<< HEAD
                          const AddSellRow(
                              addShowButtomSheetName: Tosh33t(),
                              sellShowButtomSheetName: SellToshiba33T(),
=======
                          AddSellRow(
                              addShowButtomSheetName: const Tosh33t(),
                              sellShowButtomSheetName: const SellToshiba33T(),
>>>>>>> 6359593 (create half washer files)
                              modelName: 'Toshiba33T',
                              iconShape1: Icons.download,
                              iconSape2: Icons.upload),
                          // _________ sizedBox __________
                          SizedBox(height: 1.h),
                          //! ___________ 37 ____________
<<<<<<< HEAD
                          const AddSellRow(
                              addShowButtomSheetName: AddRef37(),
                              sellShowButtomSheetName: SellRef37(),
=======
                          AddSellRow(
                              addShowButtomSheetName: const AddRef37(),
                              sellShowButtomSheetName: const SellRef37(),
>>>>>>> 6359593 (create half washer files)
                              modelName: 'Toshiba37',
                              iconShape1: Icons.download,
                              iconSape2: Icons.upload),
                          SizedBox(height: 2.h),
                          //! _______  37J ____________
<<<<<<< HEAD
                          const AddSellRow(
                              addShowButtomSheetName: AddRef37J(),
                              sellShowButtomSheetName: SellRef37J(),
=======
                          AddSellRow(
                              addShowButtomSheetName: const AddRef37J(),
                              sellShowButtomSheetName: const SellRef37J(),
>>>>>>> 6359593 (create half washer files)
                              modelName: 'Toshiba37J',
                              iconShape1: Icons.download,
                              iconSape2: Icons.upload),
                          SizedBox(height: 2.h),
                          //!     _______ 40PT ________
<<<<<<< HEAD
                          const AddSellRow(
                              addShowButtomSheetName: AddRef40pt(),
                              sellShowButtomSheetName: SellRef40pt(),
=======
                          AddSellRow(
                              addShowButtomSheetName: const AddRef40pt(),
                              sellShowButtomSheetName: const SellRef40pt(),
>>>>>>> 6359593 (create half washer files)
                              modelName: 'Tosiba40PT',
                              iconShape1: Icons.download,
                              iconSape2: Icons.upload),
                          SizedBox(height: 2.h),
                          //!   __________  40PR ________
<<<<<<< HEAD
                          const AddSellRow(
                              addShowButtomSheetName: AddRef40pr(),
                              sellShowButtomSheetName: SellRef40pr(),
=======
                          AddSellRow(
                              addShowButtomSheetName: const AddRef40pr(),
                              sellShowButtomSheetName: const SellRef40pr(),
>>>>>>> 6359593 (create half washer files)
                              modelName: 'Toshiba40PR',
                              iconShape1: Icons.download,
                              iconSape2: Icons.upload),
                          SizedBox(height: 2.h),
                          //! _________  40PJ  __________
<<<<<<< HEAD
                          const AddSellRow(
                              addShowButtomSheetName: AddRef40pj(),
                              sellShowButtomSheetName: SellRef40pj(),
=======
                          AddSellRow(
                              addShowButtomSheetName: const AddRef40pj(),
                              sellShowButtomSheetName: const SellRef40pj(),
>>>>>>> 6359593 (create half washer files)
                              modelName: 'Toshiba40PJ',
                              iconShape1: Icons.download,
                              iconSape2: Icons.upload),
                          SizedBox(height: 2.h),
                          //! _________  40PH  __________
<<<<<<< HEAD
                          const AddSellRow(
                              addShowButtomSheetName: AddRef40ph(),
                              sellShowButtomSheetName: SellRef40ph(),
=======
                          AddSellRow(
                              addShowButtomSheetName: const AddRef40ph(),
                              sellShowButtomSheetName: const SellRef40ph(),
>>>>>>> 6359593 (create half washer files)
                              modelName: 'Toshiba40PH',
                              iconShape1: Icons.download,
                              iconSape2: Icons.upload),
                          SizedBox(height: 2.h),
                          //!  __________    45  __________
<<<<<<< HEAD
                          const AddSellRow(
                              addShowButtomSheetName: AddRef45(),
                              sellShowButtomSheetName: SellRef45(),
=======
                          AddSellRow(
                              addShowButtomSheetName: const AddRef45(),
                              sellShowButtomSheetName: const SellRef45(),
>>>>>>> 6359593 (create half washer files)
                              modelName: 'Toshiba45',
                              iconShape1: Icons.download,
                              iconSape2: Icons.upload),
                          SizedBox(height: 2.h),
                          //!  _______ 51  ______
<<<<<<< HEAD
                          const AddSellRow(
                              addShowButtomSheetName: AddRef51(),
                              sellShowButtomSheetName: SellRef51(),
=======
                          AddSellRow(
                              addShowButtomSheetName: const AddRef51(),
                              sellShowButtomSheetName: const SellRef51(),
>>>>>>> 6359593 (create half washer files)
                              modelName: 'Toshiba51',
                              iconShape1: Icons.download,
                              iconSape2: Icons.upload),
                          SizedBox(height: 2.h),
                          //!   _________   56  __________
<<<<<<< HEAD
                          const AddSellRow(
                              addShowButtomSheetName: AddRef56(),
                              sellShowButtomSheetName: SellRef56(),
=======
                          AddSellRow(
                              addShowButtomSheetName: const AddRef56(),
                              sellShowButtomSheetName: const SellRef56(),
>>>>>>> 6359593 (create half washer files)
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
