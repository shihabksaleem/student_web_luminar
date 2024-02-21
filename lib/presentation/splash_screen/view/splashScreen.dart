import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lumainar/core/app_utils/app_utils.dart';
import 'package:lumainar/core/constants/image_constants.dart';
import 'package:lumainar/presentation/batch_bottom_tab/controller/batch_bottom_tab_controller.dart';
import 'package:lumainar/presentation/batch_bottom_tab/view/batch_bottom_tab.dart';
import 'package:lumainar/presentation/splash_screen/controller/app_config_controller.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../login_page_screen/view/logIn_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );

// code for splash screen logo animation
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 3.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.forward();

    // Simulate a delay before navigating to the home screen

    Future.delayed(const Duration(seconds: 3), () async {
      if (await AppUtils.isOnline()) {
        await Provider.of<AppConfigController>(context, listen: false).getMobileVersion().then((version) async {
          if (version != null) {
            await AppUtils.haveUpdate(newVersion: version).then((value) async {
              if (value) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return WillPopScope(
                        onWillPop: () async {
                          return false;
                        },
                        child: AlertDialog(
                          surfaceTintColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.zero)),
                          title: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Container(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'New Update Available',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          content: Text(
                              "To continue using this app, you must update to the latest version. The new update is required to access the latest features"),
                          actions: <Widget>[
                            InkWell(
                              onTap: () {
                                _launchAppStore();
                              },
                              child: Container(
                                color: Color(0xff00865f),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                  child: Text(
                                    'Update Now',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            // SizedBox(height: 15,),
                            Divider(
                              height: 40,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height: 30,
                                  child: Image.asset(
                                      Platform.isIOS ? ImageConstants.appStoreIcon : ImageConstants.playStoreIcon),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    });
              } else {
// if there is no update

                await AppUtils.getAccessKey().then((value) async {
                  if (value != null && value.isNotEmpty) {
                    Provider.of<AppConfigController>(context, listen: false).haveAccessKey();
                  } else {
                    final guestDetails = await AppUtils.getGuestDetails();
                    AppUtils().printData(guestDetails, info: "guest phone number");

                    if (guestDetails != null && guestDetails.isNotEmpty) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChangeNotifierProvider(
                                create: (context) => BatchScreenController(), child: BatchBottomTab())),
                        (route) => false,
                      );
                    } else {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                        (route) => false,
                      );
                    }
                  }
                });
              }
            });
          }
        });
      } else {
        if (mounted) {
          await AppUtils.oneTimeSnackBar("No internet connection",
              bgColor: Colors.red, context: AppConfigController.navigatorState.currentContext!);
        }

        // Navigator.pushAndRemoveUntil(
        //     context, MaterialPageRoute(builder: (context) => NoInternetScreen()), (route) => false);
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Stack(
          children: [
            Positioned(
              right: 0,
              child: Image.asset("assets/images/dp/Polygon 1.png"),
            ),
            Center(
              child: Image.asset(
                "assets/images/dp/luminar logo.png",
                height: 130,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset("assets/images/dp/Group 156.png"),
            ),
          ],
        ),
      ),
    );
  }

  // Function to launch the App Store (iOS) or Play Store (Android)
  _launchAppStore() async {
    final String url = Platform.isIOS
        ? 'https://apps.apple.com/in/app/instagram/id389801252'
        : 'https://play.google.com/store/apps/details?id=com.luminartechnohub.studentapp';

    if (await launchUrl(Uri.parse(url))) {
      await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
