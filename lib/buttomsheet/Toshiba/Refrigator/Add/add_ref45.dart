import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/custom/component_bottom_sheet.dart';

class AddRef45 extends StatefulWidget {
  const AddRef45({super.key});

  @override
  State<AddRef45> createState() => _AddRef45State();
}

class _AddRef45State extends State<AddRef45> {
  Box data = Hive.box('data');
  //! variables for calculate proccess to data
  int valueAddQyantaty45 = 0;
  int valueAdd45Color1 = 0;
  int valueAdd45Color2 = 0;
  //! variables for parseing proccess at controller
  int addtotal45 = 0;
  int add45color1 = 0;
  int add45color2 = 0;
  @override
  Widget build(BuildContext context) {
    TextEditingController total45 = TextEditingController();
    TextEditingController r45color1 = TextEditingController();
    TextEditingController r45color2 = TextEditingController();

    var t45 = total45;
    var c1R45 = r45color1;
    var c2R45 = r45color2;

    if (data.get('total45') == null) {
      data.put('total45', 0);
    }
    if (data.get('45color1') == null) {
      data.put('45color1', 0);
    }
    if (data.get('45color2') == null) {
      data.put('45color2', 0);
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
<<<<<<< HEAD
                      child: ComponentButtomSheet(
=======
                      child: component_buttom_sheet(
>>>>>>> 6359593 (create half washer files)
=======
                      child: ComponentButtomSheet(
>>>>>>> 6e95ed1 (some editing)
                          componentName: 'Total Quantity',
                          textController: total45),
                    ),
                    //! _______________ sl quantity __________
                    Expanded(
<<<<<<< HEAD
<<<<<<< HEAD
                      child: ComponentButtomSheet(
=======
                      child: component_buttom_sheet(
>>>>>>> 6359593 (create half washer files)
=======
                      child: ComponentButtomSheet(
>>>>>>> 6e95ed1 (some editing)
                          componentName: 'SL Quantity',
                          textController: r45color1),
                    ),

                    //! _____________ ch quantity  ______________
                    Expanded(
<<<<<<< HEAD
<<<<<<< HEAD
                      child: ComponentButtomSheet(
=======
                      child: component_buttom_sheet(
>>>>>>> 6359593 (create half washer files)
=======
                      child: ComponentButtomSheet(
>>>>>>> 6e95ed1 (some editing)
                          componentName: 'CH Quantity',
                          textController: r45color2),
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
                        if (t45.text.isEmpty &&
                            c1R45.text.isEmpty &&
                            c2R45.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              'Please Add Quantity And Color , you must add Quantity and at least one color ..!',
                              'Assets/lottie/Error.json');
                        }

                        //? ________ Check if user write in Quantaty Only ________ //
                        else if (c1R45.text.isEmpty && c2R45.text.isEmpty) {
                          showDialogFunction(
                              'WRON',
                              'you must choose at least one color.',
                              'Assets/lottie/Error.json');
                          t45.clear();
                        }
                        // ?________ Check if user write in Color 1 Only _______ //
                        else if (t45.text.isEmpty && c2R45.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity,that's wrong add color only",
                              'Assets/lottie/Error.json');
                          c1R45.clear();
                        }
                        //? ________ check if user write in color 2 only _________ //
                        else if (t45.text.isEmpty && c1R45.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity, that's wrong add color only",
                              'Assets/lottie/Error.json');
                          c2R45.clear();
                        }
                        //? _______ check if user write on Color 1 and Color 2 only ______ //
                        else if (t45.text.isEmpty) {
                          showDialogFunction(
                              'WRONG',
                              "you must choose the Quantity, that's wrong add color only",
                              'Assets/lottie/Error.json');
                          c1R45.clear();
                          c2R45.clear();
                        }
                        //!_________ case add at one time 3*1 _____________
                        else if (t45.text.isNotEmpty &&
                            c1R45.text.isNotEmpty &&
                            c2R45.text.isNotEmpty) {
                          addtotal45 = int.parse(t45.text);
                          add45color1 = int.parse(c1R45.text);
                          add45color2 = int.parse(c2R45.text);
                          if (valueAddQyantaty45 == 0) {
                            valueAddQyantaty45 = data
                                .get('total45'); //! =========> 👀  [ TOTAL ]
                            valueAddQyantaty45 += addtotal45;
                            data.put(
                                'total45', //! =====> 👀 [ TOTAL ]
                                valueAddQyantaty45);
                          }

                          if (valueAdd45Color1 == 0) {
                            valueAdd45Color1 = data
                                .get('45color1'); //!  ==========> 👀 [COLOR 1]
                            valueAdd45Color1 += add45color1;
                            data.put(
                                '45color1', //! ========> 👀 [ COLOR 1]
                                valueAdd45Color1);
                          }

                          if (valueAdd45Color2 == 0) {
                            valueAdd45Color2 = data
                                .get('45color2'); // ! =======> 👀 [ COLOR 2 ]
                            valueAdd45Color2 += add45color2;
                            data.put(
                                '45color2', //! =======>👀 [ COLOR 2]
                                valueAdd45Color2);
                          }
                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to add the product',
                              'Assets/lottie/DoneGreen.json');
                          total45.clear();
                          r45color1.clear();
                          r45color2.clear();
                        }
                        // !_________ Add Proccess for All Quantaty and color 1 _______ //
                        else if (c2R45.text.isEmpty) {
                          addtotal45 = int.parse(t45.text);
                          if (valueAddQyantaty45 == 0) {
                            valueAddQyantaty45 =
                                data.get('total45'); //! =========> 👀 [ TOTAL ]
                          }
                          valueAddQyantaty45 += addtotal45;
                          data.put(
                              'total45', //! ======> 👀 [ TOTAL ]
                              valueAddQyantaty45);
                          add45color1 = int.parse(c1R45.text);
                          if (valueAdd45Color1 == 0) {
                            valueAdd45Color1 =
                                data.get('45color1'); //! =======> 👀 [ COLOR 1]
                          }
                          valueAdd45Color1 += add45color1;
                          data.put(
                              '45color1', //! =======> 👀 [ COLOR 1]
                              valueAdd45Color1);
                          t45.clear();
                          c1R45.clear();
                          Navigator.pop(context);
                          showDialogFunction(
                              'DONE',
                              'success process, and well done for remembering to add the product',
                              'Assets/lottie/DoneGreen.json');
                        }
                        // !_________ Add Proccess for All Quantaty & Color 2  ________ //
                        else {
                          addtotal45 = int.parse(t45.text);
                          if (valueAddQyantaty45 == 0) {
                            valueAddQyantaty45 =
                                data.get('total45'); //! =======> 👀 [TOTAL]
                          }
                          valueAddQyantaty45 += addtotal45;
                          data.put(
                              'total45', //! =======> 👀 [TOTAL]
                              valueAddQyantaty45);
                          add45color2 = int.parse(c2R45.text);
                          if (valueAdd45Color2 == 0) {
                            valueAdd45Color2 =
                                data.get('45color2'); //! =======> 👀 [COLOR 2]
                          }
                          valueAdd45Color2 += add45color2;
                          data.put(
                              '45color2', //! =======> 👀 [COLOR 2]
                              valueAdd45Color2);
                          t45.clear();
                          c2R45.clear();
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
