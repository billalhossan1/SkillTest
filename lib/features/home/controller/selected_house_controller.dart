import 'package:get/get.dart';

class SelectedHouseController extends GetxController{
  int _selectedHouse=0;
  int get selectedIndex => _selectedHouse;

  void changeIndex(int index)
  {
    if(_selectedHouse==index) {
      return;
    }
    _selectedHouse=index;
    update();
  }

}