import 'package:seedswild/core/utils/color_constant.dart';
import 'package:seedswild/core/utils/size_utils.dart';
import 'package:seedswild/data_layer/models/profile_model.dart';
import 'package:seedswild/services/settings/statemanagement/profile_provider.dart';
import 'package:seedswild/utils/components/custom_button.dart';
import 'package:seedswild/utils/components/custom_text_form_field.dart';
import 'package:seedswild/utils/theme/app_stylea.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    ProfileModel? data = context.watch<ProfileProvider>().userModel;

    firstNameController.text = data!.firstName;
    lastNameController.text = data.lastName;

    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      resizeToAvoidBottomInset: false,

      //app bar
      appBar: AppBar(
        title: Text("Profile", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        elevation: 0,
      ),

      //body
      body: Container(
        padding: EdgeInsets.all(10),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // HEADER

              SizedBox(height: 20),

              Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.verified_user_outlined, size: 100,
                  color: Colors.green,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "${data!.firstName} ${data.lastName}",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtPoppinsMedium20,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "${data.email}",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtPoppinsRegular127,
                ),
              ),
              SizedBox(height: 20),

              // FORM
              Text(
                "First Name",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtPoppinsMedium15,
              ),
              CustomTextFormField(
                focusNode: FocusNode(),
                controller: firstNameController,
                hintText: "Ana",
                margin: getMargin(top: 5),
              ),
              SizedBox(height: 10),

              Text(
                "Last Name",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtPoppinsMedium15,
              ),
              CustomTextFormField(
                focusNode: FocusNode(),
                controller: lastNameController,
                hintText: "Maria",
                margin: getMargin(top: 5),
              ),
              SizedBox(height: 20),

              CustomButton(
                height: getVerticalSize(52),
                text: context.watch<ProfileProvider>().isLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : "Submit",
                onTap: () {
                  Map data = {
                    "first_name": firstNameController.text.toString(),
                    "last_name": lastNameController.text.toString(),
                  };
                  context
                      .read<ProfileProvider>()
                      .putProfileAPICall(data, context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
