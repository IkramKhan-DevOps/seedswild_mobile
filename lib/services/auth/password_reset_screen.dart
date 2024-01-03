import 'package:seedswild/core/app_export.dart';
import 'package:seedswild/services/auth/provider/password_reset_provider.dart';
import 'package:seedswild/utils/components/custom_button.dart';
import 'package:seedswild/utils/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    PasswordResetProvider provider = Provider.of<PasswordResetProvider>(context);

    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      resizeToAvoidBottomInset: false,

      // APP BAR
      appBar: AppBar(
        title: Text("Password Reset", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        elevation: 0,
      ),

      // BODY
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            Text(
              "We need your registration email to send you password reset code!",
              maxLines: null,
              textAlign: TextAlign.left,
              style: AppStyle.txtPoppinsRegular16,
            ),
            SizedBox(height: 20),

            CustomTextFormField(
              focusNode: FocusNode(),
              controller: emailController,
              hintText: "mark@exarth.com",
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),

            CustomButton(
              height: getVerticalSize(52),
              onTap: () {
                Map data = {
                  'email': emailController.text
                };
                provider.forgetAPICall(context, data);
              },
              text: provider.isLoading? CircularProgressIndicator(color: Colors.white): "Submit",
            ),
          ],
        ),
      ),
    );
  }

}
