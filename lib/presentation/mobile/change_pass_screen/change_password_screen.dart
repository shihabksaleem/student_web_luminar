import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:lumainar/core/app_utils/app_utils.dart';
import 'package:lumainar/core/constants/colors.dart';
import 'package:lumainar/global_widgets/curstom_input_field_with_title.dart';
import 'package:lumainar/presentation/mobile/change_pass_screen/controller/change_password_screen_controller.dart';
import 'package:provider/provider.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key, required this.userId});
  final String userId;

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confrimNewPasswordController = TextEditingController();

  final newPassKey = GlobalKey<FormState>();
  final confirmPassKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorConstant.primary1),
        centerTitle: true,
        title: Text(
          "Update your password",
          style: TextStyle(color: ColorConstant.primary1, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return constraints.maxWidth < 760
              ? SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Lottie.asset(
                            'assets/animations/change_passwords.json',
                            reverse: true,
                          ),
                        ),
                        Text(
                          "Change Your Password",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        PasswordField(name: "New Password"),
                        SizedBox(height: 20),
                        PasswordField(name: "Confirm Password"),
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.of(context).pushReplacement(
                              //     MaterialPageRoute(builder: (context) => ProfileScreen()));
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration:
                                  BoxDecoration(borderRadius: BorderRadius.circular(15), color: ColorConstant.primary1),
                              child: Center(
                                child: Text(
                                  "Submit",
                                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Row(
                  children: [
                    Expanded(
                        flex: 4,
                        child: Container(
                          child: Center(
                            child: Lottie.asset(
                              'assets/animations/change_passwords.json',
                              reverse: true,
                            ),
                          ),
                        )),
                    Expanded(
                      flex: 2,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Change Your Password",
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 20),
                              CustomInputFieldWithTitle(
                                obscureText: true,
                                controller: newPasswordController,
                                formKey: newPassKey,
                                title: "New Password",
                                hintText: "Enter",
                                IsEditable: true,
                                validator: (value) {
                                  if (value != null && value.length >= 6) {
                                    return null;
                                  } else {
                                    return "password must contain 6 characters";
                                  }
                                },
                              ),
                              CustomInputFieldWithTitle(
                                obscureText: true,
                                controller: confrimNewPasswordController,
                                formKey: confirmPassKey,
                                title: "Confirm New password",
                                hintText: "Enter",
                                IsEditable: true,
                                validator: (value) {
                                  if (confrimNewPasswordController.text.trim().length < 4) {
                                    return "Enter a valid password";
                                  } else if (confrimNewPasswordController.text.trim() ==
                                      newPasswordController.text.trim()) {
                                    return null;
                                  } else {
                                    return "Passwords doesnt match";
                                  }
                                },
                              ),
                              SizedBox(height: 20),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                                child: GestureDetector(
                                  onTap: () async {
                                    if (newPassKey.currentState!.validate() &&
                                        confirmPassKey.currentState!.validate()) {
                                      await Provider.of<ChangePasswordScreenController>(context, listen: false)
                                          .updatePassword(
                                              newPassword: newPasswordController.text.trim(), userId: widget.userId)
                                          .then((value) {
                                        if (value) {
                                          Navigator.pop(context);
                                          AppUtils.oneTimeSnackBar("Your Password Updated Successfully",
                                              context: context);
                                        }
                                      });
                                    }
                                  },
                                  child: Container(
                                    height: 50,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15), color: ColorConstant.primary1),
                                    child: Center(
                                      child: Text(
                                        "Submit",
                                        style:
                                            TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                                      ),
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

class PasswordField extends StatefulWidget {
  final name;
  const PasswordField({super.key, required this.name});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  // show the password or not
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _isObscure,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorConstant.primary1)),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorConstant.primary1)),
          labelText: widget.name,
          labelStyle: TextStyle(color: ColorConstant.primary1),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: ColorConstant.primary1),
          ),
          suffixIcon: IconButton(
              icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off, color: ColorConstant.primary1),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              })
          //  focusedBorder: OutlineInputBorder()
          ),
    );
  }
}
