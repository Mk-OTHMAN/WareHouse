import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/custom/component_bottom_sheet.dart';

class AddWsher1000p extends StatefulWidget {
  const AddWsher1000p({super.key});

  @override
  State<AddWsher1000p> createState() => _AddWsher1000pState();
}

class _AddWsher1000pState extends State<AddWsher1000p> {
  Box data = Hive.box('data');
  //! variables for calculate proccess to data
  int valueAddQyantaty1000p = 0;
  //! variables for parseing proccess at controller
  int addtotal1000p = 0;
  @override
  Widget build(BuildContext context) {
    TextEditingController total1000p = TextEditingController();
    var t1000p = total1000p;
    if (data.get('total1000p') == null) {
      data.put('total1000p', 0);
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

    return Row(
      children: [
        Expanded(
          flex: 2,
          //! -------------------------------------------------------------------
          //? _____________  container for adding proccess ______________________
          //! -------------------------------------------------------------------
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('Assets/world.jpeg'), fit: BoxFit.fill),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30))),
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Text('Add Product Into Your Stock',
                    style: GoogleFonts.rowdies(
                        color: Colors.teal,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold)),
                //! _________________ row body _____________
                SizedBox(height: 25.h),

                //! ____________  total quantity  __________
                ComponentButtomSheet(
                    componentName: 'Total Quantity',
                    textController: total1000p),

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
                        'ADD NOW',
                        style: GoogleFonts.caveat(
                            fontSize: 5.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            //?_______ Check Quantaty & Color 1 & Color is Empty _____ //
                            if (t1000p.text.isEmpty) {
                              showDialogFunction(
                                  'WRONG',
                                  'Please Add Quantity And Color , you must add Quantity ..!',
                                  'Assets/lottie/error-oops.json');
                            }

                            //!_________ case add at one time 3*1 _____________
                            else if (t1000p.text.isNotEmpty) {
                              addtotal1000p = int.parse(t1000p.text);
                              if (valueAddQyantaty1000p == 0) {
                                valueAddQyantaty1000p = data.get(
                                    'total1000p'); //! =========> 👀     TOTAL QUQNTITY
                                valueAddQyantaty1000p += addtotal1000p;
                                data.put(
                                    'total1000p', //! =====> 👀  TOTAL QUANTITY
                                    valueAddQyantaty1000p);
                              }

                              showDialogFunction(
                                  'DONE',
                                  'success process, and well done for remembering to add the product',
                                  'Assets/lottie/DoneGreen.json');
                              total1000p.clear();
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.add_circle_outline,
                          size: 35,
                          color: Colors.teal,
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
