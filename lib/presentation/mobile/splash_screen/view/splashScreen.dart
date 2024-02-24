// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:lumainar/core/app_utils/app_utils.dart';
// import 'package:lumainar/core/constants/image_constants.dart';
// import 'package:lumainar/presentation/mobile/batch_bottom_tab/controller/batch_bottom_tab_controller.dart';
// import 'package:lumainar/presentation/mobile/batch_bottom_tab/view/batch_bottom_tab.dart';
// import 'package:lumainar/presentation/mobile/login_page_screen/view/desktop_logIn_page.dart';
// import 'package:lumainar/presentation/mobile/splash_screen/controller/app_config_controller.dart';
// import 'package:provider/provider.dart';
// import 'package:url_launcher/url_launcher.dart';
// import '../../login_page_screen/view/logIn_page.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _fadeAnimation;

//   @override
//   void initState() {
//     super.initState();
//     // Simulate a delay before navigating to the home screen
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FadeTransition(
//         opacity: _fadeAnimation,
//         child: Stack(
//           children: [
//             Positioned(
//               right: 0,
//               child: Image.asset("assets/images/dp/Polygon 1.png"),
//             ),
//             Center(
//               child: Image.asset(
//                 "assets/images/dp/luminar logo.png",
//                 height: 130,
//               ),
//             ),
//             Positioned(
//               bottom: 0,
//               left: 0,
//               child: Image.asset("assets/images/dp/Group 156.png"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }


// }
