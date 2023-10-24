import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/custom/component_bottom_sheet.dart';

class SellW1210sp extends StatefulWidget {
  const SellW1210sp({super.key});

  @override
  State<SellW1210sp> createState() => _SellW1210spState();
}

class _SellW1210spState extends State<SellW1210sp> {
  Box data = Hive.box('data');
  //! variables for calculate proccess to data
  int valueDeleteQuantaty1210sp = 0;
  //! variables for parseing proccess at controller
  int dtotal1210sp = 0;
  @override
  Widget build(BuildContext context) {
    TextEditingController deletetotal1210sp = TextEditingController();
    var dt1210sp = deletetotal1210sp;
    if (data.get('total1210sp') == null) {
      data.put('total1210sp', 0);
    }
    //! ===================  Function For ShowDialog ===============================
    void showDialogFunction(String title, String contetnt, String lottiPath) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Center(
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 5.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              content: Text(contetnt),
              actions: [
                Center(
                  child: SizedBox(
                    width: 120.w,
                    height: 120.h,
                    child: Lottie.asset(lottiPath),
                  ),
                ),
              ],
            );
          });
    }

    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('Assets/lump.jpg'), fit: BoxFit.fill),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30))),
      child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Text('Sell Product From Your Stock',
              style: GoogleFonts.rowdies(
                  color: Colors.red,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold)),
          //! _________________ row body _____________
          SizedBox(height: 25.h),

          //! ____________  total quantity  __________
          ComponentButtomSheet(
              componentName: 'Total Quantity',
              textController: deletetotal1210sp),

          //! ____________ sizedBox for Height __________
          SizedBox(
            height: 20.h,
          ),
          // !________________ elevatedButton for all text form fields ___________________
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10.h),
                child: Text(
                  'REMOVE NOW',
                  style: GoogleFonts.caveat(
                      fontSize: 5.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      //?_______ Check Quantaty is Empty _____ //
                      if (dt1210sp.text.isEmpty) {
                        showDialogFunction(
                            'WRONG',
                            'Please Add Quantity , you must add Quantity ..!',
                            'Assets/lottie/error-oops.json');
                      }

                      //!_________ case delete  _____________
                      if (dt1210sp.text.isNotEmpty) {
                        dtotal1210sp = int.parse(dt1210sp.text);
                        if (dtotal1210sp >
                                    data.get('total1210sp') && //! =======> 👀
                                data.get('total1210sp') >= 0 ||
                            dtotal1210sp >
                                    data.get('total1210sp') && //! =======> 👀
                                data.get('total1210sp') == 0) {
                          //! =======> 👀
                          showDialogFunction(
                              'WRONG',
                              'please check on the total Quantity,or the Number Gratter than Quantity',
                              'Assets/lottie/Robot.json');
                          dt1210sp.clear();
                        }
                        //?  _______   case zero
                        else if (dtotal1210sp == 0 &&
                            data.get('total1210sp') == 0) {
                          //! ====> 🥵
                          showDialogFunction(
                              'WRONG',
                              'Wrong Number Equal Zero and Your Stock Equal Zero ..!',
                              'Assets/lottie/error-oops.json');
                        } else if (dtotal1210sp == 0 &&
                            data.get('total1210sp') > 0) {
                          //! ====> 🥵
                          showDialogFunction(
                              'WRONG',
                              'Wrong Number Equal Zero , How delete Zero From Your Quantity  ..!',
                              'Assets/lottie/error-oops.json');
                        } else {
                          dtotal1210sp = int.parse(dt1210sp.text);

                          valueDeleteQuantaty1210sp = data.get('total1210sp') -
                              dtotal1210sp; //! =======> 👀
                          data.put('total1210sp',
                              valueDeleteQuantaty1210sp); //! =======> 👀
                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to Delete the product',
                              'Assets/lottie/DoneGreen.json');
                          dt1210sp.clear();
                        }
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.remove_circle_outline,
                    size: 35,
                    color: Colors.red,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
