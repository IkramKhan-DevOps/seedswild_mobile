import 'package:google_fonts/google_fonts.dart';
import 'package:seedswild/core/app_export.dart';
import 'package:seedswild/services/auth/provider/password_reset_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seedswild/widgets/app_bar.dart';
import 'package:seedswild/widgets/form_fields.dart';

import '../../core/constants/colors.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    PasswordResetProvider provider = Provider.of<PasswordResetProvider>(context);

    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 248, 252, 1),
      resizeToAvoidBottomInset: false,

      // APP BAR
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: SeedsColor.primary,
        title: Text("Password Reset", style: GoogleFonts.aBeeZee(color: Colors.white)),
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),

      // BODY
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            Text(
              "We need your registration email to send you password reset code!",
              maxLines: null,
              textAlign: TextAlign.left,
              style: GoogleFonts.aBeeZee(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 20),

            SeedsTextFormField(
              focusNode: FocusNode(),
              controller: emailController,
              hintText: "mark@exarth.com",
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Icons.email_outlined,
            ),
            SizedBox(height: 20),

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
                  'email': emailController.text
                };
                provider.forgetAPICall(context, data);
              },
              child: provider.isLoading? CircularProgressIndicator(color: Colors.white): Text(
                "Send Link",
                style: GoogleFonts.aBeeZee(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              )
            ),
          ],
        ),
      ),
    );
  }

}
