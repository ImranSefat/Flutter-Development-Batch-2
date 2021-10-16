import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_getx/Controllers/auth_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

final Future<FirebaseApp> firebaseInitilization = Firebase.initializeApp();

FirebaseAuth auth = FirebaseAuth.instance;

AuthController authController = AuthController.instance;
GoogleSignIn googleSignIn = GoogleSignIn();
