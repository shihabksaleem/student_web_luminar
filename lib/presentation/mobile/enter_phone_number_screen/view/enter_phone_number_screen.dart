// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:lumainar/core/app_utils/app_utils.dart';
// import 'package:lumainar/core/constants/colors.dart';
// import 'package:lumainar/global_widgets/reusable_loading_widget.dart';
// import 'package:lumainar/global_widgets/textField.dart';

// import 'package:lumainar/presentation/mobile/change_pass_screen/change_password_screen.dart';
// import 'package:lumainar/presentation/mobile/enter_phone_number_screen/controller/enter_phone_number_screen_controller.dart';
// import 'package:pinput/pinput.dart';
// import 'package:provider/provider.dart';

// class EnterPhoneNumberScreen extends StatefulWidget {
//   const EnterPhoneNumberScreen({super.key});

//   @override
//   State<EnterPhoneNumberScreen> createState() => _EnterPhoneNumberScreenState();
// }

// class _EnterPhoneNumberScreenState extends State<EnterPhoneNumberScreen> {
//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
// //write code to send otp if loging in without mobile number verification

//       // await Provider.of<OtpVerificationScreenController>(context, listen: false)
//       //     .onResendOtp(phoneNumber: _mobileNumberController.text);
//     });
//     super.initState();
//   }

//   final TextEditingController _mobileNumberController = TextEditingController();
//   // final TextEditingController _passwordController = TextEditingController();
//   TextEditingController otpController = TextEditingController();
//   final otpKey = GlobalKey<FormState>();

//   final _mobileNumberKey = GlobalKey<FormState>();
//   // bool providerState.isOtpSend = false;

//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     final providerState = Provider.of<EnterPhoneNumberScreenController>(context);
//     return Scaffold(
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           return constraints.maxWidth < 760
//               ? SafeArea(
//                   child: SingleChildScrollView(
//                     child: Container(
//                       child: Padding(
//                         padding: constraints.maxWidth < 760
//                             ? EdgeInsets.symmetric(horizontal: 80)
//                             : EdgeInsets.symmetric(horizontal: 180),
//                         child: Center(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Container(
//                                 child: Center(
//                                   child: SizedBox(
//                                       height: height * .55, child: Image.asset("assets/images/dp/forgot pass.jpg")),
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 15,
//                               ),
//                               providerState.isOtpSend == true
//                                   ? SizedBox()
//                                   : TextfieldRefactor(
//                                       autofocus: true,
//                                       formKey: _mobileNumberKey,
//                                       keyboardType: TextInputType.phone,
//                                       controller: _mobileNumberController,
//                                       labelText: "Please enter the registered mobile number",
//                                       validator: (p0) {
//                                         if (AppUtils.validationOfPhone(_mobileNumberController.text)) {
//                                           return null;
//                                         } else {
//                                           return "Enter a valid Phone number";
//                                         }
//                                       },
//                                     ),
//                               SizedBox(
//                                 height: 15,
//                               ),
//                               providerState.isOtpSend == true
//                                   ? SizedBox()
//                                   : providerState.isLoading
//                                       ? Center(
//                                           child: ReusableLoadingWidget(),
//                                         )
//                                       : InkWell(
//                                           onTap: () {
//                                             if (_mobileNumberKey.currentState!.validate()) {
//                                               Provider.of<EnterPhoneNumberScreenController>(context, listen: false)
//                                                   .sendOtp(phoneNumber: _mobileNumberController.text)
//                                                   .then((value) {
//                                                 if (value) {
//                                                   Provider.of<EnterPhoneNumberScreenController>(context, listen: false)
//                                                       .onOtpSend(true);
//                                                   AppUtils.oneTimeSnackBar(
//                                                       bgColor: ColorConstant.primary1,
//                                                       "OTP send successfully",
//                                                       context: context);
//                                                 }
//                                               });
//                                             }
//                                           },
//                                           child: Container(
//                                             height: 50,
//                                             width: double.infinity,
//                                             decoration: BoxDecoration(
//                                                 borderRadius: BorderRadius.circular(15), color: ColorConstant.primary1),
//                                             child: const Center(
//                                               child: Text(
//                                                 "Send OTP",
//                                                 style: TextStyle(
//                                                     color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                               SizedBox(
//                                 height: 15,
//                               ),
//                               providerState.isOtpSend == false
//                                   ? SizedBox()
//                                   : Padding(
//                                       padding: const EdgeInsets.symmetric(horizontal: 10),
//                                       child: SizedBox(
//                                         width: width,
//                                         child: Form(
//                                           key: otpKey,
//                                           child: Pinput(
//                                               autofocus: true,
//                                               controller: otpController,
//                                               length: 4,
//                                               mainAxisAlignment: MainAxisAlignment.center,
//                                               crossAxisAlignment: CrossAxisAlignment.center,
//                                               defaultPinTheme: PinTheme(
//                                                 height: 50.0,
//                                                 width: 60.0,
//                                                 textStyle: GoogleFonts.urbanist(
//                                                   fontSize: 24.0,
//                                                   color: Colors.black,
//                                                   fontWeight: FontWeight.w700,
//                                                 ),
//                                                 decoration: BoxDecoration(
//                                                   color: Colors.white,
//                                                   borderRadius: BorderRadius.circular(10),
//                                                   border: Border.all(
//                                                     color: const Color.fromARGB(255, 101, 28, 91).withOpacity(0.5),
//                                                     width: 1.0,
//                                                   ),
//                                                 ),
//                                               ),
//                                               focusedPinTheme: PinTheme(
//                                                 height: 60.0,
//                                                 width: 60.0,
//                                                 textStyle: GoogleFonts.urbanist(
//                                                   fontSize: 24.0,
//                                                   color: Colors.black,
//                                                   fontWeight: FontWeight.w700,
//                                                 ),
//                                                 decoration: BoxDecoration(
//                                                   color: Colors.white,
//                                                   borderRadius: BorderRadius.circular(10),
//                                                   border: Border.all(
//                                                     color: ColorConstant.primary1,
//                                                     width: 1.0,
//                                                   ),
//                                                 ),
//                                               ),
//                                               validator: (value) {
//                                                 if (otpController.length != 4) {
//                                                   return "enter a valid otp";
//                                                 } else {
//                                                   return null;
//                                                 }
//                                               }),
//                                         ),
//                                       ),
//                                     ),
//                               SizedBox(
//                                 height: 5,
//                               ),
//                               providerState.isOtpSend == false
//                                   ? SizedBox()
//                                   : providerState.isLoading
//                                       ? Center(
//                                           child: ReusableLoadingWidget(),
//                                         )
//                                       : Center(
//                                           child: TextButton(
//                                             onPressed: () {
//                                               Provider.of<EnterPhoneNumberScreenController>(context, listen: false)
//                                                   .sendOtp(phoneNumber: _mobileNumberController.text)
//                                                   .then((value) {
//                                                 if (value) {
//                                                   AppUtils.oneTimeSnackBar(
//                                                       bgColor: ColorConstant.primary1,
//                                                       "OTP send successfully",
//                                                       context: context);
//                                                 }
//                                               });
//                                             },
//                                             child: const Text(
//                                               'Resend Button',
//                                             ),
//                                           ),
//                                         ),
//                               SizedBox(
//                                 height: 5,
//                               ),
//                               providerState.isOtpSend == false
//                                   ? SizedBox()
//                                   : InkWell(
//                                       onTap: () {
//                                         if (otpKey.currentState!.validate()) {
//                                           Provider.of<EnterPhoneNumberScreenController>(context, listen: false)
//                                               .verifyOtp(
//                                                   phoneNumber: _mobileNumberController.text,
//                                                   otp: otpController.text.trim())
//                                               .then((value) {
//                                             if (value == true) {
//                                               Navigator.pushReplacement(
//                                                 context,
//                                                 MaterialPageRoute(
//                                                   builder: (context) => ChangePasswordScreen(
//                                                     userId: providerState.userId ?? "",
//                                                   ),
//                                                 ),
//                                               );
//                                             }
//                                           });
//                                         }
//                                       },
//                                       child: Container(
//                                         height: 50,
//                                         width: double.infinity,
//                                         decoration: BoxDecoration(
//                                             borderRadius: BorderRadius.circular(15), color: ColorConstant.primary1),
//                                         child: const Center(
//                                           child: Text(
//                                             "Submit",
//                                             style: TextStyle(
//                                                 color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//               : Row(
//                   children: [
//                     Expanded(
//                       flex: 3,
//                       child: Container(
//                         child: Center(
//                           child: SizedBox(height: height * .75, child: Image.asset("assets/images/dp/forgot pass.jpg")),
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       flex: 2,
//                       child: Container(
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 80),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               providerState.isOtpSend == true
//                                   ? SizedBox()
//                                   : TextfieldRefactor(
//                                       autofocus: true,
//                                       formKey: _mobileNumberKey,
//                                       keyboardType: TextInputType.phone,
//                                       controller: _mobileNumberController,
//                                       labelText: "Please enter the registered mobile number",
//                                       validator: (p0) {
//                                         if (AppUtils.validationOfPhone(_mobileNumberController.text)) {
//                                           return null;
//                                         } else {
//                                           return "Enter a valid Phone number";
//                                         }
//                                       },
//                                     ),
//                               SizedBox(
//                                 height: 15,
//                               ),
//                               providerState.isOtpSend == true
//                                   ? SizedBox()
//                                   : providerState.isLoading
//                                       ? Center(
//                                           child: ReusableLoadingWidget(),
//                                         )
//                                       : InkWell(
//                                           onTap: () {
//                                             // to send otp in web
//                                             if (_mobileNumberKey.currentState!.validate()) {
//                                               Provider.of<EnterPhoneNumberScreenController>(context, listen: false)
//                                                   .sendOtp(phoneNumber: _mobileNumberController.text)
//                                                   .then((value) {
//                                                 if (value) {
//                                                   // to update the  state ot show otp  field after sending otp
//                                                   Provider.of<EnterPhoneNumberScreenController>(context, listen: false)
//                                                       .onOtpSend(true);
//                                                   AppUtils.oneTimeSnackBar(
//                                                       bgColor: ColorConstant.primary1,
//                                                       "OTP send successfully",
//                                                       context: context);
//                                                 }
//                                               });
//                                             }
//                                           },
//                                           child: Container(
//                                             height: 50,
//                                             width: double.infinity,
//                                             decoration: BoxDecoration(
//                                                 borderRadius: BorderRadius.circular(15), color: ColorConstant.primary1),
//                                             child: const Center(
//                                               child: Text(
//                                                 "Send OTP",
//                                                 style: TextStyle(
//                                                     color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                               SizedBox(
//                                 height: 15,
//                               ),
//                               providerState.isOtpSend == false
//                                   ? SizedBox()
//                                   : Padding(
//                                       padding: const EdgeInsets.symmetric(horizontal: 10),
//                                       child: SizedBox(
//                                         width: width,
//                                         child: Form(
//                                           key: otpKey,
//                                           child: Pinput(
//                                               autofocus: true,
//                                               controller: otpController,
//                                               length: 4,
//                                               mainAxisAlignment: MainAxisAlignment.center,
//                                               crossAxisAlignment: CrossAxisAlignment.center,
//                                               defaultPinTheme: PinTheme(
//                                                 height: 50.0,
//                                                 width: 60.0,
//                                                 textStyle: GoogleFonts.urbanist(
//                                                   fontSize: 24.0,
//                                                   color: Colors.black,
//                                                   fontWeight: FontWeight.w700,
//                                                 ),
//                                                 decoration: BoxDecoration(
//                                                   color: Colors.white,
//                                                   borderRadius: BorderRadius.circular(10),
//                                                   border: Border.all(
//                                                     color: const Color.fromARGB(255, 101, 28, 91).withOpacity(0.5),
//                                                     width: 1.0,
//                                                   ),
//                                                 ),
//                                               ),
//                                               focusedPinTheme: PinTheme(
//                                                 height: 60.0,
//                                                 width: 60.0,
//                                                 textStyle: GoogleFonts.urbanist(
//                                                   fontSize: 24.0,
//                                                   color: Colors.black,
//                                                   fontWeight: FontWeight.w700,
//                                                 ),
//                                                 decoration: BoxDecoration(
//                                                   color: Colors.white,
//                                                   borderRadius: BorderRadius.circular(10),
//                                                   border: Border.all(
//                                                     color: ColorConstant.primary1,
//                                                     width: 1.0,
//                                                   ),
//                                                 ),
//                                               ),
//                                               validator: (value) {
//                                                 if (otpController.length != 4) {
//                                                   return "enter a valid otp";
//                                                 } else {
//                                                   return null;
//                                                 }
//                                               }),
//                                         ),
//                                       ),
//                                     ),
//                               SizedBox(
//                                 height: 5,
//                               ),
//                               providerState.isOtpSend == false
//                                   ? SizedBox()
//                                   : providerState.isLoading
//                                       ? Center(
//                                           child: ReusableLoadingWidget(),
//                                         )
//                                       : Center(
//                                           child: TextButton(
//                                             onPressed: () {
//                                               Provider.of<EnterPhoneNumberScreenController>(context, listen: false)
//                                                   .sendOtp(phoneNumber: _mobileNumberController.text)
//                                                   .then((value) {
//                                                 if (value) {
//                                                   AppUtils.oneTimeSnackBar(
//                                                       bgColor: ColorConstant.primary1,
//                                                       "OTP send successfully",
//                                                       context: context);
//                                                 }
//                                               });
//                                             },
//                                             child: const Text(
//                                               'Resend Button',
//                                             ),
//                                           ),
//                                         ),
//                               SizedBox(
//                                 height: 5,
//                               ),
//                               providerState.isOtpSend == false
//                                   ? SizedBox()
//                                   : InkWell(
//                                       onTap: () {
//                                         if (otpKey.currentState!.validate()) {
//                                           Provider.of<EnterPhoneNumberScreenController>(context, listen: false)
//                                               .verifyOtp(
//                                                   phoneNumber: _mobileNumberController.text,
//                                                   otp: otpController.text.trim())
//                                               .then((value) {
//                                             if (value == true) {
//                                               Navigator.pushReplacement(
//                                                 context,
//                                                 MaterialPageRoute(
//                                                   builder: (context) => ChangePasswordScreen(
//                                                     userId: providerState.userId ?? "",
//                                                   ),
//                                                 ),
//                                               );
//                                             }
//                                           });
//                                         }
//                                       },
//                                       child: Container(
//                                         height: 50,
//                                         width: double.infinity,
//                                         decoration: BoxDecoration(
//                                             borderRadius: BorderRadius.circular(15), color: ColorConstant.primary1),
//                                         child: const Center(
//                                           child: Text(
//                                             "Submit",
//                                             style: TextStyle(
//                                                 color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 );
//         },
//       ),
//     );
//   }
// }
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lumainar/core/app_utils/app_utils.dart';
import 'package:lumainar/core/constants/colors.dart';
import 'package:lumainar/global_widgets/reusable_loading_widget.dart';
import 'package:lumainar/global_widgets/textField.dart';

import 'package:lumainar/presentation/mobile/change_pass_screen/change_password_screen.dart';
import 'package:lumainar/presentation/mobile/enter_phone_number_screen/controller/enter_phone_number_screen_controller.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class EnterPhoneNumberScreen extends StatefulWidget {
  const EnterPhoneNumberScreen({Key? key}) : super(key: key);

  @override
  State<EnterPhoneNumberScreen> createState() => _EnterPhoneNumberScreenState();
}

class _EnterPhoneNumberScreenState extends State<EnterPhoneNumberScreen> {
  late Timer _timer;
  int _start = 60;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      // Start the timer on screen load
      // startTimer();
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel(); // Cancel timer when it reaches 0
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  final TextEditingController _mobileNumberController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  final otpKey = GlobalKey<FormState>();

  final _mobileNumberKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final providerState = Provider.of<EnterPhoneNumberScreenController>(context);
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
                                    child: Image.asset("assets/images/dp/forgot pass.jpg"),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              providerState.isOtpSend == true
                                  ? SizedBox()
                                  : TextfieldRefactor(
                                      autofocus: true,
                                      formKey: _mobileNumberKey,
                                      keyboardType: TextInputType.phone,
                                      controller: _mobileNumberController,
                                      labelText: "Please enter the registered mobile number",
                                      validator: (p0) {
                                        if (AppUtils.validationOfPhone(_mobileNumberController.text)) {
                                          return null;
                                        } else {
                                          return "Enter a valid Phone number";
                                        }
                                      },
                                    ),
                              SizedBox(
                                height: 15,
                              ),
                              providerState.isOtpSend == true
                                  ? SizedBox()
                                  : providerState.isLoading
                                      ? Center(
                                          child: ReusableLoadingWidget(),
                                        )
                                      : InkWell(
                                          onTap: () {
                                            if (_mobileNumberKey.currentState!.validate()) {
                                              Provider.of<EnterPhoneNumberScreenController>(context, listen: false)
                                                  .sendOtp(phoneNumber: _mobileNumberController.text)
                                                  .then((value) {
                                                if (value) {
                                                  Provider.of<EnterPhoneNumberScreenController>(context, listen: false)
                                                      .onOtpSend(true);
                                                  AppUtils.oneTimeSnackBar(
                                                      bgColor: ColorConstant.primary1,
                                                      "OTP sent successfully",
                                                      context: context);
                                                  setState(() {
                                                    _start = 60; // Reset timer on OTP send
                                                    startTimer();
                                                  });
                                                }
                                              });
                                            }
                                          },
                                          child: Container(
                                            height: 50,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(15), color: ColorConstant.primary1),
                                            child: const Center(
                                              child: Text(
                                                "Send OTP",
                                                style: TextStyle(
                                                    color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                              SizedBox(
                                height: 15,
                              ),
                              providerState.isOtpSend == false
                                  ? SizedBox()
                                  : Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: SizedBox(
                                        width: width,
                                        child: Form(
                                          key: otpKey,
                                          child: Pinput(
                                              autofocus: true,
                                              controller: otpController,
                                              length: 4,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                                  borderRadius: BorderRadius.circular(10),
                                                  border: Border.all(
                                                    color: const Color.fromARGB(255, 101, 28, 91).withOpacity(0.5),
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
                                                  borderRadius: BorderRadius.circular(10),
                                                  border: Border.all(
                                                    color: ColorConstant.primary1,
                                                    width: 1.0,
                                                  ),
                                                ),
                                              ),
                                              validator: (value) {
                                                if (otpController.length != 4) {
                                                  return "Enter a valid OTP";
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
                              providerState.isOtpSend == false
                                  ? SizedBox()
                                  : _start >= 1
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          child: Text(
                                            'Resend OTP in $_start seconds',
                                            style: TextStyle(
                                              color: ColorConstant.primary1,
                                              fontSize: 16,
                                            ),
                                          ),
                                        )
                                      : providerState.isLoading
                                          ? Center(
                                              child: ReusableLoadingWidget(),
                                            )
                                          : Center(
                                              child: TextButton(
                                                onPressed: () {
                                                  Provider.of<EnterPhoneNumberScreenController>(context, listen: false)
                                                      .sendOtp(phoneNumber: _mobileNumberController.text)
                                                      .then((value) {
                                                    if (value) {
                                                      AppUtils.oneTimeSnackBar(
                                                          bgColor: ColorConstant.primary1,
                                                          "OTP sent successfully",
                                                          context: context);
                                                      setState(() {
                                                        _start = 60; // Reset timer on OTP send
                                                        startTimer();
                                                      });
                                                    }
                                                  });
                                                },
                                                child: Text(
                                                  'Resend OTP',
                                                  style: TextStyle(
                                                    color: ColorConstant.primary1,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                              SizedBox(
                                height: 5,
                              ),
                              providerState.isOtpSend == false
                                  ? SizedBox()
                                  : InkWell(
                                      onTap: () {
                                        if (otpKey.currentState!.validate()) {
                                          Provider.of<EnterPhoneNumberScreenController>(context, listen: false)
                                              .verifyOtp(
                                                  phoneNumber: _mobileNumberController.text,
                                                  otp: otpController.text.trim())
                                              .then((value) {
                                            if (value == true) {
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => ChangePasswordScreen(
                                                    userId: providerState.userId ?? "",
                                                  ),
                                                ),
                                              );
                                            }
                                          });
                                        }
                                      },
                                      child: Container(
                                        height: 50,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15), color: ColorConstant.primary1),
                                        child: const Center(
                                          child: Text(
                                            "Submit",
                                            style: TextStyle(
                                                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
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
                          child: SizedBox(height: height * .75, child: Image.asset("assets/images/dp/forgot pass.jpg")),
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
                              providerState.isOtpSend == true
                                  ? SizedBox()
                                  : TextfieldRefactor(
                                      autofocus: true,
                                      formKey: _mobileNumberKey,
                                      keyboardType: TextInputType.phone,
                                      controller: _mobileNumberController,
                                      labelText: "Please enter the registered mobile number",
                                      validator: (p0) {
                                        if (AppUtils.validationOfPhone(_mobileNumberController.text)) {
                                          return null;
                                        } else {
                                          return "Enter a valid Phone number";
                                        }
                                      },
                                    ),
                              SizedBox(
                                height: 15,
                              ),
                              providerState.isOtpSend == true
                                  ? SizedBox()
                                  : providerState.isLoading
                                      ? Center(
                                          child: ReusableLoadingWidget(),
                                        )
                                      : InkWell(
                                          onTap: () {
                                            // to send otp in web
                                            if (_mobileNumberKey.currentState!.validate()) {
                                              Provider.of<EnterPhoneNumberScreenController>(context, listen: false)
                                                  .sendOtp(phoneNumber: _mobileNumberController.text)
                                                  .then((value) {
                                                if (value) {
                                                  Provider.of<EnterPhoneNumberScreenController>(context, listen: false)
                                                      .onOtpSend(true);
                                                  AppUtils.oneTimeSnackBar(
                                                      bgColor: ColorConstant.primary1,
                                                      "OTP sent successfully",
                                                      context: context);
                                                  setState(() {
                                                    _start = 60; // Reset timer on OTP send
                                                    startTimer();
                                                  });
                                                }
                                              });
                                            }
                                          },
                                          child: Container(
                                            height: 50,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(15), color: ColorConstant.primary1),
                                            child: const Center(
                                              child: Text(
                                                "Send OTP",
                                                style: TextStyle(
                                                    color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                              SizedBox(
                                height: 15,
                              ),
                              providerState.isOtpSend == false
                                  ? SizedBox()
                                  : Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: SizedBox(
                                        width: width,
                                        child: Form(
                                          key: otpKey,
                                          child: Pinput(
                                              autofocus: true,
                                              controller: otpController,
                                              length: 4,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                                  borderRadius: BorderRadius.circular(10),
                                                  border: Border.all(
                                                    color: const Color.fromARGB(255, 101, 28, 91).withOpacity(0.5),
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
                                                  borderRadius: BorderRadius.circular(10),
                                                  border: Border.all(
                                                    color: ColorConstant.primary1,
                                                    width: 1.0,
                                                  ),
                                                ),
                                              ),
                                              validator: (value) {
                                                if (otpController.length != 4) {
                                                  return "Enter a valid OTP";
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
                              providerState.isOtpSend == false
                                  ? SizedBox()
                                  : _start >= 1
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          child: Text(
                                            'Resend OTP in $_start seconds',
                                            style: TextStyle(
                                              color: ColorConstant.primary1,
                                              fontSize: 16,
                                            ),
                                          ),
                                        )
                                      : providerState.isLoading
                                          ? Center(
                                              child: ReusableLoadingWidget(),
                                            )
                                          : Center(
                                              child: TextButton(
                                                onPressed: () {
                                                  Provider.of<EnterPhoneNumberScreenController>(context, listen: false)
                                                      .sendOtp(phoneNumber: _mobileNumberController.text)
                                                      .then((value) {
                                                    if (value) {
                                                      AppUtils.oneTimeSnackBar(
                                                          bgColor: ColorConstant.primary1,
                                                          "OTP sent successfully",
                                                          context: context);
                                                      setState(() {
                                                        _start = 60; // Reset timer on OTP send
                                                        startTimer();
                                                      });
                                                    }
                                                  });
                                                },
                                                child: Text(
                                                  'Resend OTP',
                                                  style: TextStyle(
                                                    color: ColorConstant.primary1,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                              SizedBox(
                                height: 5,
                              ),
                              providerState.isOtpSend == false
                                  ? SizedBox()
                                  : InkWell(
                                      onTap: () {
                                        if (otpKey.currentState!.validate()) {
                                          Provider.of<EnterPhoneNumberScreenController>(context, listen: false)
                                              .verifyOtp(
                                                  phoneNumber: _mobileNumberController.text,
                                                  otp: otpController.text.trim())
                                              .then((value) {
                                            if (value == true) {
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => ChangePasswordScreen(
                                                    userId: providerState.userId ?? "",
                                                  ),
                                                ),
                                              );
                                            }
                                          });
                                        }
                                      },
                                      child: Container(
                                        height: 50,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15), color: ColorConstant.primary1),
                                        child: const Center(
                                          child: Text(
                                            "Submit",
                                            style: TextStyle(
                                                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
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
