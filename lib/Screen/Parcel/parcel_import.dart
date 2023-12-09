import '/Screen/Parcel/parcel_index.dart';
import '/Screen/Widgets/button_global.dart';
import '/Screen/Widgets/constant.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

class ParcelImport extends StatefulWidget {
  const ParcelImport({Key? key}) : super(key: key);

  @override
  State<ParcelImport> createState() => _ParcelImportState();
}

class _ParcelImportState extends State<ParcelImport> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        title: Text(
          'parcel_import'.tr,
          style: kTextStyle.copyWith(color: kTitleColor),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: const Icon(
              FeatherIcons.x,
              color: kTitleColor,
            ).onTap(
              () => Navigator.pop(context),
            ),
          ),
        ],
        backgroundColor: kMainColor,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: kBgColor),
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 30.0),
            Container(
              padding: const EdgeInsets.all(10.0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                border: Border.all(color: kGreyTextColor.withOpacity(0.2)),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20.0),
                  Text(
                    'parcels_import'.tr,
                    style: kTextStyle.copyWith(
                        color: kTitleColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    'please_check_this_before_importing_your_file'.tr+'.',
                    style: kTextStyle.copyWith(color: kGreyTextColor),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: [
                       Icon(MdiIcons.circleMedium),
                      Text(
                        'uploaded_file_type_must_be_xlsx'.tr,
                        style: kTextStyle.copyWith(color: kGreyTextColor),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                       Padding(
                        padding: EdgeInsets.only(bottom: 15.0),
                        child: Icon(MdiIcons.circleMedium),
                      ),
                      Text(
                        'Enter the Id (shop_id = ID) next to the \nname of the shop.',
                        style: kTextStyle.copyWith(color: kGreyTextColor),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                       Padding(
                        padding: EdgeInsets.only(bottom: 50.0),
                        child: Icon(MdiIcons.circleMedium),
                      ),
                      Expanded(
                        child: Text(
                          'The file must contain pickup_address, pickup_phone, cash_collection, selling_price, customer_name,invoice_no, customer_phone, customer_address.',
                          style: kTextStyle.copyWith(color: kGreyTextColor),
                          maxLines: 4,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                       Padding(
                        padding: EdgeInsets.only(bottom: 15.0),
                        child: Icon(MdiIcons.circleMedium),
                      ),
                      Expanded(
                        child: Text(
                          'category'.tr+': 1=KG, 2=Mobile, 3=Laptop, 4=Tabs, 5=Gaming Kybord, 6=Cosmetices',
                          style: kTextStyle.copyWith(color: kGreyTextColor),
                          maxLines: 4,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                       Padding(
                        padding: EdgeInsets.only(bottom: 50.0),
                        child: Icon(MdiIcons.circleMedium),
                      ),
                      Expanded(
                        child: Text(
                          'delivery_type'.tr+': 1=Same Day, 2=Next Day, 3=Sub City, 4=Outside City, same_day=Same Day, next_day=Next Day, sub_city=Sub City, outside_City=Outside City',
                          style: kTextStyle.copyWith(color: kGreyTextColor),
                          maxLines: 4,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                       Padding(
                        padding: EdgeInsets.only(bottom: 15.0),
                        child: Icon(MdiIcons.circleMedium),
                      ),
                      Expanded(
                        child: Text(
                          'cash_collection=0.00 and selling_price=0.00 must be numeric.',
                          style: kTextStyle.copyWith(color: kGreyTextColor),
                          maxLines: 4,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  AppTextField(
                    readOnly: true,
                    onTap: (() => _pickFile()),
                    cursorColor: kTitleColor,
                    textFieldType: TextFieldType.NAME,
                    decoration: kInputDecoration.copyWith(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      enabledBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide:
                            BorderSide(color: kBorderColorTextField, width: 2),
                      ),
                      hintText: 'browse_file'.tr,
                      hintStyle: kTextStyle.copyWith(color: kGreyTextColor),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  ButtonGlobal(
                      buttontext: 'import'.tr,
                      buttonDecoration: kButtonDecoration,
                      onPressed: () {
                        setState(() {
                           ParcelPage(height: 0.77,).launch(context);
                        });
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
