import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lumainar/core/constants/colors.dart';
import 'package:lumainar/firebase_options.dart';
import 'package:lumainar/presentation/batch_class_videos_screen/controller/batch_class_video_screen_controller.dart';
import 'package:lumainar/presentation/otp_verification_screen/controller/otp_verification_screen_controller.dart';

import 'package:lumainar/presentation/splash_screen/controller/app_config_controller.dart';
import 'package:lumainar/presentation/splash_screen/view/splashScreen.dart';
import 'package:lumainar/presentation/video_folder_screen/controller/video_folder_controller.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'presentation/login_page_screen/controller/login_screen_controller.dart';
import 'presentation/video_player_Screen/controller/video_player_screen_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BatchClassVideoController()),
        ChangeNotifierProvider(create: (context) => VideoPlayerScreenController()),
        ChangeNotifierProvider(create: (context) => LoginScreenController()),
        ChangeNotifierProvider(create: (context) => OtpVerificationScreenController()),
        ChangeNotifierProvider(create: (context) => AppConfigController()),
        ChangeNotifierProvider(create: (context) => FolderVideoController()),
      ],
      child: MaterialApp(
        navigatorKey: AppConfigController.navigatorState,
        debugShowCheckedModeBanner: false,
        title: 'Luminar Technolab',
        theme:
            ThemeData(scaffoldBackgroundColor: Colors.white, iconTheme: IconThemeData(color: ColorConstant.primary1)),
        builder: (context, child) => ResponsiveWrapper.builder(
          child,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.resize(480, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
        ),
        home: const SplashScreen(),
        // routes: {
        //   '/BottomNavBar': (context) => const BottomNavBar(),
        // },
      ),
    );
  }
}
