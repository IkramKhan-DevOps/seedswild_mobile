import 'package:google_fonts/google_fonts.dart';
import 'package:seedswild/core/utils/color_constant.dart';
import 'package:seedswild/core/utils/size_utils.dart';
import 'package:seedswild/data_layer/models/profile_model.dart';
import 'package:seedswild/services/settings/statemanagement/profile_provider.dart';
import 'package:seedswild/utils/components/custom_button.dart';
import 'package:seedswild/utils/components/custom_text_form_field.dart';
import 'package:seedswild/utils/theme/app_stylea.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seedswild/widgets/buttons.dart';

import '../../core/constants/colors.dart';

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
        backgroundColor: SeedsColor.primary,
        elevation: 0,
        leading: InkWell(
          onTap: ()=> Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
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
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(70),
                  ),
                  child: Icon(
                    Icons.usb,
                    size: 60,
                    color: SeedsColor.primary,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "${data.firstName} ${data.lastName}",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.aBeeZee(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "${data.email}",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.aBeeZee(
                      fontSize: 13, color: SeedsColor.primary),
                ),
              ),
              SizedBox(height: 30),

              // FORM
              Text(
                "First Name",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style:
                    GoogleFonts.aBeeZee(color: Colors.grey[700], fontSize: 16),
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
                style:
                    GoogleFonts.aBeeZee(color: Colors.grey[700], fontSize: 16),
              ),
              CustomTextFormField(
                focusNode: FocusNode(),
                controller: lastNameController,
                hintText: "Maria",
                margin: getMargin(top: 5),
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
                child: context.watch<ProfileProvider>().isLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text(
                        "Submit",
                        style: GoogleFonts.aBeeZee(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                onPressed: () {
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
