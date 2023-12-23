import 'package:annafi_app/core/app_export.dart';
import 'package:annafi_app/presentation_layer/features/settings/statemanagement/password_change_provider.dart';
import 'package:annafi_app/utils/components/custom_button.dart';
import 'package:annafi_app/utils/components/custom_text_form_field.dart';
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
            SizedBox(height: 50),

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
            SizedBox(height: 40),

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

          ],
        ),
      ),
    );
  }
}
