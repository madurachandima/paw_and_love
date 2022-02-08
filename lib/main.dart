import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paw_and_love/Home/bottom_navigationbar_handler.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDQEgqFqaZfq9QNE5-zbv1D-lCaGb2iHkU",
            authDomain: "paw-and-love.firebaseapp.com",
            projectId: "paw-and-love",
            storageBucket: "paw-and-love.appspot.com",
            messagingSenderId: "502263992957",
            appId: "1:502263992957:web:318398e19cc30881939714"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(),
          home: const BottomNavigationbarHandler(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
