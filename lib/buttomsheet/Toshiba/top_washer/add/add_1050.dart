import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/custom/component_bottom_sheet.dart';

class Add1050 extends StatefulWidget {
  const Add1050({super.key});

  @override
  State<Add1050> createState() => _Add1050State();
}

class _Add1050State extends State<Add1050> {
  Box data = Hive.box('data');
  //! variables for calculate proccess to data
  int valueAddQyantaty1050 = 0;
  int valueAdd1050Color1 = 0;
  int valueAdd1050Color2 = 0;
  //! variables for parseing proccess at controller
  int addtotal1050 = 0;
  int add1050color1 = 0;
  int add1050color2 = 0;
  @override
  Widget build(BuildContext context) {
    TextEditingController total1050 = TextEditingController();
    TextEditingController w1050color1 = TextEditingController();
    TextEditingController w1050color2 = TextEditingController();

    var t1050 = total1050;
    var c1W1050 = w1050color1;
    var c2W1050 = w1050color2;

    if (data.get('total1050') == null) {
      data.put('total1050', 0);
    }
    if (data.get('1050color1') == null) {
      data.put('1050color1', 0);
    }
    if (data.get('1050color2') == null) {
      data.put('1050color2', 0);
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
                    width: 150.w,
                    height: 150.h,
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
              image: AssetImage('Assets/world.jpeg'), fit: BoxFit.fill),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30))),
      child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Text('Add Quantity For Your Stock',
              style: GoogleFonts.rowdies(
                  color: Colors.teal,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold)),
          //! _________________ row body _____________
          SizedBox(height: 25.h),
          Row(
            children: [
              //! ____________  total quantity  __________
              Expanded(
                child: ComponentButtomSheet(
                    componentName: 'Total Quantity', textController: total1050),
              ),
              //! _______________ sl quantity __________
              Expanded(
                child: ComponentButtomSheet(
                    componentName: 'WH Quantity', textController: w1050color1),
              ),

              //! _____________ ch quantity  ______________
              Expanded(
                child: ComponentButtomSheet(
                    componentName: 'SL Quantity', textController: w1050color2),
              )
            ],
          ),
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
                      fontSize: 6.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      //?_______ Check Quantaty & Color 1 & Color is Empty _____ //
                      if (t1050.text.isEmpty &&
                          c1W1050.text.isEmpty &&
                          c2W1050.text.isEmpty) {
                        showDialogFunction(
                            'WRONG',
                            'Please Add Quantity And Color , you must add Quantity and at least one color ..!',
                            'Assets/lottie/error-oops.json');
                      }

                      //? ________ Check if user write in Quantaty Only ________ //
                      else if (c1W1050.text.isEmpty && c2W1050.text.isEmpty) {
                        showDialogFunction(
                            'WRON',
                            'you must choose at least one color.',
                            'Assets/lottie/error-oops.json');
                        t1050.clear();
                      }
                      // ?________ Check if user write in Color 1 Only _______ //
                      else if (t1050.text.isEmpty && c2W1050.text.isEmpty) {
                        showDialogFunction(
                            'WRONG',
                            "you must choose the Quantity,that's wrong add color only",
                            'Assets/lottie/error-oops.json');
                        c1W1050.clear();
                      }
                      //? ________ check if user write in color 2 only _________ //
                      else if (t1050.text.isEmpty && c1W1050.text.isEmpty) {
                        showDialogFunction(
                            'WRONG',
                            "you must choose the Quantity, that's wrong add color only",
                            'Assets/lottie/error-oops.json');
                        c2W1050.clear();
                      }
                      //? _______ check if user write on Color 1 and Color 2 only ______ //
                      else if (t1050.text.isEmpty) {
                        showDialogFunction(
                            'WRONG',
                            "you must choose the Quantity, that's wrong add color only",
                            'Assets/lottie/error-oops.json');
                        c1W1050.clear();
                        c2W1050.clear();
                      }
                      //!_________ case add at one time 3*1 _____________
                      else if (t1050.text.isNotEmpty &&
                          c1W1050.text.isNotEmpty &&
                          c2W1050.text.isNotEmpty) {
                        addtotal1050 = int.parse(t1050.text);
                        add1050color1 = int.parse(c1W1050.text);
                        add1050color2 = int.parse(c2W1050.text);
                        if (valueAddQyantaty1050 == 0) {
                          valueAddQyantaty1050 = data.get(
                              'total1050'); //! =========> 👀     TOTAL QUQNTITY
                          valueAddQyantaty1050 += addtotal1050;
                          data.put(
                              'total1050', //! =====> 👀  TOTAL QUANTITY
                              valueAddQyantaty1050);
                        }

                        if (valueAdd1050Color1 == 0) {
                          valueAdd1050Color1 = data
                              .get('1050color1'); //!  ==========> 👀    COLOR 1
                          valueAdd1050Color1 += add1050color1;
                          data.put(
                              '1050color1', //! ========> 👀  COLOR 1
                              valueAdd1050Color1);
                        }

                        if (valueAdd1050Color2 == 0) {
                          valueAdd1050Color2 = data
                              .get('1050color2'); // ! =======> 👀    COLOR 2
                          valueAdd1050Color2 += add1050color2;
                          data.put(
                              '1050color2', //! =======>👀  COLOR 2
                              valueAdd1050Color2);
                        }
                        showDialogFunction(
                            'DONE',
                            'success process, and well done for remembering to add the product',
                            'Assets/lottie/DoneGreen.json');
                        total1050.clear();
                        w1050color1.clear();
                        w1050color2.clear();
                      }
                      // !_________ Add Proccess for All Quantaty and color 1 _______ //
                      else if (c2W1050.text.isEmpty) {
                        addtotal1050 = int.parse(t1050.text);
                        if (valueAddQyantaty1050 == 0) {
                          valueAddQyantaty1050 = data.get(
                              'total1050'); //! =========> 👀 TOTOAL QUANTITY
                        }
                        valueAddQyantaty1050 += addtotal1050;
                        data.put(
                            'total1050', //! ======> 👀  TOTAL QUANTITY
                            valueAddQyantaty1050);
                        add1050color1 = int.parse(c1W1050.text);
                        if (valueAdd1050Color1 == 0) {
                          valueAdd1050Color1 =
                              data.get('1050color1'); //! =======> 👀   COLOR 1
                        }
                        valueAdd1050Color1 += add1050color1;
                        data.put(
                            '1050color1', //! =======> 👀  COLOR 1
                            valueAdd1050Color1);
                        t1050.clear();
                        c1W1050.clear();
                        Navigator.pop(context);
                        showDialogFunction(
                            'DONE',
                            'success process, and well done for remembering to add the product',
                            'Assets/lottie/DoneGreen.json');
                      }
                      // !_________ Add Proccess for All Quantaty & Color 2  ________ //
                      else {
                        addtotal1050 = int.parse(t1050.text);
                        if (valueAddQyantaty1050 == 0) {
                          valueAddQyantaty1050 = data
                              .get('total1050'); //! =======> 👀  TOTAL QUANTITY
                        }
                        valueAddQyantaty1050 += addtotal1050;
                        data.put(
                            'total1050', //! =======> 👀 TOTAL QUANTITY
                            valueAddQyantaty1050);
                        add1050color2 = int.parse(c2W1050.text);
                        if (valueAdd1050Color2 == 0) {
                          valueAdd1050Color2 =
                              data.get('1050color2'); //! =======> 👀   COLOR 2
                        }
                        valueAdd1050Color2 += add1050color2;
                        data.put(
                            '1050color2', //! =======> 👀 COLOR 2
                            valueAdd1050Color2);
                        t1050.clear();
                        c2W1050.clear();
                        Navigator.pop(context);
                        showDialogFunction(
                            'DONE',
                            'success process, and well done for remembering to add the product',
                            'Assets/lottie/DoneGreen.json');
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.add_circle_outline,
                    color: Colors.teal,
                    size: 40,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
