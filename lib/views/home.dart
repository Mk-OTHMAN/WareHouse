import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../responsive_layout/responsive.dart';
import '../Routes/generate_routes.dart';
import '../Routes/rutes_name.dart';
import 'Desktop/desktop_view.dart';
import 'Mobile/mobile_view.dart';
import 'Taplet/tablet_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        // designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.home,
            onGenerateRoute: RutesManager.generateRoute,
            home: Responsive(
                mobile: MobileView(),
                taplet: TabletView(),
                desktop: DesktopView()),
          );
        });
  }
}
