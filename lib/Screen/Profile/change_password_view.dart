import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../Controllers/profile_controller.dart';
import '../../utils/size_config.dart';
import '../../utils/style.dart';
import '../Widgets/constant.dart';
import '../Widgets/loader.dart';

class ChangePasswordView extends GetView {
   ChangePasswordView({Key? key}) : super(key: key);
   final ProfileController profileController = ProfileController();
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfigCustom sizeConfig = SizeConfigCustom();
    sizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'change_password'.tr,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: kMainColor,
      ),
      body: GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (profile) =>
          Stack(
              children: [
      SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 32.h,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'old_password'.tr,
                    style: (TextStyle(
                      fontSize: 14.sp,
                      color: fontColor,
                    )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12.r),
                    child:
                    TextFormField(
                      controller: profile.passwordCurrentController,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.text,
                      cursorColor:kMainColor,
                      validator: (value) => value!.isEmpty ? 'Enter old password' : null,
                      decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide:  BorderSide(
                            width: 1,
                            color: redColor,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide:  BorderSide(
                            width: 1,
                            color: redColor,
                          ),
                        ),
                        fillColor: Colors.red,
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(
                              color: dividerColor, width: 1.0),
                        ),

                        enabledBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                          borderSide: BorderSide(width: 1, color: borderColor),
                        ),
                      ),
                      onFieldSubmitted: (value) {
                        //add code
                      },
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    'new_password'.tr,
                    style: (TextStyle(
                      fontSize: 14.sp,
                      color: fontColor,
                    )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12.0.r),
                    child:
                    TextFormField(
                      controller: profile.passwordController,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.text,
                      cursorColor:kMainColor,
                      validator: (value) => value!.isEmpty ? 'Enter new password' : null,
                      decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide:  BorderSide(
                            width: 1,
                            color: redColor,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide:  BorderSide(
                            width: 1,
                            color: redColor,
                          ),
                        ),
                        fillColor: Colors.red,
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(
                              color: dividerColor, width: 1.0),
                        ),

                        enabledBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                          borderSide: BorderSide(width: 1, color: borderColor),
                        ),
                      ),
                      onFieldSubmitted: (value) {
                        //add code
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'retype_new_password'.tr,
                    style: (const TextStyle(
                      fontSize: 14,
                      color: fontColor,
                    )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12.r),
                    child: TextFormField(
                      controller: profile.passwordConfirmController,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.text,
                      cursorColor:kMainColor,
                      validator: (value) => value!.isEmpty ? 'Enter confirmation password' : null,
                      decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide:  BorderSide(
                            width: 1,
                            color: redColor,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide:  BorderSide(
                            width: 1,
                            color: redColor,
                          ),
                        ),
                        fillColor: Colors.red,
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(
                              color: dividerColor, width: 1.0),
                        ),

                        enabledBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                          borderSide: BorderSide(width: 1, color: borderColor),
                        ),
                      ),
                      onFieldSubmitted: (value) {
                        //add code
                      },
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),

                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          final FormState? form = _formKey.currentState;
                          if (form!.validate()) {
                            profile.updateUserPassword(context: context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kMainColor,
                          minimumSize: Size(328.w, 52.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: Text(
                          "change_password".tr,
                          style: fontMedium,
                        ),
                      ),
                    ],
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
                profile.passwordLoader
                    ? Positioned(
                  child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white60,
                      child: const Center(child: LoaderCircle())),
                )
                    : const SizedBox.shrink(),
    ])
      ),
    );
  }
}
