import 'package:flutter/material.dart';
import '../../Controllers/auth-controller.dart';
import '../Widgets/button_global.dart';
import '../Widgets/constant.dart';
import '../Widgets/otp_form.dart';
import 'package:get/get.dart';

class OtpVerify extends StatefulWidget {
  final String mobile;
  const OtpVerify({Key? key, required this.mobile}) : super(key: key);

  @override
  State<OtpVerify> createState() => _OtpVerifyState();
}

class _OtpVerifyState extends State<OtpVerify> {
  AuthController authController = AuthController();

  @override
  void initState() {
    authController = Get.put(AuthController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: (Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.only(right: 30),
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Text(
              'confirm_otp'.tr,
              style: kTextStyle.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20.0),
                    Text(
                      'check_your_phone_we_have_send_you_a_5_digit_otp_please_confirm_that_otp_to_verify_your_phone_number_for_registrations'
                          .tr,
                      style: kTextStyle.copyWith(color: kTitleColor),
                      textAlign: TextAlign.center,
                    ),
                    Center(
                      child: Text(
                        '********',
                        style: kTextStyle.copyWith(
                            color: kTitleColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Center(
                      child: Text(
                        'your_otp'.tr,
                        style: kTextStyle.copyWith(
                            color: kTitleColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const OtpForm(),
                    const SizedBox(height: 30.0),
                    ButtonGlobal(
                        buttontext: 'submit'.tr,
                        buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: kMainColor),
                        onPressed: () async {
                          if (authController.otp1.text.toString() != 'null') {
                            await authController
                                .otpVerification(widget.mobile.toString());
                          } else {
                            Get.rawSnackbar(
                                message: "enter_your_otp_code".tr,
                                backgroundColor: Colors.red,
                                snackPosition: SnackPosition.TOP);
                          }
                        }),
                    const SizedBox(height: 10.0),
                    RichText(
                      text: TextSpan(
                        text: 'didn_t_get'.tr,
                        style: kTextStyle.copyWith(color: kGreyTextColor),
                        children: [
                          TextSpan(
                            text: 'resend_code'.tr,
                            style: kTextStyle.copyWith(color: Colors.pink),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
