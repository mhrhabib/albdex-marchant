import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import '/Screen/Widgets/constant.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shimmer/shimmer.dart';

import '../../Controllers/profile_controller.dart';
import '../../utils/image.dart';
import '../../utils/size_config.dart';
import '../../utils/style.dart';
import '../Widgets/loader.dart';
import '../Widgets/shimmer/profile_shimmer.dart';

//ignore: must_be_immutable
class EditProfileView extends GetView {
   EditProfileView({Key? key}) : super(key: key);

  final ProfileController profileController = ProfileController();
  final _formKey = GlobalKey<FormState>();
  String imageFile = '';


   @override
  Widget build(BuildContext context) {
     SizeConfigCustom sizeConfig = SizeConfigCustom();
     sizeConfig.init(context);
     void _pickFile() async {
       FilePickerResult? result = await FilePicker.platform.pickFiles();

       if (result != null && result.files.single.path != null) {
         PlatformFile imageFiles = result.files.first;
         imageFile = imageFiles.path!;
         (context as Element).markNeedsBuild();
       };
     }

     return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:  Text(
          'edit_profile'.tr,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: kMainColor,
      ),
      body: GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (profile) =>
      profile.profileLoader
      ? ProfileShimmer()
          :
      Stack(children: [
      Center(
      child:
      SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Stack(
                children: [
                  SizedBox(
                    width: 100.w,
                    height: 100.h,
                    child: Center(
                      child:imageFile == '' ?
                      CachedNetworkImage(
                        imageUrl:profile.profileUser.image.toString(),
                        imageBuilder: (context, imageProvider) =>
                            CircleAvatar(
                              radius: 50.0,
                              backgroundColor: Colors.transparent,
                              backgroundImage:imageProvider,
                            ),

                        placeholder: (context, url) => Shimmer.fromColors(
                          child: CircleAvatar(radius: 50.0),
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[400]!,
                        ),
                        errorWidget: (context, url, error) =>
                            Icon(CupertinoIcons.person,size: 50,),
                      ):
                        CircleAvatar(
                          radius: 50.0,
                          backgroundColor: Colors.transparent,
                          backgroundImage:FileImage(File(imageFile.toString())),
                        )
                    ),
                  ),
                  Positioned(
                    top: 75,
                    right: 20,
                    child: InkWell(
                      onTap: (() => _pickFile()),
                      child: SizedBox(
                        width: 30.w,
                        height: 30.h,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: SizedBox(
                            width: 30.w,
                            height: 30.h,
                            child: CircleAvatar(
                              backgroundColor: darkGray,
                              child: Image.asset(
                                Images.iconEdit,
                                fit: BoxFit.cover,
                                height: 22.h,
                                width: 22.w,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 32.h,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "name".tr,
                    style: fontSizeAuth,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  TextFormField(
                    onChanged: (value) {
                        profile.name = profile.nameController.text;
                        (context as Element).markNeedsBuild();
                    },
                    controller: profile.nameController
                      ..text = profile.name
                      ..selection = TextSelection.collapsed(
                          offset: profile.nameController.text.length),
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(
                          width: 1.w,
                          color: kMainColor,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(
                          width: 1.w,
                          color: kMainColor,
                        ),
                      ),
                      fillColor: Colors.red,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        borderSide: BorderSide(
                            color: kMainColor, width: 1.w),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.r),
                        ),
                        borderSide: BorderSide(
                            width: 1.w, color: dividerColor),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    "email".tr,
                    style: fontSizeAuth,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  TextFormField(
                    onChanged: (value) {
                        profile.email = profile.emailController.text;
                        (context as Element).markNeedsBuild();

                    },
                    controller: profile.emailController
                      ..text = profile.email
                      ..selection = TextSelection.collapsed(
                          offset: profile.emailController.text.length),
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(
                          width: 1.w,
                          color: kMainColor,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(
                          width: 1.w,
                          color: kMainColor,
                        ),
                      ),
                      fillColor: Colors.red,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        borderSide: BorderSide(
                            color: kMainColor, width: 1.w),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.r),
                        ),
                        borderSide: BorderSide(
                            width: 1.w, color: dividerColor),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    'phone'.tr,
                    style: fontSizeAuth,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  TextFormField(
                    onChanged: (value) {
                        profile.mobile = profile.phoneController.text;
                        (context as Element).markNeedsBuild();
                    },
                    controller: profile.phoneController
                      ..text = profile.mobile
                      ..selection = TextSelection.collapsed(
                          offset: profile.phoneController.text.length),
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(
                          width: 1.w,
                          color: kMainColor,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(
                          width: 1.w,
                          color: kMainColor,
                        ),
                      ),
                      fillColor: Colors.red,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        borderSide: BorderSide(
                            color: kMainColor, width: 1.w),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        borderSide: BorderSide(
                            width: 1.w, color: dividerColor),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    "business_name".tr,
                    style: fontSizeAuth,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  TextFormField(
                    onChanged: (value) {
                        profile.businessName = profile.businessNameController.text;
                        (context as Element).markNeedsBuild();
                    },
                    controller: profile.businessNameController
                      ..text = profile.businessName
                      ..selection = TextSelection.collapsed(
                          offset: profile.businessNameController.text.length),
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: const BorderSide(
                          width: 1,
                          color: kMainColor,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: const BorderSide(
                          width: 1,
                          color: kMainColor,
                        ),
                      ),
                      fillColor: Colors.red,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        borderSide: BorderSide(
                            color: kMainColor, width: 1.w),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        borderSide: BorderSide(
                            width: 1.w, color: dividerColor),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    "address".tr,
                    style: fontSizeAuth,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  TextFormField(
                    onChanged: (value) {
                        profile.address = profile.addressController.text;
                        (context as Element).markNeedsBuild();
                    },
                    controller: profile.addressController
                      ..text = profile.address
                      ..selection = TextSelection.collapsed(
                          offset: profile.addressController.text.length),
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: const BorderSide(
                          width: 1,
                          color: kMainColor,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: const BorderSide(
                          width: 1,
                          color: kMainColor,
                        ),
                      ),
                      fillColor: Colors.red,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        borderSide: BorderSide(
                            color: kMainColor, width: 1.w),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        borderSide: BorderSide(
                            width: 1.w, color: dividerColor),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () async {
                            if(imageFile == ''){
                              await profile.updateUserProfile(imageFile,'','',false);
                            }else {
                              await profile.updateUserProfile(imageFile,'','',true);
                            }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kMainColor,
                          minimumSize: Size(328.h, 48.w),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: Text(
                          "update".tr,
                          style: fontMedium,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              )),
            ],
          ),
        ),
      )
      ),
        profile.loader
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
