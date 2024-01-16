import 'package:google_fonts/google_fonts.dart';
import 'package:seedswild/core/app_export.dart';
import 'package:seedswild/services/auth/provider/login_provider.dart';
import 'package:seedswild/services/auth/provider/sign_up_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/colors.dart';
import '../../widgets/form_fields.dart';

class SignUpScreen extends StatelessWidget {
  // CONTROLLERS
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController password1Controller = TextEditingController();
  final TextEditingController password2Controller = TextEditingController();

  // FOCUS NODES
  final FocusNode usernameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode password1FocusNode = FocusNode();
  final FocusNode password2FocusNode = FocusNode();

  // GLOBAL KEYS
  final GlobalKey<FormState> usernameGlobalKey = GlobalKey<FormState>();
  final GlobalKey<FormState> emailGlobalKey = GlobalKey<FormState>();
  final GlobalKey<FormState> password1GlobalKey = GlobalKey<FormState>();
  final GlobalKey<FormState> password2GlobalKey = GlobalKey<FormState>();

  // BUILD
  @override
  Widget build(BuildContext context) {
    var sigInUpProvider = Provider.of<SignUpProvider>(context);

    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 248, 252, 1),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //TOP
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: SeedsColor.primary,
              ),
              child: Icon(
                Icons.eco_outlined,
                size: 100,
                color: Colors.white,
              ),
            ),

            // MID
            Column(
              children: [
                // FIELDS
                SeedsTextFormField(
                  focusNode: usernameFocusNode,
                  controller: usernameController,
                  hintText: "Username",
                  prefixIcon: Icons.verified_user,
                ),
                SizedBox(height: 10),

                SeedsTextFormField(
                  focusNode: emailFocusNode,
                  controller: emailController,
                  hintText: "Email",
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icons.email_outlined,
                ),
                SizedBox(height: 10),

                SeedsTextFormField(
                  focusNode: password1FocusNode,
                  controller: password1Controller,
                  hintText: "Password",
                  keyboardType: TextInputType.visiblePassword,
                  suffix: GestureDetector(
                    onTap: () {
                      sigInUpProvider.setObSecurePassword("p1");
                    },
                    child: sigInUpProvider.obSecurePassword1
                          ? Icon(Icons.visibility_off, color: SeedsColor.primary)
                          : Icon(Icons.visibility, color: SeedsColor.primary),
                  ),
                  obscureText: sigInUpProvider.obSecurePassword1,
                  prefixIcon: Icons.lock_outline,
                ),
                SizedBox(height: 10),

                SeedsTextFormField(
                  focusNode: password2FocusNode,
                  controller: password2Controller,
                  hintText: "Confirm Password",
                  prefixIcon: Icons.lock_outline,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: sigInUpProvider.obSecurePassword2,
                  suffix: GestureDetector(
                    onTap: () {
                      sigInUpProvider.setObSecurePassword(
                          "p2"); // Call a method to toggle obsecure
                    },
                    child: sigInUpProvider.obSecurePassword2
                          ? Icon(Icons.visibility_off, color: SeedsColor.primary)
                          : Icon(Icons.visibility, color: SeedsColor.primary),
                  ),
                ),
                SizedBox(height: 10),

                // LOWER
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: SeedsColor.primary,
                    foregroundColor: Colors.white,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    shadowColor: Colors.lightGreen,
                    minimumSize: Size(double.infinity, 52),
                  ),
                  onPressed: () {
                    Map data = {
                      "username": usernameController.text.toString(),
                      "email": emailController.text.toString(),
                      "password1": password1Controller.text.toString(),
                      "password2": password2Controller.text.toString(),
                    };
                    sigInUpProvider.signUpApi(data, context);
                  },
                  child: sigInUpProvider.signUploading
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text(
                          "Sign Up ",
                          style: GoogleFonts.aBeeZee(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: getPadding(top: 14),
                      child: RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Already have an account? ",
                              style: GoogleFonts.aBeeZee(
                                color: ColorConstant.gray500,
                                fontSize: getFontSize(13),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: "Sign In",
                              style: GoogleFonts.aBeeZee(
                                fontWeight: FontWeight.bold,
                                color: SeedsColor.primary,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            //LOWER
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: SeedsColor.primary,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "or",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: SeedsColor.primary,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.facebook,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        context.read<LoginProvider>().handleGoogleSignIn(context);
                      },
                      child: Container(
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.g_mobiledata_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
