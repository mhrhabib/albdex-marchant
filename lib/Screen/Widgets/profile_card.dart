import 'package:flutter/material.dart';
import '../../utils/style.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
    required this.page,
    required this.topic,
    required this.amount,
    required this.imgUrl,
    required this.cardColor,
  }) : super(key: key);
  final bool page;
  final String topic;
  final String amount;
  final String imgUrl;
  final Color cardColor;

  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: ScreenSize(context).mainHeight / 7.7,
        width: ScreenSize(context).mainWidth / 3.4,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20,left: 5,right: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 5,),
              Flexible(
                child: Text(
                  topic,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Text(
                amount,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );

  }
}
