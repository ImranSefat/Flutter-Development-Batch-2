import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_getx/Constants/firebase_auth_constants.dart';
import 'package:firebase_auth_getx/Screens/home.dart';
import 'package:firebase_auth_getx/Screens/register.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  late Rx<User?> firebaseUser;
  static AuthController instance = Get.find<AuthController>();

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);

    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const Login());
    } else {
      Get.offAll(() => const Home());
    }
  }

  void register(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print(e.toString());
    }
  }

  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e.toString());
    }
  }

  void logout() async {
    await auth.signOut();
  }
}
