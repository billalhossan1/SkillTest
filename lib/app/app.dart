import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_test/app/controller_binder.dart';
import 'package:skill_test/features/home/ui/screen/home_screen.dart';

import '../features/home/ui/screen/house_details_screen.dart';

class SkillTestApp extends StatelessWidget {
  const SkillTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: ControllerBinder(),
      initialRoute: HomeScreen.name,
      onGenerateRoute: (RouteSettings settings) {
        late Widget widget;
       if (settings.name == HomeScreen.name) {
          widget = HomeScreen();
        } else if (settings.name == HouseDetailsScreen.name) {
          widget = HouseDetailsScreen();
        } else {
         widget = Scaffold(
           body: Center(child: Text('404: Page not found')),
         );
       }

        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => widget,
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
              child: child,
            );
          },
        );
      },
    );
  }
}
