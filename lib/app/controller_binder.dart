import 'package:get/get.dart';
import 'package:skill_test/features/home/controller/see_more_controller.dart';
import 'package:skill_test/features/home/controller/selected_house_controller.dart';
import 'package:skill_test/features/home/controller/selected_location_controller.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(SelectedHouseController());
    Get.put(SelectedLocationController());
    Get.put(SeeMoreController());
  }

}