import 'package:get/state_manager.dart';
import 'package:getx_tutorial/model/datamodel/User.dart';

class UserController extends GetxController {
  final user = User().obs;

  updateName(String name, bool alive, int age) {
    user.update((value) {
      value!.name = name;
      value.age = age;
      value.alive = alive;
    });
  }
}
