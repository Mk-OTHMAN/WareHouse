import 'package:flutter/material.dart';
import 'package:warehouse/Routes/rutes_name.dart';
import 'package:warehouse/views/Desktop/screens/Edit%20Screen/toshiba/freezer_edit.dart';
import '../views/Desktop/screens/common factor/freezer.dart';
import '../views/Desktop/screens/common factor/halfe_washe.dart';
import '../views/Desktop/screens/common factor/refrigerator.dart';
import '../views/Desktop/screens/common factor/top_washe.dart';
import '../views/Desktop/screens/companys/Toshiba.dart';
import '../views/Desktop/screens/companys/fresh.dart';
import '../views/Desktop/screens/companys/hisense.dart';
import '../views/Desktop/screens/companys/hover.dart';
import '../views/Desktop/screens/companys/lg.dart';
import '../views/Desktop/screens/companys/sharp.dart';
import '../views/Desktop/screens/companys/tornado.dart';
import '../views/Desktop/screens/menu_screen.dart';
import '../views/Mobile/toshiba_mobile.dart';

class RutesManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (ctx) => const MenuScreen());
      case Routes.toshiba:
        return MaterialPageRoute(builder: (ctx) => const Toshipa());
      case Routes.torndo:
        return MaterialPageRoute(builder: (ctx) => const TornadoScreen());
      case Routes.sharp:
        return MaterialPageRoute(builder: (ctx) => const SharpScreen());
      case Routes.hisense:
        return MaterialPageRoute(builder: (ctx) => const HisenseScreen());
      case Routes.hover:
        return MaterialPageRoute(builder: (ctx) => const HoverScreen());
      case Routes.fresh:
        return MaterialPageRoute(builder: (ctx) => const FreshScreen());
      case Routes.lg:
        return MaterialPageRoute(builder: (ctx) => const LgScreen());
      case Routes.freezer:
        return MaterialPageRoute(builder: (ctx) => const FreezerScreen());
      case Routes.refrigerator:
        return MaterialPageRoute(builder: (ctx) => const RefrigeratorScreen());
      case Routes.topWashe:
        return MaterialPageRoute(builder: (ctx) => const TopWasheScreen());
      case Routes.halfeWashe:
        return MaterialPageRoute(builder: (ctx) => const HalfWasheScreen());
      case Routes.freezerToshipaEdit:
        return MaterialPageRoute(builder: (ctx) => const FreezerToshibaEdit());
      case Routes.toshibaMaobile:
        return MaterialPageRoute(builder: (ctx) => const ToshipaMobile());
    }
    return MaterialPageRoute(builder: (ctx) => const MenuScreen());
  }
}
