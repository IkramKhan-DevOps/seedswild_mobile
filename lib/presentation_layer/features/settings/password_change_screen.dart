import 'package:seedswild/core/app_export.dart';
import 'package:seedswild/presentation_layer/features/settings/statemanagement/password_change_provider.dart';
import 'package:seedswild/utils/components/custom_button.dart';
import 'package:seedswild/utils/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        backgroundColor: Colors.green,
        elevation: 0,
      ),

      //body
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          // FIELDS
          children: [

            Center(
              child: Icon(
                Icons.shield_moon_outlined, size: 100, color: Colors.green,
              ),
            ),
            SizedBox(height: 20),

            //previous password
            Text("Previous Password", style: AppStyle.txtPoppinsMedium15),
            CustomTextFormField(
              controller: previousPasswordController,
              focusNode: previousPasswordNode,
              hintText: "********",
              isObscureText: true,
              margin: getMargin(top: 5),
            ),
            SizedBox(height: 20),

            //previous password
            Text("New Password", style: AppStyle.txtPoppinsMedium15),
            CustomTextFormField(
              controller: newPasswordController,
              focusNode: newPasswordNode,
              hintText: "********",
              isObscureText: true,
              margin: getMargin(top: 5),
            ),
            SizedBox(height: 20),

            //previous password
            Text("Confirm Password", style: AppStyle.txtPoppinsMedium15),
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
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),

            CustomButton(
              height: getVerticalSize(52),
              text: "Submit",
              onTap: (){
                Map data = {
                  "old_password": previousPasswordController.text.toString(),
                  "new_password1": newPasswordController.text.toString(),
                  "new_password2": confirmPasswordController.text.toString(),
                };
                provider.postPasswordChangeAPICall(context, data);
              },
            ),
            SizedBox(height: 20),

            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "NOTE! ",
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold
                      )
                    ),
                    TextSpan(
                      text: "If you have log in using Google/Apple and you didn't set "
                          "password previously, leave the previous password blank",
                      style: TextStyle(
                        color: Colors.grey
                      )
                    )
                  ]
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
