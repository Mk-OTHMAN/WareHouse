import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/variables/text_edit_controler_variables.dart';

class DeepF22 extends StatefulWidget {
  final int addQuantaty,
      addColor1,
      addColor2,
      deleteQuantaty,
      deleteColor1,
      deleteColor2;
  const DeepF22(
      //  ==============> this required variables un neccesary
      {
    super.key,
    required this.addQuantaty,
    required this.addColor1,
    required this.addColor2,
    required this.deleteQuantaty,
    required this.deleteColor1,
    required this.deleteColor2,
  });
  @override
  State<DeepF22> createState() => _DeepF22State();
}

class _DeepF22State extends State<DeepF22> {
  Box data = Hive.box('data');
  dynamic valueAddQyantatyFreezer22 = 0;
  int valueAddColor1Freezer22 = 0;
  int valueAddColor2Freezer22 = 0;
  int valueDeleteQuantatyFreezer22 = 0;
  int valueDeleteColor1Freezer22 = 0;
  int valueDeleteColor2Freezer22 = 0;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  validat() {
    var formdata = formkey.currentState!;
    if (formdata.validate()) {
      print('valid');
    } else {
      print('Not valid');
    }
  }

  //! ===================  1st function for test ===============================
  void doneGreen() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Center(
              child: Text(
                'Done',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            content: const Text('  all proccess complete  . . .  !'),
            actions: [
              Center(
                child: SizedBox(
                  width: 400,
                  height: 200,
                  child: Lottie.asset('Assets/lottie/DoneGreen.json'),
                ),
              ),
            ],
          );
        });
  }

  //!============================== 2nd function test =======================
  void errorDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Center(
              child: Text(
                'WRONG',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            content: const Text('         Please Add Quantaty And Color ... !'),
            actions: [
              SizedBox(
                width: 400,
                height: 200,
                child: Lottie.asset('Assets/lottie/Error.json'),
              ),
            ],
          );
        });
  }

  //!       ===================== 3rd function for test ===================
  void robotError() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Center(
              child: Text(
                'WRONG',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            content: const Text(
                '      not found number of total quantaty and color ... !'),
            actions: [
              Center(
                child: SizedBox(
                  width: 400,
                  height: 200,
                  child: Lottie.asset('Assets/lottie/Robot.json'),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    if (data.get('freezer22Quantaty') == null) {
      data.put('freezer22Quantaty', 0);
    }
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30))),
            child: Column(
              children: [
                Text('Add',
                    style: GoogleFonts.rowdies(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold)),

                // ###########  ROW BODY ########### //
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: Form(
                        key: formkey,
                        child: Column(
                          children: [
                            Text(
                              'total Quantaty',
                              style: GoogleFonts.eduSaBeginner(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            //  ######  sizedBox  ########
                            const SizedBox(height: 30),
                            //  ______tetxt form field  ______ //
                            SizedBox(
                              // height: 50,
                              width: 125,
                              child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Empty';
                                    }
                                    return null;
                                  },
                                  controller: freezer22Quntaty,
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
                              'SL Quantaty',
                              style: GoogleFonts.eduSaBeginner(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            //  ######  sizedBox  ########
                            const SizedBox(height: 30),
                            //  ______tetxt foem field  ______ //
                            SizedBox(
                              width: 125,
                              child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Empty';
                                    }
                                    return null;
                                  },
                                  controller: frezzer22Color1Quantaty,
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

                    // ############## column coolor quantaty ########
                    Expanded(
                      child: Form(
                        child: Column(
                          children: [
                            Text(
                              'CH Quantaty',
                              style: GoogleFonts.eduSaBeginner(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            //  ######  sizedBox  ########
                            const SizedBox(height: 30),
                            //  ______tetxt foem field  ______ //
                            SizedBox(
                              width: 125,
                              child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Empty ';
                                    }
                                    return null;
                                  },
                                  controller: freezer22Color2Quantaty,
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

                const SizedBox(
                  height: 100,
                ),
                // ________________ elevatedButton for all text form fields ___________________
                IconButton(
                    onPressed: () {
                      setState(() {
                        // _______ Check Quantaty & Color 1 & Color2 is Empty _____ //
                        if (freezer22Quntaty.text.isEmpty &&
                            frezzer22Color1Quantaty.text.isEmpty &&
                            freezer22Color2Quantaty.text.isEmpty) {
                          errorDialog();
                          //_________ case add at one time 3*1 _____________
                        } else if (freezer22Quntaty.text.isNotEmpty &&
                            frezzer22Color1Quantaty.text.isNotEmpty &&
                            freezer22Color2Quantaty.text.isNotEmpty) {
                          int addQuntatyFreezer22 =
                              int.parse(freezer22Quntaty.text);
                          int addColor1Freezer22 =
                              int.parse(frezzer22Color1Quantaty.text);
                          int addColor2Freezer22 =
                              int.parse(freezer22Color2Quantaty.text);
                          if (valueAddQyantatyFreezer22 == 0) {
                            valueAddQyantatyFreezer22 =
                                data.get('freezer22Quantaty');
                            valueAddQyantatyFreezer22 += addQuntatyFreezer22;
                            data.put(
                                'freezer22Quantaty', valueAddQyantatyFreezer22);
                          }

                          if (valueAddColor1Freezer22 == 0) {
                            valueAddColor1Freezer22 =
                                data.get('freezer22color1');
                            valueAddColor1Freezer22 += addColor1Freezer22;
                            data.put(
                                'freezer22color1', valueAddColor1Freezer22);
                          }

                          if (valueAddColor2Freezer22 == 0) {
                            valueAddColor2Freezer22 =
                                data.get('freezer22color2');
                            valueAddColor2Freezer22 += addColor2Freezer22;
                            data.put(
                                'freezer22color2', valueAddColor2Freezer22);
                          }

                          doneGreen();
                          freezer22Quntaty.clear();
                          frezzer22Color1Quantaty.clear();
                          freezer22Color2Quantaty.clear();
                        }
                        // ________ Check if user write in Quantaty Only ________ //
                        else if (frezzer22Color1Quantaty.text.isEmpty &&
                            freezer22Color2Quantaty.text.isEmpty) {
                          errorDialog();
                          freezer22Quntaty.clear();
                        }
                        // ________ Check if user write in Color 1 Only _______ //
                        else if (freezer22Quntaty.text.isEmpty &&
                            freezer22Color2Quantaty.text.isEmpty) {
                          errorDialog();
                          frezzer22Color1Quantaty.clear();
                        }
                        // ________ check if user write in color 2 only _________ //
                        else if (freezer22Quntaty.text.isEmpty &&
                            frezzer22Color1Quantaty.text.isEmpty) {
                          errorDialog();
                          freezer22Color2Quantaty.clear();
                        }
                        // _______ check if user write on Color 1 and Color 2 only ______ //
                        else if (freezer22Quntaty.text.isEmpty) {
                          errorDialog();
                          frezzer22Color1Quantaty.clear();
                          freezer22Color2Quantaty.clear();
                        }
                        // _________ Add Proccess for All Quantaty and color 1 _______ //
                        else if (freezer22Color2Quantaty.text.isEmpty) {
                          int addQuntatyFreezer22 =
                              int.parse(freezer22Quntaty.text);
                          if (valueAddQyantatyFreezer22 == 0) {
                            if (data.get('freezer22Qantaty') == null) {
                              data.put('freezer22Qantaty', 0);
                            }
                            valueAddQyantatyFreezer22 =
                                data.get('freezer22Quantaty');
                          }
                          valueAddQyantatyFreezer22 += addQuntatyFreezer22;
                          data.put(
                              'freezer22Quantaty', valueAddQyantatyFreezer22);
                          int addColor1Freezer22 =
                              int.parse(frezzer22Color1Quantaty.text);
                          if (valueAddColor1Freezer22 == 0) {
                            if (data.get('freezer22color1') == null) {
                              data.put('freezer22color1', 0);
                            }
                            valueAddColor1Freezer22 =
                                data.get('freezer22color1');
                          }
                          valueAddColor1Freezer22 += addColor1Freezer22;
                          data.put('freezer22color1', valueAddColor1Freezer22);
                          freezer22Quntaty.clear();
                          frezzer22Color1Quantaty.clear();
                          Navigator.pop(context);
                          doneGreen();
                        }
                        // _________ Add Proccess for All Quantaty & Color 2 Proccess ________ //
                        else {
                          int addQuntatyFreezer22 =
                              int.parse(freezer22Quntaty.text);
                          if (valueAddQyantatyFreezer22 == 0) {
                            valueAddQyantatyFreezer22 =
                                data.get('freezer22Quantaty');
                          }
                          valueAddQyantatyFreezer22 += addQuntatyFreezer22;
                          data.put(
                              'freezer22Quantaty', valueAddQyantatyFreezer22);
                          int addColor2Freezer22 =
                              int.parse(freezer22Color2Quantaty.text);
                          if (valueAddColor2Freezer22 == 0) {
                            if (data.get('freezer22color2') == null) {
                              data.put('freezer22color2', 0);
                            }
                            valueAddColor2Freezer22 =
                                data.get('freezer22color2');
                          }
                          valueAddColor2Freezer22 += addColor2Freezer22;
                          data.put('freezer22color2', valueAddColor2Freezer22);
                          freezer22Quntaty.clear();
                          freezer22Color2Quantaty.clear();
                          Navigator.pop(context);
                          doneGreen();
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

        // ______________ seconde container ____________
        Expanded(
          flex: 2,
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.only(topRight: Radius.circular(30))),
            child: Column(
              children: [
                Text('Sell',
                    style: GoogleFonts.rowdies(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold)),
                // ________  Row body for text form field ______ //
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'total Quantaty',
                            style: GoogleFonts.eduSaBeginner(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          //  ######  sizedBox  ########
                          const SizedBox(height: 30),
                          //  ______tetxt form field  ______ //
                          SizedBox(
                            width: 125,
                            child: TextFormField(
                                controller: deleteFreezer22Quantaty,
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
                            'SL Quantaty',
                            style: GoogleFonts.eduSaBeginner(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          //  ######  sizedBox  ########
                          const SizedBox(height: 30),
                          //  ______tetxt foem field  ______ //
                          SizedBox(
                            width: 125,
                            child: TextFormField(
                                controller: deleteFreezer22Color1Quntaty,
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
                            'CH Quantaty',
                            style: GoogleFonts.eduSaBeginner(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          //  ######  sizedBox  ########
                          const SizedBox(height: 30),
                          //  ______tetxt foem field  ______ //
                          SizedBox(
                            width: 125,
                            child: TextFormField(
                                controller: deleteFreezer22Color2Quantaty,
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
                const SizedBox(
                  height: 100,
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        // __________ check if Quantaty & color 1 & Color 2 Empty _______ //
                        if (deleteFreezer22Quantaty.text.isEmpty &&
                            deleteFreezer22Color1Quntaty.text.isEmpty &&
                            deleteFreezer22Color2Quantaty.text.isEmpty) {
                          robotError();
                        }
                        // __________________  case delete at one time 3*1 _________
                        else if (deleteFreezer22Quantaty.text.isNotEmpty &&
                            deleteFreezer22Color1Quntaty.text.isNotEmpty &&
                            deleteFreezer22Color2Quantaty.text.isNotEmpty) {
                          int deletequantaty =
                              int.parse(deleteFreezer22Quantaty.text);
                          int deletecolor1 =
                              int.parse(deleteFreezer22Color1Quntaty.text);
                          int deletecolor2 =
                              int.parse(deleteFreezer22Color2Quantaty.text);
                          if (deletequantaty > data.get('freezer22Quantaty') &&
                                  data.get('freezer22Quantaty') >= 0 ||
                              deletecolor1 > data.get('freezer22color1') &&
                                  data.get('freezer22color1') >= 0 ||
                              deletecolor2 > data.get('freezer22color2') &&
                                  data.get('freezer22color2') >= 0) {
                            robotError();
                            deleteFreezer22Quantaty.clear();
                            deleteFreezer22Color1Quntaty.clear();
                            deleteFreezer22Color2Quantaty.clear();
                          } else {
                            valueDeleteQuantatyFreezer22 =
                                data.get('freezer22Quantaty') - deletequantaty;
                            data.put('freezer22Quantaty',
                                valueDeleteQuantatyFreezer22);
                            valueDeleteColor1Freezer22 =
                                data.get('freezer22color1') - deletecolor1;
                            data.put(
                                'freezer22color1', valueDeleteColor1Freezer22);
                            valueDeleteColor2Freezer22 =
                                data.get('freezer22color2') - deletecolor2;
                            data.put(
                                'freezer22color2', valueDeleteColor2Freezer22);

                            doneGreen();
                            deleteFreezer22Quantaty.clear();
                            deleteFreezer22Color1Quntaty.clear();
                            deleteFreezer22Color2Quantaty.clear();
                          }
                        }
                        // _______ chek if recived from user Quantaty only ________ //
                        else if (deleteFreezer22Color1Quntaty.text.isEmpty &&
                            deleteFreezer22Color2Quantaty.text.isEmpty) {
                          robotError();
                          deleteFreezer22Quantaty.clear();
                        }
                        // __________ check if recived from user color 1 only ________ //
                        else if (deleteFreezer22Quantaty.text.isEmpty &&
                            deleteFreezer22Color2Quantaty.text.isEmpty) {
                          robotError();
                          deleteFreezer22Color1Quntaty.clear();
                        }
                        // ________ chek if recived from user color 2 only _________ //
                        else if (deleteFreezer22Quantaty.text.isEmpty &&
                            deleteFreezer22Color1Quntaty.text.isEmpty) {
                          robotError();
                          deleteFreezer22Color2Quantaty.clear();
                        }
                        // _____________ Check if user write input in color 1 and color 2 only _______ //
                        else if (deleteFreezer22Quantaty.text.isEmpty) {
                          robotError();
                          deleteFreezer22Color1Quntaty.clear();
                          deleteFreezer22Color2Quantaty.clear();
                        }

                        // _____________ Check All Quantaty And input from User _________ //
                        else {
                          if (data.get('freezer22Quantaty') == 0) {
                            int deletequantaty =
                                int.parse(deleteFreezer22Quantaty.text);
                            if (deletequantaty >
                                data.get('freezer22Quantaty')) {
                              robotError();
                              deleteFreezer22Quantaty.clear();
                              deleteFreezer22Color1Quntaty.clear();
                            }
                          }
                          // ____________ Check Color 1 Quantaty And input frpm User ______________ //
                          else if (data.get('freezer22color1') == 0 &&
                              data.get('freezer22color1') > 0) {
                            int deletecolor1 =
                                int.parse(deleteFreezer22Color1Quntaty.text);
                            if (deletecolor1 > data.get('freezer22color1') &&
                                data.get('freezer22color1') > 0) {
                              robotError();
                            }
                            deleteFreezer22Color1Quntaty.clear();
                          }
                          // ___________ Check Color 2 Quantaty And input from User _____________
                          else if (data.get('freezer22color2') == 0 &&
                              data.get('freezer22color2') > 0) {
                            int deletecolor2 =
                                int.parse(deleteFreezer22Color2Quantaty.text);
                            if (deletecolor2 > data.get('freezer22color2') &&
                                data.get('freezer22color2') > 0) {
                              robotError();
                            }
                          }
                          // ___________ Case Delete From All Qantaty And Color 1 Proccess
                          else if (deleteFreezer22Color2Quantaty.text.isEmpty) {
                            if (data.get('freezer22Quantaty') > 0 ||
                                data.get('freezer22color1') > 0) {
                              int deletequantaty =
                                  int.parse(deleteFreezer22Quantaty.text);
                              int deletecolor1 =
                                  int.parse(deleteFreezer22Color1Quntaty.text);

                              if (deletequantaty >
                                      data.get('freezer22Quantaty') ||
                                  deletecolor1 > data.get('freezer22color1')) {
                                robotError();
                                // deleteFreezer22Quantaty.clear();
                                // deleteFreezer22Color1Quntaty.clear();
                              } else {
                                int deletequantaty = // ### remeber explosion code @@@@@@@@

                                    int.parse(deleteFreezer22Quantaty.text);
                                int deletecolor1 = int.parse(
                                    deleteFreezer22Color1Quntaty.text);
                                valueDeleteQuantatyFreezer22 =
                                    data.get('freezer22Quantaty') -
                                        deletequantaty;
                                data.put('freezer22Quantaty',
                                    valueDeleteQuantatyFreezer22);
                                // deleteFreezer22Quantaty.clear();

                                valueDeleteColor1Freezer22 =
                                    data.get('freezer22color1') - deletecolor1;
                                data.put('freezer22color1',
                                    valueDeleteColor1Freezer22);

                                // deleteFreezer22Color1Quntaty.clear();

                                doneGreen();
                              }
                            }
                            deleteFreezer22Quantaty.clear();
                            deleteFreezer22Color1Quntaty.clear();
                          }

                          // _______________ Case All Quantaty delete Proccess And Color 2 __________ //
                          else if (deleteFreezer22Color1Quntaty.text.isEmpty) {
                            if (data.get('freezer22Quantaty') > 0 ||
                                data.get('freezer22color2') > 0) {
                              int deletequantaty =
                                  int.parse(deleteFreezer22Quantaty.text);
                              int deletecolor2 =
                                  int.parse(deleteFreezer22Color2Quantaty.text);
                              if (deletequantaty >
                                      data.get('freezer22Quantaty') ||
                                  deletecolor2 > data.get('freezer22color2')) {
                                robotError();
                                deleteFreezer22Quantaty.clear();
                                deleteFreezer22Color2Quantaty.clear();
                              } else {
                                int deletequantaty =
                                    int.parse(deleteFreezer22Quantaty.text);
                                int deletecolor2 = int.parse(
                                    deleteFreezer22Color2Quantaty.text);
                                valueDeleteQuantatyFreezer22 =
                                    data.get('freezer22Quantaty') -
                                        deletequantaty;
                                data.put('freezer22Quantaty',
                                    valueDeleteQuantatyFreezer22);
                                deleteFreezer22Quantaty.clear();

                                valueDeleteColor2Freezer22 =
                                    data.get('freezer22color2') - deletecolor2;
                                data.put('freezer22color2',
                                    valueDeleteColor2Freezer22);

                                deleteFreezer22Color2Quantaty.clear();
                                doneGreen();
                              }
                            }
                          }
                          deleteFreezer22Quantaty.clear();
                          deleteFreezer22Color2Quantaty.clear();
                        }
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
