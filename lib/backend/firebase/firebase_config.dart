import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBNxTK-Xf4-VgevOTQfLG6XjPoQVZLpMDI",
            authDomain: "descarteconscienters.firebaseapp.com",
            projectId: "descarteconscienters",
            storageBucket: "descarteconscienters.appspot.com",
            messagingSenderId: "217223097384",
            appId: "1:217223097384:web:12c08d9aeb2c55e0b7d91d"));
  } else {
    await Firebase.initializeApp();
  }
}
