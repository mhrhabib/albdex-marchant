import 'package:flutter/material.dart';

import '../../Controllers/auth-controller.dart';
import 'constant.dart';
import 'package:get/get.dart';


class OtpForm extends StatefulWidget {
  const OtpForm({Key? key}) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  late FocusNode pin2FocusNode;
  late FocusNode pin3FocusNode;
  late FocusNode pin4FocusNode;
  late FocusNode pin5FocusNode;

  final _formKey = GlobalKey<FormState>();

  AuthController authController = AuthController();

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
    authController = Get.put(AuthController());
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    pin5FocusNode.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 50.0,
                  child: TextFormField(
                    controller: authController.otp1,
                    cursorColor: kTitleColor,
                    autofocus: true,
                    obscureText: true,
                    style: const TextStyle(color: kTitleColor,fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration.copyWith(fillColor: Colors.white),

                    onChanged: (value) {
                      nextField(value, pin2FocusNode);
                    },
                  ),
                ),
                SizedBox(
                  width: 50.0,
                  child: TextFormField(
                    cursorColor: kTitleColor,
                    controller: authController.otp2,
                    focusNode: pin2FocusNode,
                    obscureText: true,
                    style: const TextStyle(color: kTitleColor,fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    onChanged: (value) => nextField(value, pin3FocusNode),
                  ),
                ),
                SizedBox(
                  width: 50.0,
                  child: TextFormField(
                    cursorColor: kTitleColor,
                    controller: authController.otp3,
                    focusNode: pin3FocusNode,
                    obscureText: true,
                    style: const TextStyle(color: kTitleColor,fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    onChanged: (value) => nextField(value, pin4FocusNode),
                  ),
                ),
                SizedBox(
                  width: 50.0,
                  child: TextFormField(
                    cursorColor: kTitleColor,
                    focusNode: pin4FocusNode,
                    controller: authController.otp4,
                    obscureText: true,
                    style: const TextStyle(color: kTitleColor,fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    onChanged: (value) => nextField(value, pin5FocusNode),
                  ),
                ),
                SizedBox(
                  width: 50.0,
                  child: TextFormField(
                    cursorColor: kTitleColor,
                    focusNode: pin5FocusNode,
                    controller: authController.otp5,
                    obscureText: true,
                    style: const TextStyle(color: kTitleColor,fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                      onChanged: (value) {
                        if (value.length == 1) {
                          pin5FocusNode.unfocus();
                          // Then you need to check is the code is correct or not
                        }
                      }
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
