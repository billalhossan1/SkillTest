import 'package:get/get.dart';

class SeeMoreController extends GetxController {
  var isExpanded = false.obs;

  void manageExpanded() {
    isExpanded.value = !isExpanded.value;
  }
}
