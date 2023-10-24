import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/custom/component_bottom_sheet.dart';

class Add1150 extends StatefulWidget {
  const Add1150({super.key});

  @override
  State<Add1150> createState() => _Add1150State();
}

class _Add1150State extends State<Add1150> {
  Box data = Hive.box('data');
  //! variables for calculate proccess to data
  int valueAddQyantaty1150 = 0;
  int valueAdd1150Color1 = 0;
  int valueAdd1150Color2 = 0;
  //! variables for parseing proccess at controller
  int addtotal1150 = 0;
  int add1150color1 = 0;
  int add1150color2 = 0;
  @override
  Widget build(BuildContext context) {
    TextEditingController total1150 = TextEditingController();
    TextEditingController w1150color1 = TextEditingController();
    TextEditingController w1150color2 = TextEditingController();

    var t1150 = total1150;
    var c1W1150 = w1150color1;
    var c2W1150 = w1150color2;

    if (data.get('total1150') == null) {
      data.put('total1150', 0);
    }
    if (data.get('1150color1') == null) {
      data.put('1150color1', 0);
    }
    if (data.get('1150color2') == null) {
      data.put('1150color2', 0);
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
                    componentName: 'Total Quantity', textController: total1150),
              ),
              //! _______________ sl quantity __________
              Expanded(
                child: ComponentButtomSheet(
                    componentName: 'WH Quantity', textController: w1150color1),
              ),

              //! _____________ ch quantity  ______________
              Expanded(
                child: ComponentButtomSheet(
                    componentName: 'SL Quantity', textController: w1150color2),
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
                      if (t1150.text.isEmpty &&
                          c1W1150.text.isEmpty &&
                          c2W1150.text.isEmpty) {
                        showDialogFunction(
                            'WRONG',
                            'Please Add Quantity And Color , you must add Quantity and at least one color ..!',
                            'Assets/lottie/error-oops.json');
                      }

                      //? ________ Check if user write in Quantaty Only ________ //
                      else if (c1W1150.text.isEmpty && c2W1150.text.isEmpty) {
                        showDialogFunction(
                            'WRON',
                            'you must choose at least one color.',
                            'Assets/lottie/error-oops.json');
                        t1150.clear();
                      }
                      // ?________ Check if user write in Color 1 Only _______ //
                      else if (t1150.text.isEmpty && c2W1150.text.isEmpty) {
                        showDialogFunction(
                            'WRONG',
                            "you must choose the Quantity,that's wrong add color only",
                            'Assets/lottie/error-oops.json');
                        c1W1150.clear();
                      }
                      //? ________ check if user write in color 2 only _________ //
                      else if (t1150.text.isEmpty && c1W1150.text.isEmpty) {
                        showDialogFunction(
                            'WRONG',
                            "you must choose the Quantity, that's wrong add color only",
                            'Assets/lottie/error-oops.json');
                        c2W1150.clear();
                      }
                      //? _______ check if user write on Color 1 and Color 2 only ______ //
                      else if (t1150.text.isEmpty) {
                        showDialogFunction(
                            'WRONG',
                            "you must choose the Quantity, that's wrong add color only",
                            'Assets/lottie/error-oops.json');
                        c1W1150.clear();
                        c2W1150.clear();
                      }
                      //!_________ case add at one time 3*1 _____________
                      else if (t1150.text.isNotEmpty &&
                          c1W1150.text.isNotEmpty &&
                          c2W1150.text.isNotEmpty) {
                        addtotal1150 = int.parse(t1150.text);
                        add1150color1 = int.parse(c1W1150.text);
                        add1150color2 = int.parse(c2W1150.text);
                        if (valueAddQyantaty1150 == 0) {
                          valueAddQyantaty1150 = data.get(
                              'total1150'); //! =========> 👀     TOTAL QUQNTITY
                          valueAddQyantaty1150 += addtotal1150;
                          data.put(
                              'total1150', //! =====> 👀  TOTAL QUANTITY
                              valueAddQyantaty1150);
                        }

                        if (valueAdd1150Color1 == 0) {
                          valueAdd1150Color1 = data
                              .get('1150color1'); //!  ==========> 👀    COLOR 1
                          valueAdd1150Color1 += add1150color1;
                          data.put(
                              '1150color1', //! ========> 👀  COLOR 1
                              valueAdd1150Color1);
                        }

                        if (valueAdd1150Color2 == 0) {
                          valueAdd1150Color2 = data
                              .get('1150color2'); // ! =======> 👀    COLOR 2
                          valueAdd1150Color2 += add1150color2;
                          data.put(
                              '1150color2', //! =======>👀  COLOR 2
                              valueAdd1150Color2);
                        }
                        showDialogFunction(
                            'DONE',
                            'success process, and well done for remembering to add the product',
                            'Assets/lottie/DoneGreen.json');
                        total1150.clear();
                        w1150color1.clear();
                        w1150color2.clear();
                      }
                      // !_________ Add Proccess for All Quantaty and color 1 _______ //
                      else if (c2W1150.text.isEmpty) {
                        addtotal1150 = int.parse(t1150.text);
                        if (valueAddQyantaty1150 == 0) {
                          valueAddQyantaty1150 = data.get(
                              'total1150'); //! =========> 👀 TOTOAL QUANTITY
                        }
                        valueAddQyantaty1150 += addtotal1150;
                        data.put(
                            'total1150', //! ======> 👀  TOTAL QUANTITY
                            valueAddQyantaty1150);
                        add1150color1 = int.parse(c1W1150.text);
                        if (valueAdd1150Color1 == 0) {
                          valueAdd1150Color1 =
                              data.get('1150color1'); //! =======> 👀   COLOR 1
                        }
                        valueAdd1150Color1 += add1150color1;
                        data.put(
                            '1150color1', //! =======> 👀  COLOR 1
                            valueAdd1150Color1);
                        t1150.clear();
                        c1W1150.clear();
                        Navigator.pop(context);
                        showDialogFunction(
                            'DONE',
                            'success process, and well done for remembering to add the product',
                            'Assets/lottie/DoneGreen.json');
                      }
                      // !_________ Add Proccess for All Quantaty & Color 2  ________ //
                      else {
                        addtotal1150 = int.parse(t1150.text);
                        if (valueAddQyantaty1150 == 0) {
                          valueAddQyantaty1150 = data
                              .get('total1150'); //! =======> 👀  TOTAL QUANTITY
                        }
                        valueAddQyantaty1150 += addtotal1150;
                        data.put(
                            'total1150', //! =======> 👀 TOTAL QUANTITY
                            valueAddQyantaty1150);
                        add1150color2 = int.parse(c2W1150.text);
                        if (valueAdd1150Color2 == 0) {
                          valueAdd1150Color2 =
                              data.get('1150color2'); //! =======> 👀   COLOR 2
                        }
                        valueAdd1150Color2 += add1150color2;
                        data.put(
                            '1150color2', //! =======> 👀 COLOR 2
                            valueAdd1150Color2);
                        t1150.clear();
                        c2W1150.clear();
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
