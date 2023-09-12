import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:warehouse/Routes/rutes_name.dart';
import 'package:warehouse/custom/elevated.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 14, 107, 164),
          Colors.blue,
          Colors.deepPurple
        ])),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SizedBox(
                width: w / 3,
                height: h * 0.3,
                child: Lottie.asset('Assets/lottie/right side.json'),
              ),
            ),
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 4,
                  height: h * 0.4,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('Assets/7-removebg-preview.png'),
                          fit: BoxFit.cover)),
                ),
                ElevatedCostum(text: 'Toshiba', pageName: Routes.toshiba),
                ElevatedCostum(text: 'Tornado', pageName: Routes.torndo),
                ElevatedCostum(text: 'Sharp', pageName: Routes.sharp),
                ElevatedCostum(text: 'Hover', pageName: Routes.hover),
                ElevatedCostum(text: 'Hesinse', pageName: Routes.hisense),
                ElevatedCostum(text: 'Fresh', pageName: Routes.fresh),
                ElevatedCostum(text: 'LG', pageName: Routes.lg),
              ],
            ),
            Expanded(
              child: SizedBox(
                width: w / 3,
                height: h * 0.4,
                child: Lottie.asset('Assets/lottie/forget.json'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
