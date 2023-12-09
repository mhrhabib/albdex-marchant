
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import '/Screen/Authentication/sign_in.dart';
import '/Screen/Authentication/sign_up.dart';
import '/Screen/Authentication/verify_otp.dart';

import '../Widgets/button_global.dart';
import '../Widgets/constant.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kMainColor,
        appBar: AppBar(
          title: Text(
            'reset_password'.tr,
            style: kTextStyle.copyWith(color: kTitleColor),
          ),
          iconTheme: const IconThemeData(
            color: kTitleColor,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: (Column(
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 40.0,
                  backgroundImage: AssetImage('images/profile.png'),
                  backgroundColor: Colors.transparent,
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                'reset_password'.tr,
                style: kTextStyle.copyWith(color: kTitleColor, fontSize: 18.0),
                textAlign: TextAlign.center,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       SizedBox(height: 20.0),
                      Text(
                        'dont_worry_we_ll_send_you_an_email_to_reset_your_password.'.tr,
                        style: kTextStyle.copyWith(
                          color: kTitleColor,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      AppTextField(
                        showCursor: true,
                        cursorColor: kTitleColor,
                        textFieldType: TextFieldType.EMAIL,
                        decoration: kInputDecoration.copyWith(
                          labelText: 'email_mobile'.tr,
                          labelStyle: kTextStyle.copyWith(color: kTitleColor),
                          hintText: 'courier@gmail.com',
                          hintStyle: kTextStyle.copyWith(color: kGreyTextColor),
                          suffixIcon:
                              const Icon(Icons.mail, color: kGreyTextColor),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      ButtonGlobal(
                        buttontext: 'send_password_reset_link'.tr,
                        buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: kMainColor),
                        onPressed: () {
                          setState(() {
                             OtpVerify(mobile: '',).launch(context);
                          });
                        },
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'dont_have_an_account'.tr,
                            style: kTextStyle.copyWith(color: kGreyTextColor),
                          ),
                          Text(
                            'sign_up'.tr,
                            style: kTextStyle.copyWith(color: kSecondaryColor),
                          ).onTap(
                            () => const SignUp().launch(context),
                          ),
                          const SizedBox(width: 5.0),
                          Container(
                            width: 1.0,
                            height: 15.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.0),
                              color: kGreyTextColor,
                            ),
                          ),
                          const SizedBox(width: 5.0),
                          Text(
                            'sign_in'.tr,
                            style: kTextStyle.copyWith(color: kSecondaryColor),
                          ).onTap(
                            () => const SignIn().launch(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
