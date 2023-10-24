import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/custom/component_bottom_sheet.dart';

class Add8460 extends StatefulWidget {
  const Add8460({super.key});

  @override
  State<Add8460> createState() => _Add8460State();
}

class _Add8460State extends State<Add8460> {
  Box data = Hive.box('data');
  //! variables for calculate proccess to data
  int valueAddQyantaty8460 = 0;
  int valueAdd8460Color1 = 0;
  int valueAdd8460Color2 = 0;
  //! variables for parseing proccess at controller
  int addtotal8460 = 0;
  int add8460color1 = 0;
  int add8460color2 = 0;
  @override
  Widget build(BuildContext context) {
    TextEditingController total8460 = TextEditingController();
    TextEditingController w8460color1 = TextEditingController();
    TextEditingController w8460color2 = TextEditingController();

    var t8460 = total8460;
    var c1W8460 = w8460color1;
    var c2W8460 = w8460color2;

    if (data.get('total8460') == null) {
      data.put('total8460', 0);
    }
    if (data.get('8460color1') == null) {
      data.put('8460color1', 0);
    }
    if (data.get('8460color2') == null) {
      data.put('8460color2', 0);
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
                    componentName: 'Total Quantity', textController: total8460),
              ),
              //! _______________ sl quantity __________
              Expanded(
                child: ComponentButtomSheet(
                    componentName: 'WH Quantity', textController: w8460color1),
              ),

              //! _____________ ch quantity  ______________
              Expanded(
                child: ComponentButtomSheet(
                    componentName: 'SL Quantity', textController: w8460color2),
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
                      if (t8460.text.isEmpty &&
                          c1W8460.text.isEmpty &&
                          c2W8460.text.isEmpty) {
                        showDialogFunction(
                            'WRONG',
                            'Please Add Quantity And Color , you must add Quantity and at least one color ..!',
                            'Assets/lottie/error-oops.json');
                      }

                      //? ________ Check if user write in Quantaty Only ________ //
                      else if (c1W8460.text.isEmpty && c2W8460.text.isEmpty) {
                        showDialogFunction(
                            'WRON',
                            'you must choose at least one color.',
                            'Assets/lottie/error-oops.json');
                        t8460.clear();
                      }
                      // ?________ Check if user write in Color 1 Only _______ //
                      else if (t8460.text.isEmpty && c2W8460.text.isEmpty) {
                        showDialogFunction(
                            'WRONG',
                            "you must choose the Quantity,that's wrong add color only",
                            'Assets/lottie/error-oops.json');
                        c1W8460.clear();
                      }
                      //? ________ check if user write in color 2 only _________ //
                      else if (t8460.text.isEmpty && c1W8460.text.isEmpty) {
                        showDialogFunction(
                            'WRONG',
                            "you must choose the Quantity, that's wrong add color only",
                            'Assets/lottie/error-oops.json');
                        c2W8460.clear();
                      }
                      //? _______ check if user write on Color 1 and Color 2 only ______ //
                      else if (t8460.text.isEmpty) {
                        showDialogFunction(
                            'WRONG',
                            "you must choose the Quantity, that's wrong add color only",
                            'Assets/lottie/error-oops.json');
                        c1W8460.clear();
                        c2W8460.clear();
                      }
                      //!_________ case add at one time 3*1 _____________
                      else if (t8460.text.isNotEmpty &&
                          c1W8460.text.isNotEmpty &&
                          c2W8460.text.isNotEmpty) {
                        addtotal8460 = int.parse(t8460.text);
                        add8460color1 = int.parse(c1W8460.text);
                        add8460color2 = int.parse(c2W8460.text);
                        if (valueAddQyantaty8460 == 0) {
                          valueAddQyantaty8460 = data.get(
                              'total8460'); //! =========> 👀     TOTAL QUQNTITY
                          valueAddQyantaty8460 += addtotal8460;
                          data.put(
                              'total8460', //! =====> 👀  TOTAL QUANTITY
                              valueAddQyantaty8460);
                        }

                        if (valueAdd8460Color1 == 0) {
                          valueAdd8460Color1 = data
                              .get('8460color1'); //!  ==========> 👀    COLOR 1
                          valueAdd8460Color1 += add8460color1;
                          data.put(
                              '8460color1', //! ========> 👀  COLOR 1
                              valueAdd8460Color1);
                        }

                        if (valueAdd8460Color2 == 0) {
                          valueAdd8460Color2 = data
                              .get('8460color2'); // ! =======> 👀    COLOR 2
                          valueAdd8460Color2 += add8460color2;
                          data.put(
                              '8460color2', //! =======>👀  COLOR 2
                              valueAdd8460Color2);
                        }
                        showDialogFunction(
                            'DONE',
                            'success process, and well done for remembering to add the product',
                            'Assets/lottie/DoneGreen.json');
                        total8460.clear();
                        w8460color1.clear();
                        w8460color2.clear();
                      }
                      // !_________ Add Proccess for All Quantaty and color 1 _______ //
                      else if (c2W8460.text.isEmpty) {
                        addtotal8460 = int.parse(t8460.text);
                        if (valueAddQyantaty8460 == 0) {
                          valueAddQyantaty8460 = data.get(
                              'total8460'); //! =========> 👀 TOTOAL QUANTITY
                        }
                        valueAddQyantaty8460 += addtotal8460;
                        data.put(
                            'total8460', //! ======> 👀  TOTAL QUANTITY
                            valueAddQyantaty8460);
                        add8460color1 = int.parse(c1W8460.text);
                        if (valueAdd8460Color1 == 0) {
                          valueAdd8460Color1 =
                              data.get('8460color1'); //! =======> 👀   COLOR 1
                        }
                        valueAdd8460Color1 += add8460color1;
                        data.put(
                            '8460color1', //! =======> 👀  COLOR 1
                            valueAdd8460Color1);
                        t8460.clear();
                        c1W8460.clear();
                        Navigator.pop(context);
                        showDialogFunction(
                            'DONE',
                            'success process, and well done for remembering to add the product',
                            'Assets/lottie/DoneGreen.json');
                      }
                      // !_________ Add Proccess for All Quantaty & Color 2  ________ //
                      else {
                        addtotal8460 = int.parse(t8460.text);
                        if (valueAddQyantaty8460 == 0) {
                          valueAddQyantaty8460 = data
                              .get('total8460'); //! =======> 👀  TOTAL QUANTITY
                        }
                        valueAddQyantaty8460 += addtotal8460;
                        data.put(
                            'total8460', //! =======> 👀 TOTAL QUANTITY
                            valueAddQyantaty8460);
                        add8460color2 = int.parse(c2W8460.text);
                        if (valueAdd8460Color2 == 0) {
                          valueAdd8460Color2 =
                              data.get('8460color2'); //! =======> 👀   COLOR 2
                        }
                        valueAdd8460Color2 += add8460color2;
                        data.put(
                            '8460color2', //! =======> 👀 COLOR 2
                            valueAdd8460Color2);
                        t8460.clear();
                        c2W8460.clear();
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
