import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/custom/component_bottom_sheet.dart';

class Add1300 extends StatefulWidget {
  const Add1300({super.key});

  @override
  State<Add1300> createState() => _Add1300State();
}

class _Add1300State extends State<Add1300> {
  Box data = Hive.box('data');
  //! variables for calculate proccess to data
  int valueAddQyantaty1300 = 0;
  int valueAdd1300Color1 = 0;
  int valueAdd1300Color2 = 0;
  //! variables for parseing proccess at controller
  int addtotal1300 = 0;
  int add1300color1 = 0;
  int add1300color2 = 0;
  @override
  Widget build(BuildContext context) {
    TextEditingController total1300 = TextEditingController();
    TextEditingController w1300color1 = TextEditingController();
    TextEditingController w1300color2 = TextEditingController();

    var t1300 = total1300;
    var c1W1300 = w1300color1;
    var c2W1300 = w1300color2;

    if (data.get('total1300') == null) {
      data.put('total1300', 0);
    }
    if (data.get('1300color1') == null) {
      data.put('1300color1', 0);
    }
    if (data.get('1300color2') == null) {
      data.put('1300color2', 0);
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
                    componentName: 'Total Quantity', textController: total1300),
              ),
              //! _______________ sl quantity __________
              Expanded(
                child: ComponentButtomSheet(
                    componentName: 'WH Quantity', textController: w1300color1),
              ),

              //! _____________ ch quantity  ______________
              Expanded(
                child: ComponentButtomSheet(
                    componentName: 'SL Quantity', textController: w1300color2),
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
                      if (t1300.text.isEmpty &&
                          c1W1300.text.isEmpty &&
                          c2W1300.text.isEmpty) {
                        showDialogFunction(
                            'WRONG',
                            'Please Add Quantity And Color , you must add Quantity and at least one color ..!',
                            'Assets/lottie/error-oops.json');
                      }

                      //? ________ Check if user write in Quantaty Only ________ //
                      else if (c1W1300.text.isEmpty && c2W1300.text.isEmpty) {
                        showDialogFunction(
                            'WRON',
                            'you must choose at least one color.',
                            'Assets/lottie/error-oops.json');
                        t1300.clear();
                      }
                      // ?________ Check if user write in Color 1 Only _______ //
                      else if (t1300.text.isEmpty && c2W1300.text.isEmpty) {
                        showDialogFunction(
                            'WRONG',
                            "you must choose the Quantity,that's wrong add color only",
                            'Assets/lottie/error-oops.json');
                        c1W1300.clear();
                      }
                      //? ________ check if user write in color 2 only _________ //
                      else if (t1300.text.isEmpty && c1W1300.text.isEmpty) {
                        showDialogFunction(
                            'WRONG',
                            "you must choose the Quantity, that's wrong add color only",
                            'Assets/lottie/error-oops.json');
                        c2W1300.clear();
                      }
                      //? _______ check if user write on Color 1 and Color 2 only ______ //
                      else if (t1300.text.isEmpty) {
                        showDialogFunction(
                            'WRONG',
                            "you must choose the Quantity, that's wrong add color only",
                            'Assets/lottie/error-oops.json');
                        c1W1300.clear();
                        c2W1300.clear();
                      }
                      //!_________ case add at one time 3*1 _____________
                      else if (t1300.text.isNotEmpty &&
                          c1W1300.text.isNotEmpty &&
                          c2W1300.text.isNotEmpty) {
                        addtotal1300 = int.parse(t1300.text);
                        add1300color1 = int.parse(c1W1300.text);
                        add1300color2 = int.parse(c2W1300.text);
                        if (valueAddQyantaty1300 == 0) {
                          valueAddQyantaty1300 = data.get(
                              'total1300'); //! =========> 👀     TOTAL QUQNTITY
                          valueAddQyantaty1300 += addtotal1300;
                          data.put(
                              'total1300', //! =====> 👀  TOTAL QUANTITY
                              valueAddQyantaty1300);
                        }

                        if (valueAdd1300Color1 == 0) {
                          valueAdd1300Color1 = data
                              .get('1300color1'); //!  ==========> 👀    COLOR 1
                          valueAdd1300Color1 += add1300color1;
                          data.put(
                              '1300color1', //! ========> 👀  COLOR 1
                              valueAdd1300Color1);
                        }

                        if (valueAdd1300Color2 == 0) {
                          valueAdd1300Color2 = data
                              .get('1300color2'); // ! =======> 👀    COLOR 2
                          valueAdd1300Color2 += add1300color2;
                          data.put(
                              '1300color2', //! =======>👀  COLOR 2
                              valueAdd1300Color2);
                        }
                        showDialogFunction(
                            'DONE',
                            'success process, and well done for remembering to add the product',
                            'Assets/lottie/DoneGreen.json');
                        total1300.clear();
                        w1300color1.clear();
                        w1300color2.clear();
                      }
                      // !_________ Add Proccess for All Quantaty and color 1 _______ //
                      else if (c2W1300.text.isEmpty) {
                        addtotal1300 = int.parse(t1300.text);
                        if (valueAddQyantaty1300 == 0) {
                          valueAddQyantaty1300 = data.get(
                              'total1300'); //! =========> 👀 TOTOAL QUANTITY
                        }
                        valueAddQyantaty1300 += addtotal1300;
                        data.put(
                            'total1300', //! ======> 👀  TOTAL QUANTITY
                            valueAddQyantaty1300);
                        add1300color1 = int.parse(c1W1300.text);
                        if (valueAdd1300Color1 == 0) {
                          valueAdd1300Color1 =
                              data.get('1300color1'); //! =======> 👀   COLOR 1
                        }
                        valueAdd1300Color1 += add1300color1;
                        data.put(
                            '1300color1', //! =======> 👀  COLOR 1
                            valueAdd1300Color1);
                        t1300.clear();
                        c1W1300.clear();
                        Navigator.pop(context);
                        showDialogFunction(
                            'DONE',
                            'success process, and well done for remembering to add the product',
                            'Assets/lottie/DoneGreen.json');
                      }
                      // !_________ Add Proccess for All Quantaty & Color 2  ________ //
                      else {
                        addtotal1300 = int.parse(t1300.text);
                        if (valueAddQyantaty1300 == 0) {
                          valueAddQyantaty1300 = data
                              .get('total1300'); //! =======> 👀  TOTAL QUANTITY
                        }
                        valueAddQyantaty1300 += addtotal1300;
                        data.put(
                            'total1300', //! =======> 👀 TOTAL QUANTITY
                            valueAddQyantaty1300);
                        add1300color2 = int.parse(c2W1300.text);
                        if (valueAdd1300Color2 == 0) {
                          valueAdd1300Color2 =
                              data.get('1300color2'); //! =======> 👀   COLOR 2
                        }
                        valueAdd1300Color2 += add1300color2;
                        data.put(
                            '1300color2', //! =======> 👀 COLOR 2
                            valueAdd1300Color2);
                        t1300.clear();
                        c2W1300.clear();
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
