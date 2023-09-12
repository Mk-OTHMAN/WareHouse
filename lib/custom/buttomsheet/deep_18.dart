import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  String qua = 'total18';
  String color1 = '18color1';
  String color2 = '18color2';
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

                const SizedBox(
                  height: 100,
                ),
                // ________________ elevatedButton for all text form fields ___________________
                IconButton(
                    onPressed: () {
                      setState(() {
                        //?_______ Check Quantaty & Color 1 & Color is Empty _____ //
                        if (t18.text.isEmpty &&
                            c1f18.text.isEmpty &&
                            c2f18.text.isEmpty) {
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
                                      '         Please Add Quantaty And Color ... !'),
                                  actions: [
                                    SizedBox(
                                      width: 400,
                                      height: 200,
                                      child: Lottie.asset(
                                          'Assets/lottie/Error.json'),
                                    ),
                                  ],
                                );
                              });
                          //*_________ case add at one time 3*1 _____________
                        } else if (t18.text.isNotEmpty &&
                            c1f18.text.isNotEmpty &&
                            c2f18.text.isNotEmpty) {
                          addtotal18 = int.parse(t18.text);
                          addcolor1f18 = int.parse(c1f18.text);
                          addcolor2f18 = int.parse(c2f18.text);
                          if (valueAddQyantatyFreezer18 == 0) {
                            valueAddQyantatyFreezer18 = data.get(qut);
                            valueAddQyantatyFreezer18 += addtotal18;
                            data.put(qut, valueAddQyantatyFreezer18);
                          }

                          if (valueAddColor1Freezer18 == 0) {
                            valueAddColor1Freezer18 = data.get(color1);
                            valueAddColor1Freezer18 += addcolor1f18;
                            data.put(color1, valueAddColor1Freezer18);
                          }

                          if (valueAddColor2Freezer18 == 0) {
                            valueAddColor2Freezer18 = data.get(color2);
                            valueAddColor2Freezer18 += addcolor2f18;
                            data.put(color2, valueAddColor2Freezer18);
                          }

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
                                  content: const Text(
                                      '         Add Proccess Sucsses . . .  !'),
                                  actions: [
                                    Center(
                                      child: SizedBox(
                                        width: 400,
                                        height: 200,
                                        child: Lottie.asset(
                                            'Assets/lottie/DoneGreen.json'),
                                      ),
                                    ),
                                  ],
                                );
                              });
                          t18.clear();
                          c1f18.clear();
                          c2f18.clear();
                        }
                        //? ________ Check if user write in Quantaty Only ________ //
                        else if (c1f18.text.isEmpty && c2f18.text.isEmpty) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                    title: const Center(
                                      child: Text(
                                        'Need To Color !',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ),
                                    content: const Text(
                                        '           You must be add at least one color ... !'),
                                    actions: [
                                      Center(
                                        child: SizedBox(
                                          width: 400,
                                          height: 200,
                                          child: Lottie.asset(
                                              'Assets/lottie/Error.json'),
                                        ),
                                      )
                                    ]);
                              });
                          t18.clear();
                        }
                        // ?________ Check if user write in Color 1 Only _______ //
                        else if (t18.text.isEmpty && c2f18.text.isEmpty) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                    title: const Center(
                                      child: Text(
                                        'Where Total Quantaty !',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ),
                                    content: const Text(
                                        '           You must be add total quantaty ... !'),
                                    actions: [
                                      Center(
                                        child: SizedBox(
                                          width: 400,
                                          height: 200,
                                          child: Lottie.asset(
                                              'Assets/lottie/Error.json'),
                                        ),
                                      )
                                    ]);
                              });
                          c1f18.clear();
                        }
                        //? ________ check if user write in color 2 only _________ //
                        else if (t18.text.isEmpty && c1f18.text.isEmpty) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                    title: const Center(
                                      child: Text(
                                        'Where Total Quantaty !',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ),
                                    content: const Text(
                                        '           You must be add total quantaty ... !'),
                                    actions: [
                                      Center(
                                        child: SizedBox(
                                          width: 400,
                                          height: 200,
                                          child: Lottie.asset(
                                              'Assets/lottie/Error.json'),
                                        ),
                                      )
                                    ]);
                              });
                          c2f18.clear();
                        }
                        //? _______ check if user write on Color 1 and Color 2 only ______ //
                        else if (t18.text.isEmpty) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                    title: const Center(
                                      child: Text(
                                        'Where Total Quantaty !',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ),
                                    content: const Text(
                                        '           You must be add total quantaty ... !'),
                                    actions: [
                                      Center(
                                        child: SizedBox(
                                          width: 400,
                                          height: 200,
                                          child: Lottie.asset(
                                              'Assets/lottie/Error.json'),
                                        ),
                                      )
                                    ]);
                              });
                          c1f18.clear();
                          c2f18.clear();
                        }
                        // *_________ Add Proccess for All Quantaty and color 1 _______ //
                        else if (c2f18.text.isEmpty) {
                          addtotal18 = int.parse(t18.text);
                          if (valueAddQyantatyFreezer18 == 0) {
                            valueAddQyantatyFreezer18 = data.get('total18');
                          }
                          valueAddQyantatyFreezer18 += addtotal18;
                          data.put(qut, valueAddQyantatyFreezer18);
                          addcolor1f18 = int.parse(c1f18.text);
                          if (valueAddColor1Freezer18 == 0) {
                            valueAddColor1Freezer18 = data.get(c1f18);
                          }
                          valueAddColor1Freezer18 += addcolor1f18;
                          data.put(c1f18, valueAddColor1Freezer18);
                          t18.clear();
                          c1f18.clear();
                          Navigator.pop(context);
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
                                  content: const Text(
                                      '         Add Proccess Sucsses . . .  !'),
                                  actions: [
                                    Center(
                                      child: SizedBox(
                                        width: 400,
                                        height: 200,
                                        child: Lottie.asset(
                                            'Assets/lottie/DoneGreen.json'),
                                      ),
                                    ),
                                  ],
                                );
                              });
                        }
                        // *_________ Add Proccess for All Quantaty & Color 2 Proccess ________ //
                        else {
                          addtotal18 = int.parse(t18.text);
                          if (valueAddQyantatyFreezer18 == 0) {
                            valueAddQyantatyFreezer18 = data.get(qut);
                          }
                          valueAddQyantatyFreezer18 += addtotal18;
                          data.put(qut, valueAddQyantatyFreezer18);
                          addcolor2f18 = int.parse(c2f18.text);
                          if (valueAddColor2Freezer18 == 0) {
                            valueAddColor2Freezer18 = data.get(color2);
                          }
                          valueAddColor2Freezer18 += addcolor2f18;
                          data.put(color2, valueAddColor2Freezer18);
                          t18.clear();
                          c2f18.clear();
                          Navigator.pop(context);
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
                                  content: const Text(
                                      '         Add Proccess Sucsses . . .  !'),
                                  actions: [
                                    Center(
                                      child: SizedBox(
                                        width: 400,
                                        height: 200,
                                        child: Lottie.asset(
                                            'Assets/lottie/DoneGreen.json'),
                                      ),
                                    ),
                                  ],
                                );
                              });
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

        // *______________ seconde container for delete proccess ____________
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
                const SizedBox(
                  height: 100,
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        // ?__________ check if Quantaty & color 1 & Color 2 Empty _______ //
                        if (dt18.text.isEmpty &&
                            dc1f18.text.isEmpty &&
                            dc2f18.text.isEmpty) {
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
                                        child: Lottie.asset(
                                            'Assets/lottie/Robot.json'),
                                      ),
                                    ),
                                  ],
                                );
                              });
                        }
                        //! __________________  case delete at one time 3*1 _________
                        else if (dt18.text.isNotEmpty &&
                            dc1f18.text.isNotEmpty &&
                            dc2f18.text.isNotEmpty) {
                          dtotal18 = int.parse(dt18.text);
                          dcolor1f18 = int.parse(dc1f18.text);
                          dcolor2f18 = int.parse(dc2f18.text);
                          if (dtotal18 > data.get(qut) && data.get(qut) >= 0 ||
                              dcolor1f18 > data.get(color1) &&
                                  data.get(color1) >= 0 ||
                              dcolor2f18 > data.get(color2) &&
                                  data.get(color2) >= 0) {
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
                                        '      please Check all Quantaty ... !'),
                                    actions: [
                                      Center(
                                        child: SizedBox(
                                          width: 400,
                                          height: 200,
                                          child: Lottie.asset(
                                              'Assets/lottie/Robot.json'),
                                        ),
                                      ),
                                    ],
                                  );
                                });
                            dt18.clear();
                            dc1f18.clear();
                            dc2f18.clear();
                          } else {
                            valueDeleteQuantatyFreezer18 =
                                data.get(qut) - dtotal18;
                            data.put(qut, valueDeleteQuantatyFreezer18);
                            valueDeleteColor1Freezer18 =
                                data.get(color1) - dcolor1f18;
                            data.put(color1, valueDeleteColor1Freezer18);
                            valueDeleteColor2Freezer18 =
                                data.get(color2) - dcolor2f18;
                            data.put(color2, valueDeleteColor2Freezer18);
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
                                    content: const Text(
                                        '  all proccess complete  . . .  !'),
                                    actions: [
                                      Center(
                                        child: SizedBox(
                                          width: 400,
                                          height: 200,
                                          child: Lottie.asset(
                                              'Assets/lottie/DoneGreen.json'),
                                        ),
                                      ),
                                    ],
                                  );
                                });
                            dt18.clear();
                            dc1f18.clear();
                            dc2f18.clear();
                          }
                        }
                        // ?_______ chek if recived from user Quantaty only ________ //
                        else if (dc1f18.text.isEmpty && dc2f18.text.isEmpty) {
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
                                      '      please Enter Quantaty of Color ... !'),
                                  actions: [
                                    Center(
                                      child: SizedBox(
                                        width: 400,
                                        height: 200,
                                        child: Lottie.asset(
                                            'Assets/lottie/Robot.json'),
                                      ),
                                    ),
                                  ],
                                );
                              });
                          dt18.clear();
                        }
                        //? __________ check if recived from user color 1 only ________ //
                        else if (dt18.text.isEmpty && dc2f18.text.isEmpty) {
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
                                      '      not found number of total quantaty pleade Check Again ... !'),
                                  actions: [
                                    Center(
                                      child: SizedBox(
                                        width: 400,
                                        height: 200,
                                        child: Lottie.asset(
                                            'Assets/lottie/Robot.json'),
                                      ),
                                    ),
                                  ],
                                );
                              });
                          dc1f18.clear();
                        }
                        // ?________ chek if recived from user color 2 only _________ //
                        else if (dt18.text.isEmpty && dc1f18.text.isEmpty) {
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
                                      '      not found number of total quantaty pleade Check Again .. !'),
                                  actions: [
                                    Center(
                                      child: SizedBox(
                                        width: 400,
                                        height: 200,
                                        child: Lottie.asset(
                                            'Assets/lottie/Robot.json'),
                                      ),
                                    ),
                                  ],
                                );
                              });
                          dc2f18.clear();
                        }
                        // ?_____________ Check if user write input in color 1 and color 2 only _______ //
                        else if (dt18.text.isEmpty) {
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
                                      '      Please Check Total Quantaty ... !'),
                                  actions: [
                                    Center(
                                      child: SizedBox(
                                        width: 400,
                                        height: 200,
                                        child: Lottie.asset(
                                            'Assets/lottie/Robot.json'),
                                      ),
                                    ),
                                  ],
                                );
                              });
                          dc1f18.clear();
                          dc2f18.clear();
                        }

                        //? _____________ Check All Quantaty And input from User _________ //
                        else {
                          if (data.get(qut) == 0) {
                            dtotal18 = int.parse(deletetotal18.text);
                            if (dtotal18 > data.get(qut)) {
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
                                          '      Please Check Total and Color Quantaty .. !'),
                                      actions: [
                                        Center(
                                          child: SizedBox(
                                            width: 400,
                                            height: 200,
                                            child: Lottie.asset(
                                                'Assets/lottie/Robot.json'),
                                          ),
                                        ),
                                      ],
                                    );
                                  });
                              dt18.clear();
                              dc1f18.clear();
                            }
                          }
                          //? ____________ Check Color 1 Quantaty And input frpm User ______________ //
                          else if (data.get(color1) == 0 &&
                              data.get(color1) > 0) {
                            dcolor1f18 = int.parse(dc1f18.text);
                            if (dcolor1f18 > data.get(color1) &&
                                data.get(color1) > 0) {
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
                                          'Total Quantaty Equale Zero Or Given Number Gratter than current Quantaty .. !'),
                                      actions: [
                                        Center(
                                          child: SizedBox(
                                            width: 400,
                                            height: 200,
                                            child: Lottie.asset(
                                                'Assets/lottie/Robot.json'),
                                          ),
                                        ),
                                      ],
                                    );
                                  });
                            }
                            dc1f18.clear();
                          }
                          //? ___________ Check Color 2 Quantaty And input from User _____________
                          else if (data.get(color2) == 0 &&
                              data.get(color2) > 0) {
                            dcolor2f18 = int.parse(dc2f18.text);
                            if (dcolor2f18 > data.get(color2) &&
                                data.get(color2) > 0) {
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
                                          'Total Quantaty Equale Zero Or Given Number Gratter than current Quantaty .. !'),
                                      actions: [
                                        Center(
                                          child: SizedBox(
                                            width: 400,
                                            height: 200,
                                            child: Lottie.asset(
                                                'Assets/lottie/Robot.json'),
                                          ),
                                        ),
                                      ],
                                    );
                                  });
                            }
                          }
                          //! ___________ Case Delete From All Qantaty And Color 1 Proccess
                          else if (dc2f18.text.isEmpty) {
                            if (data.get(qut) > 0 || data.get(color1) > 0) {
                              dtotal18 = int.parse(dt18.text);
                              dcolor1f18 = int.parse(dc1f18.text);

                              if (dtotal18 > data.get(qut) ||
                                  dcolor1f18 > data.get(color1)) {
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
                                            'Total Quantaty Equale Zero Or Given Number Gratter than current Quantaty .. !'),
                                        actions: [
                                          Center(
                                            child: SizedBox(
                                              width: 400,
                                              height: 200,
                                              child: Lottie.asset(
                                                  'Assets/lottie/Robot.json'),
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                              } else {
                                dtotal18 = int.parse(dt18.text);
                                dcolor1f18 = int.parse(dc1f18.text);
                                valueDeleteQuantatyFreezer18 =
                                    data.get(qut) - dtotal18;
                                data.put(qut, valueDeleteQuantatyFreezer18);

                                valueDeleteColor1Freezer18 =
                                    data.get(color1) - dcolor1f18;
                                data.put(color1, valueDeleteColor1Freezer18);

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
                                        content: const Text(
                                            '  all proccess complete  . . .  !'),
                                        actions: [
                                          Center(
                                            child: SizedBox(
                                              width: 400,
                                              height: 200,
                                              child: Lottie.asset(
                                                  'Assets/lottie/DoneGreen.json'),
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                              }
                            }
                            dt18.clear();
                            dc1f18.clear();
                          }

                          // !_______________ Case All Quantaty delete Proccess And Color 2 __________ //
                          else if (dc1f18.text.isEmpty) {
                            if (data.get(qut) > 0 || data.get(color2) > 0) {
                              dtotal18 = int.parse(dt18.text);
                              dcolor2f18 = int.parse(dc2f18.text);
                              if (dtotal18 > data.get(qut) ||
                                  dcolor2f18 > data.get(color2)) {
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
                                            'Total Quantaty Equale Zero Or Given Number Gratter than current Quantaty .. !'),
                                        actions: [
                                          Center(
                                            child: SizedBox(
                                              width: 400,
                                              height: 200,
                                              child: Lottie.asset(
                                                  'Assets/lottie/Robot.json'),
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                                dt18.clear();
                                dc2f18.clear();
                              } else {
                                dtotal18 = int.parse(dt18.text);
                                dcolor2f18 = int.parse(dc2f18.text);
                                valueDeleteQuantatyFreezer18 =
                                    data.get(qut) - dtotal18;
                                data.put(qut, valueDeleteQuantatyFreezer18);
                                dt18.clear();

                                valueDeleteColor2Freezer18 =
                                    data.get(color2) - dcolor2f18;
                                data.put(color2, valueDeleteColor2Freezer18);

                                dc2f18.clear();
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
                                        content: const Text(
                                            '  all proccess complete  . . .  !'),
                                        actions: [
                                          Center(
                                            child: SizedBox(
                                              width: 400,
                                              height: 200,
                                              child: Lottie.asset(
                                                  'Assets/lottie/DoneGreen.json'),
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                              }
                            }
                          }
                          dt18.clear();
                          dc2f18.clear();
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
