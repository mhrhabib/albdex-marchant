import '/Screen/Home/home.dart';
import '/Screen/Widgets/button_global.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../Models/support_list.dart';
import '../Widgets/constant.dart';

class Reply extends StatefulWidget {
  const Reply({Key? key,required this.supports}) : super(key: key);
  final Supports supports;
  @override
  State<Reply> createState() => _ReplyState();
}

class _ReplyState extends State<Reply> {
  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.single.path != null) {
      PlatformFile file = result.files.first;
      print(file.name);
      print(file.bytes);
      print(file.size);
      print(file.extension);
      print(file.path);
    }
    ;
  }

  void showPopUp() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: SizedBox(
              height: 510,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(
                          FeatherIcons.x,
                          color: kTitleColor,
                        ).onTap(
                          () => Navigator.pop(context),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    AppTextField(
                      cursorColor: kTitleColor,
                      textFieldType: TextFieldType.NAME,
                      decoration: kInputDecoration.copyWith(
                        enabledBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(2.0)),
                          borderSide: BorderSide(
                              color: kBorderColorTextField, width: 2),
                        ),
                        labelText: 'name'.tr,
                        labelStyle: kTextStyle.copyWith(color: kTitleColor),
                        hintText: 'B H',
                        hintStyle: kTextStyle.copyWith(color: kGreyTextColor),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    AppTextField(
                      cursorColor: kTitleColor,
                      textFieldType: TextFieldType.EMAIL,
                      decoration: kInputDecoration.copyWith(
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(
                              color: kBorderColorTextField, width: 2),
                        ),
                        hintText: 'enter_email'.tr,
                        hintStyle: kTextStyle.copyWith(color: kGreyTextColor),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    AppTextField(
                      readOnly: true,
                      onTap: (() => _pickFile()),
                      cursorColor: kTitleColor,
                      textFieldType: TextFieldType.NAME,
                      decoration: kInputDecoration.copyWith(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(
                              color: kBorderColorTextField, width: 2),
                        ),
                        labelText: 'attached'.tr,
                        labelStyle: kTextStyle.copyWith(color: kTitleColor),
                        hintText: 'no_file_chosen',
                        hintStyle: kTextStyle.copyWith(color: kGreyTextColor),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      cursorColor: kTitleColor,
                      textAlign: TextAlign.start,
                      decoration: kInputDecoration.copyWith(
                        labelText: 'details'.tr,
                        labelStyle: kTextStyle.copyWith(color: kTitleColor),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 40, horizontal: 10.0),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ButtonGlobal(
                        buttontext: 'send'.tr,
                        buttonDecoration: kButtonDecoration,
                        onPressed: () {
                          setState(() {
                            const Home().launch(context);
                          });
                        })
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        title: Text(
          'support_chat'.tr,
          style: kTextStyle.copyWith(color: kDarkWhite),
        ),
        backgroundColor: kBgColor,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: kDarkWhite),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(height: 30.0),
            Container(
              padding: const EdgeInsets.all(10.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(color: kGreyTextColor.withOpacity(0.2)),
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 20.0,
                          backgroundImage: AssetImage('images/profile.png'),
                        ),
                        const SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.supports.userName.toString(),
                              style: kTextStyle.copyWith(
                                  color: kTitleColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2.0),
                                      color: kMainColor),
                                  child: Text(
                                    'User type .2',
                                    style: kTextStyle.copyWith(
                                        color: Colors.white),
                                  ),
                                ),
                                const SizedBox(width: 40.0),
                                Text(
                                  widget.supports.date.toString(),
                                  style:
                                      kTextStyle.copyWith(color: kTitleColor),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              padding: const EdgeInsets.all(10.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(color: kGreyTextColor.withOpacity(0.2)),
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.supports.subject.toString().tr,
                      style: kTextStyle.copyWith(
                          color: kTitleColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      widget.supports.description.toString().tr,
                      style: kTextStyle.copyWith(
                          color: kTitleColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              padding: const EdgeInsets.all(10.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(color: kGreyTextColor.withOpacity(0.2)),
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'name'.tr,
                              style: kTextStyle.copyWith(color: kTitleColor),
                            ),
                            const SizedBox(width: 70.0),
                            Text(
                              ': ${widget.supports.userName}',
                              style: kTextStyle.copyWith(color: kTitleColor),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'email'.tr,
                              style: kTextStyle.copyWith(color: kTitleColor),
                            ),
                            const SizedBox(width: 70.0),
                            Text(
                              ': ${widget.supports.userEmail}',
                              style: kTextStyle.copyWith(color: kTitleColor),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'department'.tr,
                              style: kTextStyle.copyWith(color: kTitleColor),
                            ),
                            const SizedBox(width: 25.0),
                            Text(
                              ': '+'${widget.supports.department}'.tr,
                              style: kTextStyle.copyWith(color: kTitleColor),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'service'.tr,
                              style: kTextStyle.copyWith(color: kTitleColor),
                            ),
                            const SizedBox(width: 60.0),
                            Text(
                              ': '+'${widget.supports.service}'.tr,
                              style: kTextStyle.copyWith(color: kTitleColor),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'priority'.tr,
                              style: kTextStyle.copyWith(color: kTitleColor),
                            ),
                            const SizedBox(width: 60.0),
                            Text(
                              ': '+'${widget.supports.priority}'.tr,
                              style: kTextStyle.copyWith(color: kTitleColor),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'date'.tr+':',
                              style: kTextStyle.copyWith(color: kTitleColor),
                            ),
                            const SizedBox(width: 75.0),
                            Text(
                              ': ${widget.supports.date}',
                              style: kTextStyle.copyWith(color: kTitleColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            // Container(
            //   padding: const EdgeInsets.all(10.0),
            //   width: MediaQuery.of(context).size.width,
            //   decoration: BoxDecoration(
            //       border: Border.all(color: kGreyTextColor.withOpacity(0.2)),
            //       borderRadius: BorderRadius.circular(5.0),
            //       color: const Color(0xFFfef9ed)),
            //   child: Padding(
            //     padding: const EdgeInsets.all(10.0),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Row(
            //           children: [
            //             const Icon(
            //               MdiIcons.reply,
            //               color: Colors.blue,
            //             ),
            //             const SizedBox(width: 10.0),
            //             Text(
            //               'reply'.tr,
            //               style: kTextStyle.copyWith(
            //                   color: Colors.blue, fontSize: 18.0),
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ).onTap(
            //   () => showPopUp(),
            // ),
          ],
        ),
      ),
    );
  }
}
