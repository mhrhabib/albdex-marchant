import '/Controllers/supports_controller.dart';
import '/Screen/Widgets/button_global.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import 'support.dart';
import '../Widgets/constant.dart';


class SupportAdd extends StatefulWidget {
  const SupportAdd({Key? key}) : super(key: key);

  @override
  State<SupportAdd> createState() => _SupportAddState();
}

class _SupportAddState extends State<SupportAdd> {
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
  SupportsController supportsController = SupportsController();
  List<String> selectStatus = [
    'pickup'.tr,
    'delivery'.tr,
    'payment'.tr,
    'billing_charges'.tr,
    'service'.tr,
    'others'.tr,
  ];
  String status = 'pickup'.tr;

  List<String> depatment = [
    'Finance',
    'General Management',
    'Human Resource',
    'Marketing',
    'Operations',
    'Purchase',
    'Sales',
  ];
  String selectDepartment = 'Finance';

  List<String> item = [
    'Low',
    'Medium',
    'High',
  ];
  String froms = 'Low';

  DropdownButton<String> departments() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String des in depatment) {
      var item = DropdownMenuItem(
        value: des,
        child: Text(des),
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: selectDepartment,
      onChanged: (value) {
        setState(() {
          selectDepartment = value!;
        });
      },
    );
  }

  DropdownButton<String> getstage() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String des in item) {
      var item = DropdownMenuItem(
        value: des,
        child: Text(des),
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: froms,
      onChanged: (value) {
        setState(() {
          froms = value!;
        });
      },
    );
  }

  DropdownButton<String> selectService() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String des in selectStatus) {
      var item = DropdownMenuItem(
        value: des,
        child: Text(des),
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: status,
      onChanged: (value) {
        setState(() {
          status = value!;
        });
      },
    );
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        title: Text('support_add'.tr,style: kTextStyle.copyWith(color: kDarkWhite),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: const Icon(FeatherIcons.x,color: kDarkWhite,).onTap(()=>Navigator.pop(context),),
          ),
        ],
        backgroundColor: kMainColor,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: kDarkWhite),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30.0),
            Container(
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(10.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(color: kGreyTextColor.withOpacity(0.2)),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20.0),
                  AppTextField(
                    cursorColor: kTitleColor,
                    controller: nameController,
                    textFieldType: TextFieldType.NAME,
                    decoration: kInputDecoration.copyWith(
                      enabledBorder:  OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(2.0)),
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
                  SizedBox(
                    height: 60.0,
                    child: FormField(
                      builder: (FormFieldState<dynamic> field) {
                        return InputDecorator(
                          decoration: kInputDecoration.copyWith(
                            floatingLabelBehavior:
                            FloatingLabelBehavior.always,
                            labelText: 'service'.tr,
                            hintText:  'select_service'.tr,
                            labelStyle:
                            kTextStyle.copyWith(color: kTitleColor),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: selectService(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  AppTextField(
                    cursorColor: kTitleColor,
                    controller: emailController,
                    textFieldType: TextFieldType.EMAIL,
                    decoration: kInputDecoration.copyWith(
                      enabledBorder: const OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(
                            color: kBorderColorTextField, width: 2),
                      ),
                      hintText: 'enter_email'.tr,
                      hintStyle: kTextStyle.copyWith(color: kGreyTextColor),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    height: 60.0,
                    child: FormField(
                      builder: (FormFieldState<dynamic> field) {
                        return InputDecorator(
                          decoration: kInputDecoration.copyWith(
                            floatingLabelBehavior:
                            FloatingLabelBehavior.always,
                            labelText: 'priority'.tr+'*',
                            hintText: 'select_priority'.tr,
                            labelStyle:
                            kTextStyle.copyWith(color: kTitleColor),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: getstage(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    height: 60.0,
                    child: FormField(
                      builder: (FormFieldState<dynamic> field) {
                        return InputDecorator(
                          decoration: kInputDecoration.copyWith(
                            floatingLabelBehavior:
                            FloatingLabelBehavior.always,
                            labelText: 'department'.tr+'*',
                            hintText: 'select_department'.tr,
                            labelStyle:
                            kTextStyle.copyWith(color: kTitleColor),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: departments(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  AppTextField(
                    cursorColor: kTitleColor,
                    controller: subjectController,
                    textFieldType: TextFieldType.NAME,
                    decoration: kInputDecoration.copyWith(
                      enabledBorder: const OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(
                            color: kBorderColorTextField, width: 2),
                      ),
                      labelText: 'subject'.tr,
                      labelStyle: kTextStyle.copyWith(color: kTitleColor),
                      hintText: 'enter_subject'.tr,
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
                        borderRadius:
                        BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(
                            color: kBorderColorTextField, width: 2),
                      ),
                      labelText: 'attached'.tr,
                      labelStyle: kTextStyle.copyWith(color: kTitleColor),
                      hintText: 'no_file_chosen'.tr,
                      hintStyle: kTextStyle.copyWith(color: kGreyTextColor),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  AppTextField(
                    cursorColor: kTitleColor,
                    controller: descriptionController,
                    textFieldType: TextFieldType.NAME,
                    decoration: kInputDecoration.copyWith(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      enabledBorder: const OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(
                            color: kBorderColorTextField, width: 2),
                      ),
                      labelText: 'description'.tr,
                      labelStyle: kTextStyle.copyWith(color: kTitleColor),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  ButtonGlobal(buttontext: 'submit'.tr, buttonDecoration: kButtonDecoration, onPressed: (){
                    int id = 1;
                    switch(selectDepartment){
                      case 'General Management':
                        id = 1;
                        break;
                      case 'Marketing':
                        id = 2;
                        break;
                      case 'Operations':
                        id = 3;
                        break;
                      case 'Finance':
                        id = 4;
                        break;
                      case 'Sales':
                        id = 5;
                        break;
                      case 'Human Resource':
                        id = 6;
                        break;
                      case 'Purchase':
                        id = 7;
                        break;
                    }
                    DateTime date = DateTime.now();
                    String dates = '${date.year}-${date.month}-${date.day}';
                    supportsController.supportPost(id.toString(), status.toLowerCase(), froms.toLowerCase(), subjectController.text, dates, descriptionController.text);
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
