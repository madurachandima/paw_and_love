import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paw_and_love/Auth/Login/screens/login.dart';
import 'package:paw_and_love/Config/color_config.dart';
import 'package:paw_and_love/Config/font_config.dart';
import 'package:paw_and_love/Home/bottom_navigationbar_handler.dart';
import 'package:paw_and_love/Widgets/customeCircularProgress.dart';
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
          theme: ThemeData(
              primaryColor: ColorConfig.blue,
              brightness: Brightness.light,
              fontFamily: REGULAR_FONT,
              textTheme: TextTheme(
                /*
                  *for main heding
                  */
                headline1: TextStyle(
                    fontSize: 35.sp,
                    fontWeight: FontWeight.w500,
                    color: ColorConfig.lightGray),
                /*
                  *for main heding highlight text
                  */
                headline2: TextStyle(
                    fontSize: 38.sp,
                    fontWeight: FontWeight.w500,
                    color: ColorConfig.yellow),
                /*
                  *for main heding  text inside
                  */
                headline3: TextStyle(
                    fontSize: 38.sp,
                    fontWeight: FontWeight.w500,
                    color: ColorConfig.blue),
                /*
                  *for body text dark
                  */
                bodyText1: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: ColorConfig.textColorGray),

                /*
                  *for body text light
                  */
                bodyText2: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: ColorConfig.yellow),

                /*
                  *for body text subtitle
                  */
                subtitle1: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: ColorConfig.yellow),
              ),
              appBarTheme:
                  const AppBarTheme(backgroundColor: ColorConfig.blue)),
          home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData) {
                    return const BottomNavigationbarHandler();
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("${snapshot.error}"),
                    );
                  }
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CustomeCircularProgress();
                }

                return const Login();
              }),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
