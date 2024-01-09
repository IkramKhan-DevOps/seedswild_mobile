import 'package:google_fonts/google_fonts.dart';
import 'package:seedswild/core/app_export.dart';
import 'package:seedswild/services/auth/provider/login_provider.dart';
import 'package:seedswild/utils/components/custom_button.dart';
import 'package:seedswild/utils/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/form_fields.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // CONTROLLERS
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  // ON TAB BUTTON USE
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  GlobalKey<FormState> nameKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordKey = GlobalKey<FormState>();

  // DESTRUCTION IF WE MOVE TO NEXT SCREEN
  @override
  void dispose() {
    nameController.dispose();
    passController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  // BUILD
  @override
  Widget build(BuildContext context) {
    var loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 248, 252, 1),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 80, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // TOP
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Color.fromRGBO(89, 175, 109, 1),
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
                SeedsTextFormField(
                  focusNode: emailFocusNode,
                  controller: nameController,
                  hintText: "Email",
                  prefixIcon: Icons.email_outlined,
                ),
                SizedBox(height: 10),
                SeedsTextFormField(
                  obscureText: loginProvider.obSecure,
                  focusNode: passwordFocusNode,
                  controller: passController,
                  hintText: "Password",
                  prefixIcon: Icons.lock_outline,
                  suffix: GestureDetector(
                    onTap: () {
                      loginProvider
                          .setObSecure(); // Call a method to toggle ob secure
                    },
                    child: loginProvider.obSecure
                        ? Icon(Icons.visibility_off,
                            color: Color.fromRGBO(89, 175, 109, 1))
                        : Icon(Icons.visibility,
                            color: Color.fromRGBO(89, 175, 109, 1)),
                  ),
                ),
                SizedBox(height: 10),

                // SIGN IN BTN, SIGNUP LINK
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(89, 175, 109, 1),
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
                      "email": nameController.text.toString(),
                      "password": passController.text.toString(),
                    };
                    loginProvider.loginAPI(data, context);
                  },
                  child: loginProvider.loading
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text(
                          "LOGIN",
                          style: GoogleFonts.aBeeZee(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.signUpScreen,
                        );
                      },
                      child: Text(
                        "Signup",
                        style: GoogleFonts.aBeeZee(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(89, 175, 109, 1),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.forgotPasswordScreen,
                        );
                      },
                      child: Text(
                        "Forgot Password",
                        style: GoogleFonts.aBeeZee(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(89, 175, 109, 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // LOWER
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Color.fromRGBO(89, 175, 109, 1),
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
                        color: Color.fromRGBO(89, 175, 109, 1),
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
                    Container(
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
