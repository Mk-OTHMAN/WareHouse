import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/Routes/rutes_name.dart';
import 'package:warehouse/custom/buttomsheet/deep_18.dart';
import 'package:warehouse/custom/buttomsheet/deep_22.dart';
import 'package:warehouse/custom/navigatin_Bar.dart';

class FreezerToshibaEdit extends StatefulWidget {
  const FreezerToshibaEdit({super.key});

  @override
  State<FreezerToshibaEdit> createState() => _FreezerToshibaEditState();
}

class _FreezerToshibaEditState extends State<FreezerToshibaEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          buttonBackgroundColor: Colors.white70,
          color: Colors.white70,
          backgroundColor: const Color(0xffFF735C),
          items: const [
            Icon(Icons.arrow_back_ios_new),
            Icon(Icons.home),
          ],
          onTap: (value) {
            if (value == 1) {
              Navigator.of(context).pushNamed(Routes.home);
            } else if (value == 0) {
              Navigator.of(context).pushNamed(Routes.freezer);
            }
          }),
      // _____________ row body ___________________
      body: Row(children: [
        //  ________________ 1st container ________________
        Expanded(
            flex: 1,
            child: Container(
              color: const Color(0xffFF735C),
              // _____________ left side  ___________
              child: Column(children: [
                const SizedBox(
                  height: 30,
                ),
                Text('Modifying',
                    style: GoogleFonts.rowdies(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                const SizedBox(height: 10),
                Text('Now',
                    style: GoogleFonts.rowdies(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                const SizedBox(height: 5),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Lottie.asset('Assets/lottie/down.json'),
                ),
                // _________- list text on left side ___________
                Column(
                  children: [
                    TextButton(
                        onPressed: () {
                          // ## Buttomsheet ..........
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return const DeepF22(
                                  addQuantaty: 0,
                                  addColor1: 0,
                                  addColor2: 0,
                                  deleteQuantaty: 0,
                                  deleteColor1: 0,
                                  deleteColor2: 0,
                                );
                              },
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(100),
                                    topRight: Radius.circular(100)),
                              ));
                        },
                        child: const Text(
                          'DeepFreezer 22',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        )),
                    // _________ sizedBox __________
                    const SizedBox(height: 5),
                    // ___________ secondtext ____________
                    TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return DeepF18();
                              },
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(100),
                                    topRight: Radius.circular(100)),
                              ));
                        },
                        child: const Text(
                          'DeepFreezer 18',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        )),
                  ],
                )
              ]),
            )),
        Expanded(
          flex: 3,
          // ignore: avoid_unnecessary_containers
          child: Container(
            height: 500,
            width: 200,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('Assets/idea_01-removebg-preview.png'),
                    fit: BoxFit.contain)),
          ),
        )
      ]),
    );
  }
}
