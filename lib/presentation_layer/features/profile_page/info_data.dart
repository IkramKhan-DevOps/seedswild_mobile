import 'package:annafi_app/core/utils/color_constant.dart';
import 'package:annafi_app/core/utils/image_constant.dart';
import 'package:annafi_app/core/utils/size_utils.dart';
import 'package:annafi_app/data_layer/models/user_model.dart';
import 'package:annafi_app/data_layer/urls/app_urls.dart';
import 'package:annafi_app/presentation_layer/features/profile_page/profile_provider.dart';
import 'package:annafi_app/presentation_layer/features/profile_page/profile_repo.dart';
import 'package:annafi_app/utils/components/custom_button.dart';
import 'package:annafi_app/utils/components/custom_icon_button.dart';
import 'package:annafi_app/utils/components/custom_image_view.dart';
import 'package:annafi_app/utils/components/custom_text_form_field.dart';
import 'package:annafi_app/utils/routes/app_routes.dart';
import 'package:annafi_app/utils/theme/app_stylea.dart';
import 'package:flutter/material.dart';

import '../user_session/statemanagement/user_provider.dart';


// ignore_for_file: must_be_immutable

class InformationScreen extends StatefulWidget {

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userRepository = UserRepository(AppUrls.profile);
    final profileProvider = ProfileProvider(userRepository);
    profileProvider.fetchUserInfo();
    print("ADD -- " + profileProvider.userModel.toString());

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        resizeToAvoidBottomInset: false,

        //app bar
        appBar: AppBar(
          title: Text("Profile", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.green,
        ),

        //body
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // HEADER

              SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: getVerticalSize(104),
                  width: getHorizontalSize(92),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgEllipse591x92,
                        height: getVerticalSize(91),
                        width: getHorizontalSize(92),
                        radius: BorderRadius.circular(
                          getHorizontalSize(46),
                        ),
                        alignment: Alignment.topCenter,
                      ),
                      CustomIconButton(
                        height: 29,
                        width: 30,
                        variant: IconButtonVariant.OutlineWhiteA700,
                        padding: IconButtonPadding.PaddingAll6,
                        alignment: Alignment.bottomCenter,
                        child: CustomImageView(
                          svgPath: ImageConstant.imgCamera,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Name",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtPoppinsMedium20,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "email@gmail.com",
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
              SizedBox(height: 15),

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
              SizedBox(height: 15),

              Text(
                "Email",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtPoppinsMedium15,
              ),
              CustomTextFormField(
                focusNode: FocusNode(),
                controller: emailController,
                hintText: "ana_maria@exarth.com",
                margin: getMargin(top: 5),
              ),
              SizedBox(height: 15),

              CustomButton(
                height: getVerticalSize(52),
                text: "Complete",
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.profilePage);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
