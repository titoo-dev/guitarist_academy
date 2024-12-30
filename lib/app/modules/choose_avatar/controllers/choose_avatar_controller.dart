import 'package:get/get.dart';

class ChooseAvatarController extends GetxController {
  int selectedAvatarIndex = 0;

  final avatars = [
    'assets/avatar1.json',
    'assets/avatar2.json',
    'assets/avatar3.json',
    'assets/avatar4.json',
    'assets/avatar5.json',
    'assets/avatar6.json'
  ];

  void chooseAvatar(int index) {
    selectedAvatarIndex = index;
    update(['choose_avatar']);
  }
}
