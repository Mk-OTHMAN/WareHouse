import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';

class Tosh33t extends StatefulWidget {
  const Tosh33t({super.key});

  @override
  State<Tosh33t> createState() => _Tosh33tState();
}

class _Tosh33tState extends State<Tosh33t> {
  Box data = Hive.box('data');
  //! variables for calculate proccess to data
  int valueAddQyantaty33T = 0;
  int valueAdd33TColor1 = 0;
  int valueAdd33TColor2 = 0;
  int valueDeleteQuantaty33T = 0;
  int valueDelete33TColor1 = 0;
  int valueDelete33TColor2 = 0;
  //! variables for names data box
  // String qua = 'total18';
  // String color1 = '18color1';
  // String color2 = '18color2';
  //! variables for parseing proccess at controller
  int addtotal33T = 0;
  int add33Tcolor1 = 0;
  int add33Tcolor2 = 0;
  int dtotal33T = 0;
  int d33Tcolor1 = 0;
  int d33Tcolor2 = 0;

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
    TextEditingController total33T = TextEditingController();
    TextEditingController r33Tcolor1 = TextEditingController();
    TextEditingController r33Tcolor2 = TextEditingController();
    TextEditingController deletetotal33T = TextEditingController();
    TextEditingController delete33Tcolor1 = TextEditingController();
    TextEditingController delete33Tcolor2 = TextEditingController();

    var t33T = total33T;
    var c1R33T = r33Tcolor1;
    var c2R33T = r33Tcolor2;
    var dt33T = deletetotal33T;
    var dc1R33T = delete33Tcolor1;
    var dc2R33T = delete33Tcolor2;

    if (data.get('total33T') == null) {
      data.put('total33T', 0);
    }
    if (data.get('33Tcolor1') == null) {
      data.put('33Tcolor1', 0);
    }
    if (data.get('33Tcolor2') == null) {
      data.put('33Tcolor2', 0);
    }

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
                            child: Form(
                              key: formkey,
                              child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Empty';
                                    }
                                    return null;
                                  },
                                  controller: total33T,
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
                          ),
                        ],
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
                                  controller: r33Tcolor1,
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
                                  controller: r33Tcolor2,
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
                        if (t33T.text.isEmpty &&
                            c1R33T.text.isEmpty &&
                            c2R33T.text.isEmpty) {
                          errorDialog(
                              'Please Add Quantity And Color , you must add Quantity and at least one color ..!');
                        }

                        //? ________ Check if user write in Quantaty Only ________ //
                        else if (c1R33T.text.isEmpty && c2R33T.text.isEmpty) {
                          errorDialog('you must choose at least one color.');
                          t33T.clear();
                        }
                        // ?________ Check if user write in Color 1 Only _______ //
                        else if (t33T.text.isEmpty && c2R33T.text.isEmpty) {
                          errorDialog(
                              "you must choose the Quantity,that's wrong add color only");
                          c1R33T.clear();
                        }
                        //? ________ check if user write in color 2 only _________ //
                        else if (t33T.text.isEmpty && c1R33T.text.isEmpty) {
                          errorDialog(
                              "you must choose the Quantity, that's wrong add color only");
                          c2R33T.clear();
                        }
                        //? _______ check if user write on Color 1 and Color 2 only ______ //
                        else if (t33T.text.isEmpty) {
                          errorDialog(
                              "you must choose the Quantity, that's wrong add color only");
                          c1R33T.clear();
                          c2R33T.clear();
                        }
                        //!_________ case add at one time 3*1 _____________
                        else if (t33T.text.isNotEmpty &&
                            c1R33T.text.isNotEmpty &&
                            c2R33T.text.isNotEmpty) {
                          addtotal33T = int.parse(t33T.text);
                          add33Tcolor1 = int.parse(c1R33T.text);
                          add33Tcolor2 = int.parse(c2R33T.text);
                          if (valueAddQyantaty33T == 0) {
                            valueAddQyantaty33T =
                                data.get('total33T'); //! =========> 👀
                            valueAddQyantaty33T += addtotal33T;
                            data.put(
                                'total33T', valueAddQyantaty33T); //! =====> 👀
                          }

                          if (valueAdd33TColor1 == 0) {
                            valueAdd33TColor1 =
                                data.get('33Tcolor1'); //!  ==========> 👀
                            valueAdd33TColor1 += add33Tcolor1;
                            data.put('33Tcolor1',
                                valueAdd33TColor1); //! ========> 👀
                          }

                          if (valueAdd33TColor2 == 0) {
                            valueAdd33TColor2 =
                                data.get('33Tcolor2'); // ! =======> 👀
                            valueAdd33TColor2 += add33Tcolor2;
                            data.put(
                                '33Tcolor2', valueAdd33TColor2); //! =======>👀
                          }
                          doneGreen(
                              'success process, and well done for remembering to add the product');
                          total33T.clear();
                          r33Tcolor1.clear();
                          r33Tcolor2.clear();
                        }
                        // !_________ Add Proccess for All Quantaty and color 1 _______ //
                        else if (c2R33T.text.isEmpty) {
                          addtotal33T = int.parse(t33T.text);
                          if (valueAddQyantaty33T == 0) {
                            valueAddQyantaty33T =
                                data.get('total33T'); //! =========> 👀
                          }
                          valueAddQyantaty33T += addtotal33T;
                          data.put(
                              'total33T', valueAddQyantaty33T); //! ======> 👀
                          add33Tcolor1 = int.parse(c1R33T.text);
                          if (valueAdd33TColor1 == 0) {
                            valueAdd33TColor1 =
                                data.get('33Tcolor1'); //! =======> 👀
                          }
                          valueAdd33TColor1 += add33Tcolor1;
                          data.put(
                              '33Tcolor1', valueAdd33TColor1); //! =======> 👀
                          t33T.clear();
                          c1R33T.clear();
                          Navigator.pop(context);
                          doneGreen(
                              'success process, and well done for remembering to add the product');
                        }
                        // !_________ Add Proccess for All Quantaty & Color 2  ________ //
                        else {
                          addtotal33T = int.parse(t33T.text);
                          if (valueAddQyantaty33T == 0) {
                            valueAddQyantaty33T =
                                data.get('total33T'); //! =======> 👀
                          }
                          valueAddQyantaty33T += addtotal33T;
                          data.put(
                              'total33T', valueAddQyantaty33T); //! =======> 👀
                          add33Tcolor2 = int.parse(c2R33T.text);
                          if (valueAdd33TColor2 == 0) {
                            valueAdd33TColor2 =
                                data.get('33Tcolor2'); //! =======> 👀
                          }
                          valueAdd33TColor2 += add33Tcolor2;
                          data.put(
                              '33Tcolor2', valueAdd33TColor2); //! =======> 👀
                          t33T.clear();
                          c2R33T.clear();
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
                                controller: deletetotal33T,
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
                                controller: delete33Tcolor1,
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
                                controller: delete33Tcolor2,
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
                        if (dt33T.text.isEmpty &&
                            dc1R33T.text.isEmpty &&
                            dc2R33T.text.isEmpty) {
                          robotError(
                              'Please Add Quantity And Color , you must add Quantity and at least one color ..!');
                        }
                        // ?_______ chek if recived from user Quantaty only ________ //
                        else if (dc1R33T.text.isEmpty && dc2R33T.text.isEmpty) {
                          robotError('you must choose at least one color.');
                          dt33T.clear();
                        }
                        //? __________ check if recived from user color 1 only ________ //
                        else if (dt33T.text.isEmpty && dc2R33T.text.isEmpty) {
                          robotError(
                              "you must choose the Quantity,that's wrong add color only");
                          dc1R33T.clear();
                        }
                        // ?________ chek if recived from user color 2 only _________ //
                        else if (dt33T.text.isEmpty && dc1R33T.text.isEmpty) {
                          robotError(
                              "you must choose the Quantity,that's wrong add color only");
                          dc2R33T.clear();
                        }
                        // ?_____________ Check if user write input in color 1 and color 2 only _______ //
                        else if (dt33T.text.isEmpty) {
                          robotError(
                              "you must choose the Quantity,that's wrong add color only");
                          dc1R33T.clear();
                          dc2R33T.clear();
                        }

                        //? _____________ Check All Quantaty And input from User _________ //
                        else if (data.get('total33T') == 0) {
                          //! =======> 👀
                          dtotal33T = int.parse(deletetotal33T.text);
                          if (dtotal33T > data.get('total33T')) {
                            //! =======> 👀
                            robotError(
                                '''sorry, the number is greater than the stored quantity, the stored quantity is zero
''');
                            dt33T.clear();
                            dc1R33T.clear();
                          }
                        }
                        //? ____________ Check Color 1 Quantaty And input frpm User ______________ //
                        else if (data.get('33Tcolor1') == 0 || d33Tcolor1 > 0) {
                          //! =======> 👀
                          robotError(
                              '''sorry, the number is greater than the stored quantity, the stored quantity of color one is zero
''');
                          if (d33Tcolor1 >
                                  data.get('33Tcolor1') && //! =======> 👀
                              data.get('33Tcolor1') > 0) {
                            //! =======> 👀
                            robotError(
                                '''sorry, the number is greater than the stored quantity, the stored quantity of color one
''');
                          }
                          dc1R33T.clear();
                        }
                        //? ___________ Check Color 2 Quantaty And input from User _____________
                        else if (data.get('33Tcolor2') == 0 || d33Tcolor1 > 0) {
                          //! =======> 👀
                          robotError(
                              '''sorry, the number is greater than the stored quantity, the stored quantity of color two is zero
''');
                          if (d33Tcolor2 >
                                  data.get('33Tcolor2') && //! =======> 👀
                              data.get('33Tcolor2') > 0) {
                            //! =======> 👀
                            robotError(
                                '''sorry, the number is greater than the stored quantity, the stored quantity of color two
''');
                          }
                        }
                        //! __________________  case delete at one time 3*1 _________
                        else if (dt33T.text.isNotEmpty &&
                            dc1R33T.text.isNotEmpty &&
                            dc2R33T.text.isNotEmpty) {
                          dtotal33T = int.parse(dt33T.text);
                          d33Tcolor1 = int.parse(dc1R33T.text);
                          d33Tcolor2 = int.parse(dc2R33T.text);
                          if (dtotal33T >
                                      data.get('total33T') && //! =======> 👀
                                  data.get('total33T') >= 0 || //! =======> 👀
                              d33Tcolor1 >
                                      data.get('33Tcolor1') && //! =======> 👀
                                  data.get('33Tcolor1') >= 0 || //! =======> 👀
                              d33Tcolor2 >
                                      data.get('33Tcolor2') && //! =======> 👀
                                  data.get('33Tcolor2') >= 0) {
                            //! =======> 👀
                            robotError(
                                'please check on the total Quantity and colors Quantity');
                            dt33T.clear();
                            dc1R33T.clear();
                            dc2R33T.clear();
                          } else {
                            dtotal33T = int.parse(dt33T.text);
                            d33Tcolor1 = int.parse(dc1R33T.text);
                            d33Tcolor2 = int.parse(dc2R33T.text);
                            valueDeleteQuantaty33T = data.get('total33T') -
                                dtotal33T; //! =======> 👀
                            data.put('total33T',
                                valueDeleteQuantaty33T); //! =======> 👀
                            valueDelete33TColor1 = data.get('33Tcolor1') -
                                d33Tcolor1; //! =======> 👀
                            data.put('33Tcolor1',
                                valueDelete33TColor1); //! =======> 👀
                            valueDelete33TColor2 = data.get('33Tcolor2') -
                                d33Tcolor2; //! =======> 👀
                            data.put('33Tcolor2',
                                valueDelete33TColor2); //! =======> 👀
                            doneGreen(
                                'success process, and well done for remembering to remove the product');
                            dt33T.clear();
                            dc1R33T.clear();
                            dc2R33T.clear();
                          }
                        }

                        //! ___________ Case Delete From All Qantaty And Color 1 Proccess
                        else if (dc2R33T.text.isEmpty) {
                          if (data.get('total33T') > 0 || //! =======> 👀
                              data.get('33Tcolor1') > 0) {
                            //! =======> 👀
                            dtotal33T = int.parse(dt33T.text);
                            d33Tcolor1 = int.parse(dc1R33T.text);

                            if (dtotal33T >
                                    data.get('total33T') || //! =======> 👀
                                d33Tcolor1 > data.get('33Tcolor1')) {
                              //! =======> 👀
                              robotError(
                                  'sorry, the number is greater than the stored quantity,please check on color or total Quantity');
                            } else {
                              dtotal33T = int.parse(dt33T.text);
                              d33Tcolor1 = int.parse(dc1R33T.text);
                              valueDeleteQuantaty33T = data.get('total33T') -
                                  dtotal33T; //! =======> 👀
                              data.put('total33T',
                                  valueDeleteQuantaty33T); //! =======> 👀

                              valueDelete33TColor1 = data.get('33Tcolor1') -
                                  d33Tcolor1; //! =======> 👀
                              data.put('33Tcolor1',
                                  valueDelete33TColor1); //! =======> 👀

                              doneGreen(
                                  'success process, and well done for remembering to remove the product');
                            }
                          }
                          dt33T.clear();
                          dc1R33T.clear();
                        }

                        // !_______________ Case All Quantaty delete Proccess And Color 2 __________ //
                        else if (dc1R33T.text.isEmpty) {
                          if (data.get('total33T') > 0 || //! =======> 👀
                              data.get('33Tcolor2') > 0) {
                            //! =======> 👀
                            dtotal33T = int.parse(dt33T.text);
                            d33Tcolor2 = int.parse(dc2R33T.text);
                          }
                          if (dtotal33T >
                                  data.get('total33T') || //! =======> 👀
                              d33Tcolor2 > data.get('33Tcolor2')) {
                            //! =======> 👀
                            robotError(
                                'sorry, the number is greater than the stored quantity,please check on color or total Quantity');
                            dt33T.clear();
                            dc2R33T.clear();
                          } else {
                            dtotal33T = int.parse(dt33T.text);
                            d33Tcolor2 = int.parse(dc2R33T.text);
                            valueDeleteQuantaty33T = data.get('total33T') -
                                dtotal33T; //! =======> 👀
                            data.put('total33T',
                                valueDeleteQuantaty33T); //! =======> 👀
                            // dt18.clear();

                            valueDelete33TColor2 = data.get('33Tcolor2') -
                                d33Tcolor2; //! =======> 👀
                            data.put('33Tcolor2',
                                valueDelete33TColor2); //! =======> 👀

                            //dc2f18.clear();
                            doneGreen(
                                'success process, and well done for remembering to remove the product');
                          }
                        }

                        dt33T.clear();
                        dc2R33T.clear();
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
