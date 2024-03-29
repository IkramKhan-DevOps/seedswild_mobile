import 'package:google_fonts/google_fonts.dart';
import 'package:seedswild/core/app_export.dart';
import 'package:seedswild/services/settings/statemanagement/password_change_provider.dart';
import 'package:seedswild/utils/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/colors.dart';

class PasswordChangeScreen extends StatefulWidget {
  @override
  State<PasswordChangeScreen> createState() => _PasswordChangeScreenState();
}

class _PasswordChangeScreenState extends State<PasswordChangeScreen> {
  TextEditingController previousPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  FocusNode previousPasswordNode = FocusNode();
  FocusNode newPasswordNode = FocusNode();
  FocusNode confirmPasswordNode = FocusNode();

  @override
  void dispose() {
    previousPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    previousPasswordNode.dispose();
    newPasswordNode.dispose();
    confirmPasswordNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PasswordChangeProvider>(context);

    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      resizeToAvoidBottomInset: false,

      //app bar
      appBar: AppBar(
        title: Text("Password Change", style: TextStyle(color: Colors.white)),
        backgroundColor: SeedsColor.primary,
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),

      //body
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          // FIELDS
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(70),
                ),
                child: Icon(
                  Icons.security,
                  size: 60,
                  color: SeedsColor.primary,
                ),
              ),
            ),
            SizedBox(height: 20),

            //previous password
            Text(
              "Previous Password",
              style: GoogleFonts.aBeeZee(
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
            CustomTextFormField(
              controller: previousPasswordController,
              focusNode: previousPasswordNode,
              hintText: "********",
              isObscureText: true,
              margin: getMargin(top: 5),
            ),
            SizedBox(height: 20),

            //previous password
            Text(
              "New Password",
              style: GoogleFonts.aBeeZee(
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
            CustomTextFormField(
              controller: newPasswordController,
              focusNode: newPasswordNode,
              hintText: "********",
              isObscureText: true,
              margin: getMargin(top: 5),
            ),
            SizedBox(height: 20),

            //previous password
            Text(
              "Confirm Password",
              style: GoogleFonts.aBeeZee(
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
            CustomTextFormField(
              controller: confirmPasswordController,
              focusNode: confirmPasswordNode,
              hintText: "********",
              isObscureText: true,
              margin: getMargin(top: 5),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.forgotPasswordScreen,
                  );
                },
                child: Text(
                  "Forgot Password!",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.aBeeZee(
                      color: SeedsColor.primary, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(height: 10),

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
                  "old_password": previousPasswordController.text.toString(),
                  "new_password1": newPasswordController.text.toString(),
                  "new_password2": confirmPasswordController.text.toString(),
                };
                provider.postPasswordChangeAPICall(context, data);
              },
              child: Text(
                "Submit",
                style: GoogleFonts.aBeeZee(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 20),

            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "NOTE! ",
                      style: GoogleFonts.aBeeZee(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text:
                          "If you have log in using Google/Apple and you didn't set "
                          "password previously, leave the previous password blank",
                      style: GoogleFonts.aBeeZee(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
