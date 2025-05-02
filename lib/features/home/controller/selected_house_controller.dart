import 'package:get/get.dart';

class SelectedHouseController extends GetxController{
  int _selectedSubject=0;
  int get selectedIndex => _selectedSubject;

  void changeIndex(int index)
  {
    if(_selectedSubject==index) {
      return;
    }
    _selectedSubject=index;
    update();
  }

}