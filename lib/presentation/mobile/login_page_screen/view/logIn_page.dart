import 'package:flutter/material.dart';
import 'package:lumainar/core/app_utils/app_utils.dart';
import 'package:lumainar/core/constants/colors.dart';
import 'package:lumainar/global_widgets/reusable_loading_widget.dart';
import 'package:lumainar/presentation/mobile/batch_bottom_tab/controller/batch_bottom_tab_controller.dart';
import 'package:lumainar/presentation/mobile/batch_bottom_tab/view/batch_bottom_tab.dart';
import 'package:lumainar/presentation/mobile/login_page_screen/controller/login_screen_controller.dart';
import 'package:lumainar/presentation/mobile/otp_verification_screen/view/otp_verification_screen.dart';
import 'package:lumainar/presentation/mobile/splash_screen/controller/app_config_controller.dart';
import 'package:provider/provider.dart';

import '../../../../global_widgets/textField.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginScreenController>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset("assets/images/dp/Group 155.png"),
              ],
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hey There',
                    style: TextStyle(fontSize: 25),
                  ),
                  const Text(
                    'LogIn Now !',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 100),
                  TextfieldRefactor(
                    keyboardType: TextInputType.phone,
                    controller: _userNameController,
                    labelText: "Phone number",
                  ),
                  const SizedBox(height: 30),
                  TextfieldRefactor(
                    obscureText: loginProvider.isPasswordVisible == false ? true : false,
                    // TODO :need to add form keys in text fielsds
                    controller: _passwordController,
                    labelText: "Password",
                    suffixIcon: IconButton(
                      onPressed: Provider.of<LoginScreenController>(context, listen: false).eyButton,
                      icon: Icon(
                        loginProvider.isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        color: ColorConstant.primary1,
                      ),
                    ),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     TextButton(
                  //         onPressed: () {
                  //           _userNameController.clear();
                  //           _passwordController.clear();
                  //           Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                 builder: (context) => ChangeNotifierProvider(
                  //                     create: (context) => EnterPhoneNumberScreenController(),
                  //                     child: EnterPhoneNumber()),
                  //               ));
                  //         },
                  //         child: const Text("Forgot password?"))
                  //   ],
                  // ),
                  const SizedBox(height: 40),
                  Provider.of<LoginScreenController>(context).isLoading
                      ? Center(child: ReusableLoadingWidget())
                      : InkWell(
                          onTap: () async {
                            if (_userNameController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
                              await Provider.of<LoginScreenController>(context, listen: false)
                                  .onLogin(
                                      phoneNumber: _userNameController.text.trim(),
                                      password: _passwordController.text.trim())
                                  .then((value) async {
                                if (value) {
                                  if (loginProvider.isMobileVerified == true) {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ChangeNotifierProvider(
                                                create: (context) => BatchScreenController(), child: BatchBottomTab())),
                                        (route) => false);
                                  } else {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => OtpVerificationScreen(
                                              isNavigationFromLogin: true,
                                              phoneNumber: loginProvider.userPhoneNumber ?? ""),
                                        ),
                                        (route) => false);
                                  }
                                  _userNameController.clear();
                                  _passwordController.clear();
                                }
                                // else {
                                //   AppUtils.oneTimeSnackBar("Login failed Try Again", context: context);
                                // }
                              });
                            } else {
                              AppUtils.oneTimeSnackBar(
                                  bgColor: Colors.red, "Enter valid user name or password", context: context);
                            }
                          },
                          child: Center(
                            child: Container(
                              height: 55,
                              width: MediaQuery.of(context).size.width * .75,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: ColorConstant.primary1,
                              ),
                              child: const Center(
                                  child: Text(
                                "LogIn",
                                style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
                              )),
                            ),
                          ),
                        ),
                  const SizedBox(height: 20),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Row(
                      children: [
                        Text(
                          "Don't have an account ?  ",
                          style: TextStyle(
                            color: Colors.black, // Black color for "Agree"
                            fontSize: 16.0,
                          ),
                        ),
                        // InkWell(
                        //   onTap: () {
                        //     Navigator.of(context).push(MaterialPageRoute(
                        //         builder: (context) => ChangeNotifierProvider(
                        //             create: (context) => RegistrationScreenController(),
                        //             child: const RegisterScreen())));
                        //     _userNameController.clear();
                        //     _passwordController.clear();
                        //   },
                        //   child: Text(
                        //     'Register',
                        //     style: TextStyle(
                        //         color: ColorConstant.primary1, // Rose color for "Terms and Conditions"
                        //         fontSize: 16.0,
                        //         fontWeight: FontWeight.w500),
                        //   ),
                        // ),
                      ],
                    ),
                  ]),
                  const SizedBox(height: 40),
                  const Center(
                      child: Text(
                    "OR",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                  // InkWell(
                  //   onTap: () => Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => const GuestDetailsInputScreen(),
                  //     ),
                  //   ),
                  //   child: Center(
                  //     child: Container(
                  //       height: 55,
                  //       width: MediaQuery.of(context).size.width * .75,
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(20),
                  //           border: Border.all(
                  //             color: ColorConstant.primary1,
                  //           )),
                  //       child: Center(
                  //           child: Text(
                  //         "Explore now without logging in",
                  //         style: TextStyle(fontSize: 20, color: ColorConstant.primary1, fontWeight: FontWeight.w600),
                  //       )),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
