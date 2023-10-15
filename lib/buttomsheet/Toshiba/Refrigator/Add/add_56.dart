import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/custom/component_bottom_sheet.dart';

class AddRef56 extends StatefulWidget {
  const AddRef56({super.key});

  @override
  State<AddRef56> createState() => _AddRef56State();
}

class _AddRef56State extends State<AddRef56> {
  Box data = Hive.box('data');
  //! variables for calculate proccess to data
  int valueAddQyantaty56 = 0;
  int valueAdd56Color1 = 0;
  int valueAdd56Color2 = 0;
  //! variables for parseing proccess at controller
  int addtotal56 = 0;
  int add56color1 = 0;
  int add56color2 = 0;
  @override
  Widget build(BuildContext context) {
    TextEditingController total56 = TextEditingController();
    TextEditingController r56color1 = TextEditingController();
    TextEditingController r56color2 = TextEditingController();

    var t56 = total56;
    var c1R56 = r56color1;
    var c2R56 = r56color2;

    if (data.get('total56') == null) {
      data.put('total56', 0);
    }
    if (data.get('56color1') == null) {
      data.put('56color1', 0);
    }
    if (data.get('56color2') == null) {
      data.put('56color2', 0);
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

    return Row(
      children: [
        Expanded(
          flex: 2,
          //! -------------------------------------------------------------------
          //? _____________  container for adding proccess ______________________
          //! -------------------------------------------------------------------
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30))),
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Text('Add',
                    style: GoogleFonts.rowdies(
                        color: Colors.white,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold)),
                //! _________________ row body _____________
                SizedBox(height: 25.h),
                Row(
                  children: [
                    //! ____________  total quantity  __________
                    Expanded(
<<<<<<< HEAD
                      child: ComponentButtomSheet(
=======
                      child: component_buttom_sheet(
>>>>>>> 6359593 (create half washer files)
                          componentName: 'Total Quantity',
                          textController: total56),
                    ),
                    //! _______________ sl quantity __________
                    Expanded(
<<<<<<< HEAD
                      child: ComponentButtomSheet(
=======
                      child: component_buttom_sheet(
>>>>>>> 6359593 (create half washer files)
                          componentName: 'SL Quantity',
                          textController: r56color1),
                    ),

                    //! _____________ ch quantity  ______________
                    Expanded(
<<<<<<< HEAD
                      child: ComponentButtomSheet(
=======
                      child: component_buttom_sheet(
>>>>>>> 6359593 (create half washer files)
                          componentName: 'CH Quantity',
                          textController: r56color2),
                    )
                  ],
                ),
                //! ____________ sizedBox for Height __________
                SizedBox(
                  height: 150.h,
                ),
                // !________________ elevatedButton for all text form fields ___________________
                IconButton(
                    onPressed: () {
                      setState(() {
                        //?_______ Check Quantaty & Color 1 & Color is Empty _____ //
                        if (t56.text.isEmpty &&
                            c1R56.text.isEmpty &&
                            c2R56.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              'Please Add Quantity And Color , you must add Quantity and at least one color ..!',
                              'Assets/lottie/Error.json');
                        }

                        //? ________ Check if user write in Quantaty Only ________ //
                        else if (c1R56.text.isEmpty && c2R56.text.isEmpty) {
                          showDialogFunction(
                              'WRON',
                              'you must choose at least one color.',
                              'Assets/lottie/Error.json');
                          t56.clear();
                        }
                        // ?________ Check if user write in Color 1 Only _______ //
                        else if (t56.text.isEmpty && c2R56.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity,that's wrong add color only",
                              'Assets/lottie/Error.json');
                          c1R56.clear();
                        }
                        //? ________ check if user write in color 2 only _________ //
                        else if (t56.text.isEmpty && c1R56.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity, that's wrong add color only",
                              'Assets/lottie/Error.json');
                          c2R56.clear();
                        }
                        //? _______ check if user write on Color 1 and Color 2 only ______ //
                        else if (t56.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity, that's wrong add color only",
                              'Assets/lottie/Error.json');
                          c1R56.clear();
                          c2R56.clear();
                        }
                        //!_________ case add at one time 3*1 _____________
                        else if (t56.text.isNotEmpty &&
                            c1R56.text.isNotEmpty &&
                            c2R56.text.isNotEmpty) {
                          addtotal56 = int.parse(t56.text);
                          add56color1 = int.parse(c1R56.text);
                          add56color2 = int.parse(c2R56.text);
                          if (valueAddQyantaty56 == 0) {
                            valueAddQyantaty56 = data.get(
                                'total56'); //! =========> 👀     TOTAL QUQNTITY
                            valueAddQyantaty56 += addtotal56;
                            data.put(
                                'total56', //! =====> 👀  TOTAL QUANTITY
                                valueAddQyantaty56);
                          }

                          if (valueAdd56Color1 == 0) {
                            valueAdd56Color1 = data
                                .get('56color1'); //!  ==========> 👀    COLOR 1
                            valueAdd56Color1 += add56color1;
                            data.put(
                                '56color1', //! ========> 👀  COLOR 1
                                valueAdd56Color1);
                          }

                          if (valueAdd56Color2 == 0) {
                            valueAdd56Color2 = data
                                .get('56color2'); // ! =======> 👀    COLOR 2
                            valueAdd56Color2 += add56color2;
                            data.put(
                                '56color2', //! =======>👀  COLOR 2
                                valueAdd56Color2);
                          }
                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to add the product',
                              'Assets/lottie/DoneGreen.json');
                          total56.clear();
                          r56color1.clear();
                          r56color2.clear();
                        }
                        // !_________ Add Proccess for All Quantaty and color 1 _______ //
                        else if (c2R56.text.isEmpty) {
                          addtotal56 = int.parse(t56.text);
                          if (valueAddQyantaty56 == 0) {
                            valueAddQyantaty56 = data.get(
                                'total56'); //! =========> 👀 TOTOAL QUANTITY
                          }
                          valueAddQyantaty56 += addtotal56;
                          data.put(
                              'total56', //! ======> 👀  TOTAL QUANTITY
                              valueAddQyantaty56);
                          add56color1 = int.parse(c1R56.text);
                          if (valueAdd56Color1 == 0) {
                            valueAdd56Color1 =
                                data.get('56color1'); //! =======> 👀   COLOR 1
                          }
                          valueAdd56Color1 += add56color1;
                          data.put(
                              '56color1', //! =======> 👀  COLOR 1
                              valueAdd56Color1);
                          t56.clear();
                          c1R56.clear();
                          Navigator.pop(context);
                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to add the product',
                              'Assets/lottie/DoneGreen.json');
                        }
                        // !_________ Add Proccess for All Quantaty & Color 2  ________ //
                        else {
                          addtotal56 = int.parse(t56.text);
                          if (valueAddQyantaty56 == 0) {
                            valueAddQyantaty56 = data
                                .get('total56'); //! =======> 👀  TOTAL QUANTITY
                          }
                          valueAddQyantaty56 += addtotal56;
                          data.put(
                              'total56', //! =======> 👀 TOTAL QUANTITY
                              valueAddQyantaty56);
                          add56color2 = int.parse(c2R56.text);
                          if (valueAdd56Color2 == 0) {
                            valueAdd56Color2 =
                                data.get('56color2'); //! =======> 👀   COLOR 2
                          }
                          valueAdd56Color2 += add56color2;
                          data.put(
                              '56color2', //! =======> 👀 COLOR 2
                              valueAdd56Color2);
                          t56.clear();
                          c2R56.clear();
                          Navigator.pop(context);
                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to add the product',
                              'Assets/lottie/DoneGreen.json');
                        }
                      });
                    },
                    icon: const Icon(
                      Icons.playlist_add_check_circle_outlined,
                      size: 50,
                    ))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
