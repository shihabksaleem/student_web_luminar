// Create an input widget that takes only one digit
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:lumainar/core/app_utils/app_utils.dart';
import 'package:lumainar/global_widgets/reusable_loading_widget.dart';
import 'package:lumainar/presentation/mobile/batch_bottom_tab/controller/batch_bottom_tab_controller.dart';
import 'package:lumainar/presentation/mobile/batch_bottom_tab/view/batch_bottom_tab.dart';
import 'package:lumainar/presentation/mobile/otp_verification_screen/controller/otp_verification_screen_controller.dart';

import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/colors.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key, this.isNavigationFromLogin = false, required this.phoneNumber})
      : super(key: key);

  final bool isNavigationFromLogin;

  final String phoneNumber;
  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
//write code to send otp if loging in without mobile number verification

      if (widget.isNavigationFromLogin == true && widget.phoneNumber.isNotEmpty) {
        await Provider.of<OtpVerificationScreenController>(context, listen: false)
            .onResendOtp(phoneNumber: widget.phoneNumber);
      }
    });
    super.initState();
  }

  TextEditingController otpController = TextEditingController();
  final otpKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final otpScreenProvider = Provider.of<OtpVerificationScreenController>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorConstant.primary1),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(),
                Lottie.asset(
                  'assets/animations/email_verification.json',
                  reverse: true,
                ),

                Text(
                  'Verification Code',
                  style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w700,
                    color: const Color.fromARGB(255, 138, 36, 142),
                    fontSize: 32.0,
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Please enter the verification code that we have sent to your phone number ',
                        style: GoogleFonts.urbanist(
                          fontSize: 14.0,
                          color: const Color(0xff808d9e),
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                      TextSpan(
                        text: widget.phoneNumber,
                        style: GoogleFonts.urbanist(
                          fontSize: 14.0,
                          color: const Color(0xff005BE0),
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),

                /// pinput package we will use here
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    width: width,
                    child: Form(
                      key: otpKey,
                      child: Pinput(
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
                              return "enter a valid otp";
                            } else {
                              return null;
                            }
                          }),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 16.0,
                ),
                otpScreenProvider.isResendLoading
                    ? ReusableLoadingWidget()
                    : Center(
                        child: TextButton(
                          onPressed: () {
                            Provider.of<OtpVerificationScreenController>(context, listen: false)
                                .onResendOtp(phoneNumber: widget.phoneNumber)
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
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: otpScreenProvider.isLoading
          ? SizedBox(
              height: 100,
              child: Center(child: ReusableLoadingWidget()),
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: GestureDetector(
                onTap: () {
                  // Navigator.of(context).pushReplacement(
                  //     MaterialPageRoute(builder: (context) => ResetPassword()));

                  Provider.of<OtpVerificationScreenController>(context, listen: false)
                      .verifyOtp(phoneNumber: widget.phoneNumber, otp: otpController.text.trim())
                      .then((value) {
                    if (value == true) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChangeNotifierProvider(
                                  create: (context) => BatchScreenController(), child: BatchBottomTab())),
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
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: ColorConstant.primary1),
                  child: const Center(
                    child: Text(
                      "Verify",
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
