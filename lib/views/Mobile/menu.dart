import 'package:flutter/material.dart';
import 'package:warehouse/views/Mobile/elvated_button.dart';
import '../../Routes/rutes_name.dart';

class MobileMenu extends StatelessWidget {
  const MobileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 14, 107, 164),
          Colors.blue,
          Colors.deepPurple
        ])),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2,
              height: h * 0.4,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('Assets/7-removebg-preview.png'),
                      fit: BoxFit.cover)),
            ),
            ElevatedButtonMobile(
                text: 'Toshiba', pageName: Routes.toshibaMaobile),
            ElevatedButtonMobile(text: 'Tornado', pageName: Routes.torndo),
            ElevatedButtonMobile(text: 'Sharp', pageName: Routes.sharp),
            ElevatedButtonMobile(text: 'Hover', pageName: Routes.hover),
            ElevatedButtonMobile(text: 'Hesinse', pageName: Routes.hisense),
            ElevatedButtonMobile(text: 'Fresh', pageName: Routes.fresh),
            ElevatedButtonMobile(text: 'LG', pageName: Routes.lg),
          ],
        ),
      ),
    );
  }
}
