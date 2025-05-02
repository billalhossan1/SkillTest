import 'package:get/get.dart';

class SelectedLocationController extends GetxController {
  int selectedIndex = 0;

  void changeLocation(int index) {
    selectedIndex = index;
    update();
  }
}
