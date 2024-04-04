import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lumainar/core/app_utils/app_utils.dart';
import 'package:lumainar/core/constants/colors.dart';
import 'package:lumainar/global_widgets/textField.dart';
import 'package:lumainar/presentation/mobile/batch_bottom_tab/controller/batch_bottom_tab_controller.dart';
import 'package:lumainar/presentation/mobile/batch_bottom_tab/view/batch_bottom_tab.dart';
import 'package:lumainar/presentation/mobile/change_pass_screen/change_password.dart';
import 'package:lumainar/presentation/mobile/otp_verification_screen/controller/otp_verification_screen_controller.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class ResetPasswordDesktop extends StatefulWidget {
  const ResetPasswordDesktop({super.key});

  @override
  State<ResetPasswordDesktop> createState() => _ResetPasswordDesktopState();
}

class _ResetPasswordDesktopState extends State<ResetPasswordDesktop> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
//write code to send otp if loging in without mobile number verification

      await Provider.of<OtpVerificationScreenController>(context, listen: false)
          .onResendOtp(phoneNumber: _mobileNumberController.text);
    });
    super.initState();
  }

  final TextEditingController _mobileNumberController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  final otpKey = GlobalKey<FormState>();
  bool buttoncheck = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return constraints.maxWidth < 760
              ? SafeArea(
                  child: SingleChildScrollView(
                    child: Container(
                      child: Padding(
                        padding: constraints.maxWidth < 760
                            ? EdgeInsets.symmetric(horizontal: 80)
                            : EdgeInsets.symmetric(horizontal: 180),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Center(
                                  child: SizedBox(
                                      height: height * .55,
                                      child: Image.asset(
                                          "assets/images/dp/forgot pass.jpg")),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              buttoncheck == true
                                  ? SizedBox()
                                  : TextfieldRefactor(
                                      keyboardType: TextInputType.phone,
                                      controller: _mobileNumberController,
                                      labelText:
                                          "Please enter the registered mobile number",
                                    ),
                              SizedBox(
                                height: 15,
                              ),
                              buttoncheck == true
                                  ? SizedBox()
                                  : InkWell(
                                      onTap: () {
                                        Provider.of<OtpVerificationScreenController>(
                                                context,
                                                listen: false)
                                            .onResendOtp(
                                                phoneNumber:
                                                    _mobileNumberController
                                                        .text)
                                            .then((value) {
                                          // if (value) {

                                          //   AppUtils.oneTimeSnackBar(
                                          //       bgColor: ColorConstant.primary1,
                                          //       "OTP send successfully",
                                          //       context: context);
                                          // } else {
                                          //   AppUtils.oneTimeSnackBar(
                                          //       bgColor: Colors.red,
                                          //       "Resend failed, try again",
                                          //       context: context);
                                          // }
                                        });
                                        buttoncheck = true;
                                        setState(() {});
                                      },
                                      child: Container(
                                        height: 50,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: ColorConstant.primary1),
                                        child: const Center(
                                          child: Text(
                                            "Send OTP",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                              SizedBox(
                                height: 15,
                              ),
                              buttoncheck == false
                                  ? SizedBox()
                                  : Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: SizedBox(
                                        width: width,
                                        child: Form(
                                          key: otpKey,
                                          child: Pinput(
                                              controller: otpController,
                                              length: 4,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              defaultPinTheme: PinTheme(
                                                height: 50.0,
                                                width: 60.0,
                                                textStyle: GoogleFonts.urbanist(
                                                  fontSize: 24.0,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                    color: const Color.fromARGB(
                                                            255, 101, 28, 91)
                                                        .withOpacity(0.5),
                                                    width: 1.0,
                                                  ),
                                                ),
                                              ),
                                              focusedPinTheme: PinTheme(
                                                height: 60.0,
                                                width: 60.0,
                                                textStyle: GoogleFonts.urbanist(
                                                  fontSize: 24.0,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                    color:
                                                        ColorConstant.primary1,
                                                    width: 1.0,
                                                  ),
                                                ),
                                              ),
                                              validator: (value) {
                                                if (otpController.length != 4) {
                                                  return "enter a valid otp";
                                                } else {
                                                  return null;
                                                }
                                              }),
                                        ),
                                      ),
                                    ),
                              SizedBox(
                                height: 5,
                              ),
                              buttoncheck == false
                                  ? SizedBox()
                                  : Center(
                                      child: TextButton(
                                        onPressed: () {
                                          Provider.of<OtpVerificationScreenController>(
                                                  context,
                                                  listen: false)
                                              .onResendOtp(
                                                  phoneNumber:
                                                      _mobileNumberController
                                                          .text)
                                              .then((value) {
                                            // if (value) {

                                            //   AppUtils.oneTimeSnackBar(
                                            //       bgColor: ColorConstant.primary1,
                                            //       "OTP send successfully",
                                            //       context: context);
                                            // } else {
                                            //   AppUtils.oneTimeSnackBar(
                                            //       bgColor: Colors.red,
                                            //       "Resend failed, try again",
                                            //       context: context);
                                            // }
                                          });
                                        },
                                        child: const Text(
                                          'Resend Button',
                                        ),
                                      ),
                                    ),
                              SizedBox(
                                height: 5,
                              ),
                              buttoncheck == false
                                  ? SizedBox()
                                  : InkWell(
                                      onTap: () {
                                        // Navigator.of(context).pushReplacement(
                                        //     MaterialPageRoute(builder: (context) => ResetPassword()));

                                        Provider.of<OtpVerificationScreenController>(
                                                context,
                                                listen: false)
                                            .verifyOtp(
                                                phoneNumber:
                                                    _mobileNumberController
                                                        .text,
                                                otp: otpController.text.trim())
                                            .then((value) {
                                          if (value == true) {
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ChangePasswordScreen(),
                                                ),
                                                (route) => false);
                                          }
                                          // else {
                                          //   AppUtils.oneTimeSnackBar("Invalid OTP, try again",
                                          //       bgColor: Colors.red, context: context);
                                          // }
                                        });
                                      },
                                      child: Container(
                                        height: 50,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: ColorConstant.primary1),
                                        child: const Center(
                                          child: Text(
                                            "Submit",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        child: Center(
                          child: SizedBox(
                              height: height * .75,
                              child: Image.asset(
                                  "assets/images/dp/forgot pass.jpg")),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 80),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buttoncheck == true
                                  ? SizedBox()
                                  : TextfieldRefactor(
                                      keyboardType: TextInputType.phone,
                                      controller: _mobileNumberController,
                                      labelText:
                                          "Please enter the registered mobile number",
                                    ),
                              SizedBox(
                                height: 15,
                              ),
                              buttoncheck == true
                                  ? SizedBox()
                                  : InkWell(
                                      onTap: () {
                                        Provider.of<OtpVerificationScreenController>(
                                                context,
                                                listen: false)
                                            .onResendOtp(
                                                phoneNumber:
                                                    _mobileNumberController
                                                        .text)
                                            .then((value) {
                                          // if (value) {

                                          //   AppUtils.oneTimeSnackBar(
                                          //       bgColor: ColorConstant.primary1,
                                          //       "OTP send successfully",
                                          //       context: context);
                                          // } else {
                                          //   AppUtils.oneTimeSnackBar(
                                          //       bgColor: Colors.red,
                                          //       "Resend failed, try again",
                                          //       context: context);
                                          // }
                                        });
                                        buttoncheck = true;
                                        setState(() {});
                                      },
                                      child: Container(
                                        height: 50,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: ColorConstant.primary1),
                                        child: const Center(
                                          child: Text(
                                            "Send OTP",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                              SizedBox(
                                height: 15,
                              ),
                              buttoncheck == false
                                  ? SizedBox()
                                  : Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: SizedBox(
                                        width: width,
                                        child: Form(
                                          key: otpKey,
                                          child: Pinput(
                                              controller: otpController,
                                              length: 4,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              defaultPinTheme: PinTheme(
                                                height: 50.0,
                                                width: 60.0,
                                                textStyle: GoogleFonts.urbanist(
                                                  fontSize: 24.0,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                    color: const Color.fromARGB(
                                                            255, 101, 28, 91)
                                                        .withOpacity(0.5),
                                                    width: 1.0,
                                                  ),
                                                ),
                                              ),
                                              focusedPinTheme: PinTheme(
                                                height: 60.0,
                                                width: 60.0,
                                                textStyle: GoogleFonts.urbanist(
                                                  fontSize: 24.0,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                    color:
                                                        ColorConstant.primary1,
                                                    width: 1.0,
                                                  ),
                                                ),
                                              ),
                                              validator: (value) {
                                                if (otpController.length != 4) {
                                                  return "enter a valid otp";
                                                } else {
                                                  return null;
                                                }
                                              }),
                                        ),
                                      ),
                                    ),
                              SizedBox(
                                height: 5,
                              ),
                              buttoncheck == false
                                  ? SizedBox()
                                  : Center(
                                      child: TextButton(
                                        onPressed: () {
                                          Provider.of<OtpVerificationScreenController>(
                                                  context,
                                                  listen: false)
                                              .onResendOtp(
                                                  phoneNumber:
                                                      _mobileNumberController
                                                          .text)
                                              .then((value) {
                                            // if (value) {

                                            //   AppUtils.oneTimeSnackBar(
                                            //       bgColor: ColorConstant.primary1,
                                            //       "OTP send successfully",
                                            //       context: context);
                                            // } else {
                                            //   AppUtils.oneTimeSnackBar(
                                            //       bgColor: Colors.red,
                                            //       "Resend failed, try again",
                                            //       context: context);
                                            // }
                                          });
                                        },
                                        child: const Text(
                                          'Resend Button',
                                        ),
                                      ),
                                    ),
                              SizedBox(
                                height: 5,
                              ),
                              buttoncheck == false
                                  ? SizedBox()
                                  : InkWell(
                                      onTap: () {
                                        // Navigator.of(context).pushReplacement(
                                        //     MaterialPageRoute(builder: (context) => ResetPassword()));

                                        Provider.of<OtpVerificationScreenController>(
                                                context,
                                                listen: false)
                                            .verifyOtp(
                                                phoneNumber:
                                                    _mobileNumberController
                                                        .text,
                                                otp: otpController.text.trim())
                                            .then((value) {
                                          if (value == true) {
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ChangePasswordScreen(),
                                                ),
                                                (route) => false);
                                          }
                                          // else {
                                          //   AppUtils.oneTimeSnackBar("Invalid OTP, try again",
                                          //       bgColor: Colors.red, context: context);
                                          // }
                                        });
                                      },
                                      child: Container(
                                        height: 50,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: ColorConstant.primary1),
                                        child: const Center(
                                          child: Text(
                                            "Submit",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
