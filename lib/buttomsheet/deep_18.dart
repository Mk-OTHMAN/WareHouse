import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';

class DeepF18 extends StatefulWidget {
  const DeepF18({super.key});

  @override
  State<DeepF18> createState() => _DeepF18State();
}

class _DeepF18State extends State<DeepF18> {
  Box data = Hive.box('data');
  //! variables for calculate proccess to data
  int valueAddQyantatyFreezer18 = 0;
  int valueAddColor1Freezer18 = 0;
  int valueAddColor2Freezer18 = 0;
  int valueDeleteQuantatyFreezer18 = 0;
  int valueDeleteColor1Freezer18 = 0;
  int valueDeleteColor2Freezer18 = 0;
  //! variables for names data box
  // String qua = 'total18';
  // String color1 = '18color1';
  // String color2 = '18color2';
  //! variables for parseing proccess at controller
  int addtotal18 = 0;
  int addcolor1f18 = 0;
  int addcolor2f18 = 0;
  int dtotal18 = 0;
  int dcolor1f18 = 0;
  int dcolor2f18 = 0;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  validat() {
    var formdata = formkey.currentState!;
    if (formdata.validate()) {
      print('valid');
    } else {
      print('Not valid');
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController qut = TextEditingController();
    TextEditingController color1f18 = TextEditingController();
    TextEditingController color2f18 = TextEditingController();
    TextEditingController deletetotal18 = TextEditingController();
    TextEditingController delete18color1 = TextEditingController();
    TextEditingController delete18color2 = TextEditingController();

    var t18 = qut;
    var c1f18 = color1f18;
    var c2f18 = color2f18;
    var dt18 = deletetotal18;
    var dc1f18 = delete18color1;
    var dc2f18 = delete18color2;
    //! ===================  1st function for test ===============================
    void doneGreen(String caseDescribe) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Center(
                child: Text(
                  'Done',
                  style: TextStyle(
                      fontSize: 5.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              content: Text(caseDescribe),
              actions: [
                Center(
                  child: SizedBox(
                    width: 100.w,
                    height: 50.h,
                    child: Lottie.asset('Assets/lottie/DoneGreen.json'),
                  ),
                ),
              ],
            );
          });
    }

    //!============================== 2nd function test =======================
    void errorDialog(String caseDescribe) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Center(
                child: Text(
                  'WRONG',
                  style: TextStyle(
                      fontSize: 5.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              content: Text(caseDescribe),
              actions: [
                SizedBox(
                  width: 120.w,
                  height: 75.h,
                  child: Lottie.asset('Assets/lottie/Error.json'),
                ),
              ],
            );
          });
    }

    //!       ===================== 3rd function for test ===================
    void robotError(String caseDescribe) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Center(
                child: Text(
                  'WRONG',
                  style: TextStyle(
                      fontSize: 5.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              content: Text(caseDescribe),
              actions: [
                Center(
                  child: SizedBox(
                    width: 130.w,
                    height: 75.h,
                    child: Lottie.asset('Assets/lottie/Robot.json'),
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
                // ###########  ROW BODY ########### //
                SizedBox(height: 25.h),
                Row(
                  children: [
                    Expanded(
                      child: Form(
                        key: formkey,
                        child: Column(
                          children: [
                            Text(
                              'total Quantity',
                              style: GoogleFonts.eduSaBeginner(
                                  color: Colors.black,
                                  fontSize: 7.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            //  ######  sizedBox  ########
                            SizedBox(height: 15.h),
                            //  ______tetxt form field  ______ //
                            SizedBox(
                              // height: 50,
                              width: 30.w,
                              child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Empty';
                                    }
                                    return null;
                                  },
                                  controller: qut,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]')),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: const InputDecoration(
                                    hintText: 'Enter Number',
                                    labelText: 'Enter Number',
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                    )),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //  ########### column color quantaty #########

                    Expanded(
                      child: Form(
                        child: Column(
                          children: [
                            Text(
                              'SL Quantity',
                              style: GoogleFonts.eduSaBeginner(
                                  color: Colors.black,
                                  fontSize: 7.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            //  ######  sizedBox  ########
                            SizedBox(height: 15.h),
                            //  ______tetxt foem field  ______ //
                            SizedBox(
                              width: 30.w,
                              child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Empty';
                                    }
                                    return null;
                                  },
                                  controller: color1f18,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]')),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: const InputDecoration(
                                    hintText: 'Enter Number',
                                    labelText: 'Enter Number',
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                    )),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // ############## column color quantaty ########
                    Expanded(
                      child: Form(
                        child: Column(
                          children: [
                            Text(
                              'CH Quantity',
                              style: GoogleFonts.eduSaBeginner(
                                  color: Colors.black,
                                  fontSize: 7.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            //  ######  sizedBox  ########
                            SizedBox(height: 15.h),
                            //  ______tetxt foem field  ______ //
                            SizedBox(
                              width: 30.w,
                              child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Empty ';
                                    }
                                    return null;
                                  },
                                  controller: color2f18,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]')),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: const InputDecoration(
                                    hintText: 'Enter Number',
                                    labelText: 'Enter Number',
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                    )),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),

                // ____________ sizedBox for Height __________

                SizedBox(
                  height: 150.h,
                ),
                // ________________ elevatedButton for all text form fields ___________________
                IconButton(
                    onPressed: () {
                      setState(() {
                        //?_______ Check Quantaty & Color 1 & Color is Empty _____ //
                        if (t18.text.isEmpty &&
                            c1f18.text.isEmpty &&
                            c2f18.text.isEmpty) {
                          errorDialog(
                              'Please Add Quantity And Color , you must add Quantity and at least one color ..!');
                        }

                        //? ________ Check if user write in Quantaty Only ________ //
                        else if (c1f18.text.isEmpty && c2f18.text.isEmpty) {
                          errorDialog('you must choose at least one color.');
                          t18.clear();
                        }
                        // ?________ Check if user write in Color 1 Only _______ //
                        else if (t18.text.isEmpty && c2f18.text.isEmpty) {
                          errorDialog(
                              "you must choose the Quantity,that's wrong add color only");
                          c1f18.clear();
                        }
                        //? ________ check if user write in color 2 only _________ //
                        else if (t18.text.isEmpty && c1f18.text.isEmpty) {
                          errorDialog(
                              "you must choose the Quantity, that's wrong add color only");
                          c2f18.clear();
                        }
                        //? _______ check if user write on Color 1 and Color 2 only ______ //
                        else if (t18.text.isEmpty) {
                          errorDialog(
                              "you must choose the Quantity, that's wrong add color only");
                          c1f18.clear();
                          c2f18.clear();
                        }
                        //!_________ case add at one time 3*1 _____________
                        else if (t18.text.isNotEmpty &&
                            c1f18.text.isNotEmpty &&
                            c2f18.text.isNotEmpty) {
                          addtotal18 = int.parse(t18.text);
                          addcolor1f18 = int.parse(c1f18.text);
                          addcolor2f18 = int.parse(c2f18.text);
                          if (valueAddQyantatyFreezer18 == 0) {
                            valueAddQyantatyFreezer18 = data.get('total18');
                            valueAddQyantatyFreezer18 += addtotal18;
                            data.put('total18', valueAddQyantatyFreezer18);
                          }

                          if (valueAddColor1Freezer18 == 0) {
                            valueAddColor1Freezer18 = data.get('color1');
                            valueAddColor1Freezer18 += addcolor1f18;
                            data.put('color1', valueAddColor1Freezer18);
                          }

                          if (valueAddColor2Freezer18 == 0) {
                            valueAddColor2Freezer18 = data.get('color2');
                            valueAddColor2Freezer18 += addcolor2f18;
                            data.put('color2', valueAddColor2Freezer18);
                          }
                          doneGreen(
                              'success process, and well done for remembering to add the product');
                          qut.clear();
                          color1f18.clear();
                          color2f18.clear();
                        }
                        // !_________ Add Proccess for All Quantaty and color 1 _______ //
                        else if (c2f18.text.isEmpty) {
                          addtotal18 = int.parse(t18.text);
                          if (valueAddQyantatyFreezer18 == 0) {
                            valueAddQyantatyFreezer18 = data.get('total18');
                          }
                          valueAddQyantatyFreezer18 += addtotal18;
                          data.put('total18', valueAddQyantatyFreezer18);
                          addcolor1f18 = int.parse(c1f18.text);
                          if (valueAddColor1Freezer18 == 0) {
                            valueAddColor1Freezer18 = data.get('color1');
                          }
                          valueAddColor1Freezer18 += addcolor1f18;
                          data.put('color1', valueAddColor1Freezer18);
                          t18.clear();
                          c1f18.clear();
                          Navigator.pop(context);
                          doneGreen(
                              'success process, and well done for remembering to add the product');
                        }
                        // !_________ Add Proccess for All Quantaty & Color 2  ________ //
                        else {
                          addtotal18 = int.parse(t18.text);
                          if (valueAddQyantatyFreezer18 == 0) {
                            valueAddQyantatyFreezer18 = data.get('total18');
                          }
                          valueAddQyantatyFreezer18 += addtotal18;
                          data.put('total18', valueAddQyantatyFreezer18);
                          addcolor2f18 = int.parse(c2f18.text);
                          if (valueAddColor2Freezer18 == 0) {
                            valueAddColor2Freezer18 = data.get('color2');
                          }
                          valueAddColor2Freezer18 += addcolor2f18;
                          data.put('color2', valueAddColor2Freezer18);
                          t18.clear();
                          c2f18.clear();
                          Navigator.pop(context);
                          doneGreen(
                              'success process, and well done for remembering to add the product');
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
        //! -----------------------------------------------------------------
        // ?______________ seconde container for delete proccess ____________
        //! -----------------------------------------------------------------
        Expanded(
          flex: 2,
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.only(topRight: Radius.circular(30))),
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Text('Sell',
                    style: GoogleFonts.rowdies(
                        color: Colors.black,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold)),
                // ________  Row body for text form field ______ //
                SizedBox(height: 25.h),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'total Quantity',
                            style: GoogleFonts.eduSaBeginner(
                                color: Colors.white,
                                fontSize: 7.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          //  ######  sizedBox  ########
                          SizedBox(height: 15.h),
                          //  ______tetxt form field  ______ //
                          SizedBox(
                            width: 30.w,
                            child: TextFormField(
                                controller: deletetotal18,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: const InputDecoration(
                                  hintText: 'Enter Number',
                                  labelText: 'Enter Number',
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Colors.black,
                                    style: BorderStyle.solid,
                                  )),
                                )),
                          ),
                        ],
                      ),
                    ),

                    //  ########### column color quantaty #########

                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'SL Quantity',
                            style: GoogleFonts.eduSaBeginner(
                                color: Colors.white,
                                fontSize: 7.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          //  ######  sizedBox  ########
                          SizedBox(height: 15.h),
                          //  ______tetxt foem field  ______ //
                          SizedBox(
                            width: 30.w,
                            child: TextFormField(
                                controller: delete18color1,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: const InputDecoration(
                                  hintText: 'Enter Number',
                                  labelText: 'Enter Number',
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Colors.black,
                                    style: BorderStyle.solid,
                                  )),
                                )),
                          )
                        ],
                      ),
                    ),

                    // ############## column coolor quantaty ########
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'CH Quantity',
                            style: GoogleFonts.eduSaBeginner(
                                color: Colors.white,
                                fontSize: 7.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          //  ######  sizedBox  ########
                          SizedBox(height: 15.h),
                          //  ______tetxt foem field  ______ //
                          SizedBox(
                            width: 30.w,
                            child: TextFormField(
                                controller: delete18color2,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: const InputDecoration(
                                  hintText: 'Enter Number',
                                  labelText: 'Enter Number',
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Colors.black,
                                    style: BorderStyle.solid,
                                  )),
                                )),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 150.h,
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        // ?__________ check if Quantaty & color 1 & Color 2 Empty _______ //
                        if (dt18.text.isEmpty &&
                            dc1f18.text.isEmpty &&
                            dc2f18.text.isEmpty) {
                          robotError(
                              'Please Add Quantity And Color , you must add Quantity and at least one color ..!');
                        }
                        // ?_______ chek if recived from user Quantaty only ________ //
                        else if (dc1f18.text.isEmpty && dc2f18.text.isEmpty) {
                          robotError('you must choose at least one color.');
                          dt18.clear();
                        }
                        //? __________ check if recived from user color 1 only ________ //
                        else if (dt18.text.isEmpty && dc2f18.text.isEmpty) {
                          robotError(
                              "you must choose the Quantity,that's wrong add color only");
                          dc1f18.clear();
                        }
                        // ?________ chek if recived from user color 2 only _________ //
                        else if (dt18.text.isEmpty && dc1f18.text.isEmpty) {
                          robotError(
                              "you must choose the Quantity,that's wrong add color only");
                          dc2f18.clear();
                        }
                        // ?_____________ Check if user write input in color 1 and color 2 only _______ //
                        else if (dt18.text.isEmpty) {
                          robotError(
                              "you must choose the Quantity,that's wrong add color only");
                          dc1f18.clear();
                          dc2f18.clear();
                        }

                        //? _____________ Check All Quantaty And input from User _________ //
                        else if (data.get('total18') == 0) {
                          dtotal18 = int.parse(deletetotal18.text);
                          if (dtotal18 > data.get('total18')) {
                            robotError(
                                '''sorry, the number is greater than the stored quantity, the stored quantity is zero
''');
                            dt18.clear();
                            dc1f18.clear();
                          }
                        }
                        //? ____________ Check Color 1 Quantaty And input frpm User ______________ //
                        else if (data.get('color1') == 0 || dcolor1f18 > 0) {
                          robotError(
                              '''sorry, the number is greater than the stored quantity, the stored quantity of color one is zero
''');
                          if (dcolor1f18 > data.get('color1') &&
                              data.get('color1') > 0) {
                            robotError(
                                '''sorry, the number is greater than the stored quantity, the stored quantity of color one
''');
                          }
                          dc1f18.clear();
                        }
                        //? ___________ Check Color 2 Quantaty And input from User _____________
                        else if (data.get('color2') == 0 || dcolor1f18 > 0) {
                          robotError(
                              '''sorry, the number is greater than the stored quantity, the stored quantity of color two is zero
''');
                          if (dcolor2f18 > data.get('color2') &&
                              data.get('color2') > 0) {
                            robotError(
                                '''sorry, the number is greater than the stored quantity, the stored quantity of color two
''');
                          }
                        }
                        //! __________________  case delete at one time 3*1 _________
                        else if (dt18.text.isNotEmpty &&
                            dc1f18.text.isNotEmpty &&
                            dc2f18.text.isNotEmpty) {
                          dtotal18 = int.parse(dt18.text);
                          dcolor1f18 = int.parse(dc1f18.text);
                          dcolor2f18 = int.parse(dc2f18.text);
                          if (dtotal18 > data.get('total18') &&
                                  data.get('total18') >= 0 ||
                              dcolor1f18 > data.get('color1') &&
                                  data.get('color1') >= 0 ||
                              dcolor2f18 > data.get('color2') &&
                                  data.get('color2') >= 0) {
                            robotError(
                                'please check on the total Quantity and colors Quantity');
                            dt18.clear();
                            dc1f18.clear();
                            dc2f18.clear();
                          } else {
                            dtotal18 = int.parse(dt18.text);
                            dcolor1f18 = int.parse(dc1f18.text);
                            dcolor2f18 = int.parse(dc2f18.text);
                            valueDeleteQuantatyFreezer18 =
                                data.get('total18') - dtotal18;
                            data.put('total18', valueDeleteQuantatyFreezer18);
                            valueDeleteColor1Freezer18 =
                                data.get('color1') - dcolor1f18;
                            data.put('color1', valueDeleteColor1Freezer18);
                            valueDeleteColor2Freezer18 =
                                data.get('color2') - dcolor2f18;
                            data.put('color2', valueDeleteColor2Freezer18);
                            doneGreen(
                                'success process, and well done for remembering to remove the product');
                            dt18.clear();
                            dc1f18.clear();
                            dc2f18.clear();
                          }
                        }

                        //! ___________ Case Delete From All Qantaty And Color 1 Proccess
                        else if (dc2f18.text.isEmpty) {
                          if (data.get('total18') > 0 ||
                              data.get('color1') > 0) {
                            dtotal18 = int.parse(dt18.text);
                            dcolor1f18 = int.parse(dc1f18.text);

                            if (dtotal18 > data.get('total18') ||
                                dcolor1f18 > data.get('color1')) {
                              robotError(
                                  'sorry, the number is greater than the stored quantity,please check on color or total Quantity');
                            } else {
                              dtotal18 = int.parse(dt18.text);
                              dcolor1f18 = int.parse(dc1f18.text);
                              valueDeleteQuantatyFreezer18 =
                                  data.get('total18') - dtotal18;
                              data.put('total18', valueDeleteQuantatyFreezer18);

                              valueDeleteColor1Freezer18 =
                                  data.get('color1') - dcolor1f18;
                              data.put('color1', valueDeleteColor1Freezer18);

                              doneGreen(
                                  'success process, and well done for remembering to remove the product');
                            }
                          }
                          dt18.clear();
                          dc1f18.clear();
                        }

                        // !_______________ Case All Quantaty delete Proccess And Color 2 __________ //
                        else if (dc1f18.text.isEmpty) {
                          if (data.get('total18') > 0 ||
                              data.get('color2') > 0) {
                            dtotal18 = int.parse(dt18.text);
                            dcolor2f18 = int.parse(dc2f18.text);
                          }
                          if (dtotal18 > data.get('total18') ||
                              dcolor2f18 > data.get('color2')) {
                            robotError(
                                'sorry, the number is greater than the stored quantity,please check on color or total Quantity');
                            dt18.clear();
                            dc2f18.clear();
                          } else {
                            dtotal18 = int.parse(dt18.text);
                            dcolor2f18 = int.parse(dc2f18.text);
                            valueDeleteQuantatyFreezer18 =
                                data.get('total18') - dtotal18;
                            data.put('total18', valueDeleteQuantatyFreezer18);
                            // dt18.clear();

                            valueDeleteColor2Freezer18 =
                                data.get('color2') - dcolor2f18;
                            data.put('color2', valueDeleteColor2Freezer18);

                            //dc2f18.clear();
                            doneGreen(
                                'success process, and well done for remembering to remove the product');
                          }
                        }

                        dt18.clear();
                        dc2f18.clear();
                      });
                    },
                    icon: const Icon(
                      Icons.delete_rounded,
                      size: 50,
                    ))
              ],
            ),
          ),
        )
      ],
    );
  }
}