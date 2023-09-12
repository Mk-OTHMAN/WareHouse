import 'package:flutter/material.dart';
import 'views/home.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('data');
  Box data = Hive.box('data');
  if (data.get('total18') == null) {
    data.put('total18', 0);
  } else if (data.get('18volor1') == null) {
    data.put('18color1', 0);
  } else if (data.get('18collor2') == null) {
    data.put('18color2', 0);
  }

  runApp(const Home());
}
