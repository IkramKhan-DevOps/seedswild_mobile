import 'package:annafi_app/core/utils/color_constant.dart';
import 'package:annafi_app/core/utils/image_constant.dart';
import 'package:annafi_app/core/utils/size_utils.dart';
import 'package:annafi_app/presentation_layer/features/settings/statemanagement/profile_provider.dart';
import 'package:annafi_app/utils/components/custom_button.dart';
import 'package:annafi_app/utils/components/custom_icon_button.dart';
import 'package:annafi_app/utils/components/custom_image_view.dart';
import 'package:annafi_app/utils/components/custom_text_form_field.dart';
import 'package:annafi_app/utils/theme/app_stylea.dart';
import 'package:annafi_app/widgets/empty.dart';
import 'package:annafi_app/widgets/progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
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
        padding: EdgeInsets.all(20),
        child: FutureBuilder(
          future: Provider.of<ProfileProvider>(context, listen: false)
              .getProfileAPICAll(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return ProgressCircular();
            } else if (snapshot.hasError) {
              return Center(child: Text("Error loading user data"));
            } else {
              var data = Provider.of<ProfileProvider>(context).userModel;

              firstNameController.text = data!.firstName;
              lastNameController.text = data.firstName;
              emailController.text = data.email;

              return Container(
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
                      text: context.watch<ProfileProvider>().isLoading ? CircularProgressIndicator(color: Colors.white): "Submit",
                      onTap: () {

                        Map data = {
                          "first_name": firstNameController.text.toString(),
                          "last_name": lastNameController.text.toString(),
                        };
                        context.read<ProfileProvider>().putProfileAPICall(data, context);
                      },
                    ),

                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
