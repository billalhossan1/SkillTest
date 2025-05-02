import 'package:get/get.dart';

class CustomMenuController extends GetxController {
  var isMenuOpen = false.obs;

  void toggleMenu() {
    isMenuOpen.value = !isMenuOpen.value;
    update();
  }
}
