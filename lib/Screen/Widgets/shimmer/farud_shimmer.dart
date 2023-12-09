import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import '../constant.dart';
import 'package:shimmer/shimmer.dart';

class FarudShimmer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FarudShimmerState();
  }
}

class _FarudShimmerState extends State<FarudShimmer> {
  var mainHeight, mainWidth;

  @override
  Widget build(BuildContext context) {
    mainHeight = MediaQuery.of(context).size.height;
    mainWidth = MediaQuery.of(context).size.width;

    return  SizedBox(
        height: MediaQuery.of(context).size.height * 0.62,
        child:
      SingleChildScrollView(
      child:
      ListView.builder(
      itemCount: 10,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
      itemBuilder: (_, i) {
        return (  Shimmer.fromColors(
            highlightColor: Colors.grey[400]!,
            baseColor: Colors.grey[300]!,
            child:
            Container(
              padding: const EdgeInsets.all(10),
              margin: EdgeInsets.only(bottom: 10),
              width:MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border:
                Border.all(color: kGreyTextColor.withOpacity(0.2)),
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white,
              ),
              child:
              Padding(
                padding: const EdgeInsets.all(10.0),
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'name'.tr+': ' ,
                          style: kTextStyle.copyWith(color: kTitleColor),
                        ),
                        const Spacer(),
                        const Icon(FontAwesomeIcons.penToSquare,
                            color: kTitleColor, size: 16.0).onTap(()=>print('ok'),),
                        const SizedBox(width: 20.0),
                        const Icon(FontAwesomeIcons.trash,
                            color: kTitleColor, size: 16.0)
                            .onTap(
                              () => print(''),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'phone'.tr+': ',
                            style:
                            kTextStyle.copyWith(color: kTitleColor),
                            children: [
                              TextSpan(
                                  text: '',
                                  style: kTextStyle.copyWith(
                                      color: kTitleColor,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'date'.tr+': ',
                          style: kTextStyle.copyWith(color: kTitleColor),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1.0,
                      color: kGreyTextColor.withOpacity(0.2),
                    ),
                    Text(
                      '',
                      style: kTextStyle.copyWith(color: kTitleColor),
                    ),
                    const SizedBox(height: 10.0),
                  ],
                ),
              ),
            ))
        );
      },
    )
      ));
  }
}