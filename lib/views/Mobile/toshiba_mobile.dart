import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:warehouse/Routes/rutes_name.dart';
import 'package:warehouse/custom/custom_outlinebutton.dart';
import 'package:lottie/lottie.dart';

class ToshipaMobile extends StatelessWidget {
  const ToshipaMobile({super.key});

  @override
  Widget build(BuildContext context) {
    double W = MediaQuery.of(context).size.width;
    double H = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff0759A7),

        // _____________  Buttom Navigation Bar   ________________________
        bottomNavigationBar: CurvedNavigationBar(
            // height: 30,
            buttonBackgroundColor: Colors.white70,
            color: Colors.white70,
            backgroundColor: const Color(0xff0759A7),
            items: const [
              Icon(Icons.home),
            ],
            onTap: (value) {
              if (value == 0) {
                Navigator.of(context).pushNamed(Routes.home);
              }
            }),

        // ________________ Body ____________

        body:
            //    ______________   Seconde Column  ___________
            Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(
                    width: W * .6,
                    height: H * .5,
                    child: Lottie.asset('Assets/lottie/Sun.json'),
                  ),
                  // ________ item 1 < freezer > ___________
                  CustomOutlineButton(
                      buttonName: 'Freezer',
                      pagePath: Routes.freezer,
                      buttonColor: Colors.white,
                      fontSize: 20,
                      fontColor: Colors.white,
                      width: W * .3,
                      height: H * .05),
                  SizedBox(
                    height: H * .02,
                  ),

                  // ________ item 2 < Refrigerato > ___________
                  CustomOutlineButton(
                      buttonName: 'Refrigerator',
                      pagePath: Routes.refrigerator,
                      buttonColor: Colors.white,
                      fontSize: 20,
                      fontColor: Colors.white,
                      width: W * .4,
                      height: H * .05),
                  SizedBox(
                    height: H * .02,
                  ),

                  // ________ item 3 < Top Washe > ___________
                  CustomOutlineButton(
                      buttonName: 'Top Washe',
                      pagePath: Routes.topWashe,
                      buttonColor: Colors.white,
                      fontSize: 20,
                      fontColor: Colors.white,
                      width: W * .4,
                      height: H * .05),
                  SizedBox(
                    height: H * .02,
                  ),

                  // ________ item 3 < Half Washe > ___________
                  CustomOutlineButton(
                      buttonName: 'Half Washe',
                      pagePath: Routes.halfeWashe,
                      buttonColor: Colors.white,
                      fontSize: 20,
                      fontColor: Colors.white,
                      width: W * .4,
                      height: H * .05),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
