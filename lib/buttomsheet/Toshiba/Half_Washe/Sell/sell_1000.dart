import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/custom/component_bottom_sheet.dart';

class SellW1000 extends StatefulWidget {
  const SellW1000({super.key});

  @override
  State<SellW1000> createState() => _SellW1000State();
}

class _SellW1000State extends State<SellW1000> {
  Box data = Hive.box('data');
  //! variables for calculate proccess to data
  int valueDeleteQuantaty1000 = 0;
  //! variables for parseing proccess at controller
  int dtotal1000 = 0;
  @override
  Widget build(BuildContext context) {
    TextEditingController deletetotal1000 = TextEditingController();
    var dt1000 = deletetotal1000;
    if (data.get('total1000') == null) {
      data.put('total1000', 0);
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
              componentName: 'Total Quantity', textController: deletetotal1000),

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
                      if (dt1000.text.isEmpty) {
                        showDialogFunction(
                            'WRONG',
                            'Please Add Quantity , you must add Quantity ..!',
                            'Assets/lottie/error-oops.json');
                      }

                      //!_________ case delete  _____________
                      if (dt1000.text.isNotEmpty) {
                        dtotal1000 = int.parse(dt1000.text);
                        if (dtotal1000 >
                                    data.get('total1000') && //! =======> 👀
                                data.get('total1000') >= 0 ||
                            dtotal1000 >
                                    data.get('total1000') && //! =======> 👀
                                data.get('total1000') == 0) {
                          //! =======> 👀
                          showDialogFunction(
                              'WRONG',
                              'please check on the total Quantity,or the Number Gratter than Quantity',
                              'Assets/lottie/Robot.json');
                          dt1000.clear();
                        }
                        //?  _______   case zero
                        else if (dtotal1000 == 0 &&
                            data.get('total1000') == 0) {
                          //! ====> 🥵
                          showDialogFunction(
                              'WRONG',
                              'Wrong Number Equal Zero and Your Stock Equal Zero ..!',
                              'Assets/lottie/error-oops.json');
                        } else if (dtotal1000 == 0 &&
                            data.get('total1000') > 0) {
                          //! ====> 🥵
                          showDialogFunction(
                              'WRONG',
                              'Wrong Number Equal Zero , How delete Zero From Your Quantity  ..!',
                              'Assets/lottie/error-oops.json');
                        } else {
                          dtotal1000 = int.parse(dt1000.text);

                          valueDeleteQuantaty1000 = data.get('total1000') -
                              dtotal1000; //! =======> 👀
                          data.put('total1000',
                              valueDeleteQuantaty1000); //! =======> 👀
                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to Delete the product',
                              'Assets/lottie/DoneGreen.json');
                          dt1000.clear();
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
