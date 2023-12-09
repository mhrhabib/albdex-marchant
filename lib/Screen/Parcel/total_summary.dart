import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

import '../Widgets/constant.dart';

class TotalSummary extends StatefulWidget {
  const TotalSummary({Key? key}) : super(key: key);

  @override
  State<TotalSummary> createState() => _TotalSummaryState();
}

class _TotalSummaryState extends State<TotalSummary> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(context: context, initialDate: selectedDate, firstDate: DateTime(2015, 8), lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(
          'Total Summary',
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
        child: Column(
          children: [
            const SizedBox(height: 30.0),
            Container(
              padding: const EdgeInsets.all(10.0),
              width: context.width(),
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
                  Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: kBgColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Card(
                              elevation: 10,
                              color: kMainColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.0),
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(11),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2.0),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      FontAwesomeIcons.filter,
                                      color: kTitleColor,
                                      size: 16.0,
                                    ),
                                    const SizedBox(width: 4.0),
                                    Text(
                                      'Filter',
                                      style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 5.0),
                            Card(
                              elevation: 10,
                              color: kMainColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.0),
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(11),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2.0),
                                  color: kSecondaryColor,
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      FontAwesomeIcons.eraser,
                                      color: Colors.white,
                                      size: 16.0,
                                    ),
                                    const SizedBox(width: 4.0),
                                    Text(
                                      'Clear',
                                      style: kTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          'Select Date',
                          style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          color: kDarkWhite,
                          child: ListTile(
                            visualDensity: VisualDensity(vertical: 0),
                            onTap: (() => _selectDate(context)),
                            title: Text(
                              selectedDate.day.toString() + '/' + selectedDate.month.toString() + '/' + selectedDate.year.toString(),
                              style: kTextStyle.copyWith(color: kTitleColor),
                            ),
                            trailing: const Icon(
                              FeatherIcons.calendar,
                              color: kTitleColor,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: kBgColor),
                    child: Column(
                      children: [
                        Container(
                          width: context.width(),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(color: kMainColor.withOpacity(0.1)),
                          child: Text(
                            'Parcel Status',
                            style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(color: Colors.white),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Title',
                                          style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                        ),
                                        const Spacer(),
                                        Text(
                                          'Count',
                                          style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(color: kGreyTextColor.withOpacity(0.1)),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Pending',
                                          style: kTextStyle.copyWith(color: kTitleColor),
                                        ),
                                        const Spacer(),
                                        Text(
                                          '1',
                                          style: kTextStyle.copyWith(color: kTitleColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(color: Colors.white),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Delivered',
                                          style: kTextStyle.copyWith(color: kTitleColor),
                                        ),
                                        const Spacer(),
                                        Text(
                                          '1',
                                          style: kTextStyle.copyWith(color: kTitleColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(color: kGreyTextColor.withOpacity(0.1)),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Re-schedule',
                                          style: kTextStyle.copyWith(color: kTitleColor),
                                        ),
                                        const Spacer(),
                                        Text(
                                          '1',
                                          style: kTextStyle.copyWith(color: kTitleColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: kBgColor),
                    child: Column(
                      children: [
                        Container(
                          width: context.width(),
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(color: kMainColor.withOpacity(0.1)),
                          child: Text(
                            'Profit Info',
                            style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(color: Colors.white),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Title',
                                          style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                        ),
                                        const Spacer(),
                                        Text(
                                          'Amount (Tk)',
                                          style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(color: kGreyTextColor.withOpacity(0.1)),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Total Delivery Charge',
                                          style: kTextStyle.copyWith(color: kTitleColor),
                                        ),
                                        const Spacer(),
                                        Text(
                                          '0.00',
                                          style: kTextStyle.copyWith(color: kTitleColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(color: Colors.white),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'COD Charge',
                                          style: kTextStyle.copyWith(color: kTitleColor),
                                        ),
                                        const Spacer(),
                                        Text(
                                          '0.00',
                                          style: kTextStyle.copyWith(color: kTitleColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(color: kGreyTextColor.withOpacity(0.1)),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Total Vat',
                                          style: kTextStyle.copyWith(color: kTitleColor),
                                        ),
                                        const Spacer(),
                                        Text(
                                          '0.00',
                                          style: kTextStyle.copyWith(color: kTitleColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(color: Colors.white),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'F./L.Charge',
                                          style: kTextStyle.copyWith(color: kTitleColor),
                                        ),
                                        const Spacer(),
                                        Text(
                                          '0.00',
                                          style: kTextStyle.copyWith(color: kTitleColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(color: kGreyTextColor.withOpacity(0.1)),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'P.Charge',
                                          style: kTextStyle.copyWith(color: kTitleColor),
                                        ),
                                        const Spacer(),
                                        Text(
                                          '0.00',
                                          style: kTextStyle.copyWith(color: kTitleColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(color: Colors.white),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Total Profit',
                                          style: kTextStyle.copyWith(color: kTitleColor),
                                        ),
                                        const Spacer(),
                                        Text(
                                          '0.00',
                                          style: kTextStyle.copyWith(color: kTitleColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: kBgColor),
                    child: Column(
                      children: [
                        Container(
                          width: context.width(),
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(color: kMainColor.withOpacity(0.1)),
                          child: Text(
                            'Cash Collection Info',
                            style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(color: Colors.white),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Title',
                                          style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                        ),
                                        const Spacer(),
                                        Text(
                                          'Amount (Tk)',
                                          style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(color: kGreyTextColor.withOpacity(0.1)),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Total cash collection',
                                          style: kTextStyle.copyWith(color: kTitleColor),
                                        ),
                                        const Spacer(),
                                        Text(
                                          '0.00',
                                          style: kTextStyle.copyWith(color: kTitleColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(color: Colors.white),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Total selling price',
                                          style: kTextStyle.copyWith(color: kTitleColor),
                                        ),
                                        const Spacer(),
                                        Text(
                                          '0.00',
                                          style: kTextStyle.copyWith(color: kTitleColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: kBgColor),
                    child: Column(
                      children: [
                        Container(
                          width: context.width(),
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(color: kMainColor.withOpacity(0.1)),
                          child: Text(
                            'Payable to merchant',
                            style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(color: Colors.white),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Title',
                                          style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                        ),
                                        const Spacer(),
                                        Text(
                                          'Amount',
                                          style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(color: kGreyTextColor.withOpacity(0.1)),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Total payable merchant (COD)',
                                          style: kTextStyle.copyWith(color: kTitleColor),
                                        ),
                                        const Spacer(),
                                        Text(
                                          '0.00',
                                          style: kTextStyle.copyWith(color: kTitleColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(color: Colors.white),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Total paid to merchant (with Pending)',
                                          style: kTextStyle.copyWith(color: kTitleColor),
                                        ),
                                        const Spacer(),
                                        Text(
                                          '0.00',
                                          style: kTextStyle.copyWith(color: kTitleColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(color: kGreyTextColor.withOpacity(0.1)),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Total paid by merchant',
                                          style: kTextStyle.copyWith(color: kTitleColor),
                                        ),
                                        const Spacer(),
                                        Text(
                                          '0.00',
                                          style: kTextStyle.copyWith(color: kTitleColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(color: Colors.white),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Total deliveryman charge (Including VAT)',
                                          style: kTextStyle.copyWith(color: kTitleColor),
                                        ),
                                        const Spacer(),
                                        Text(
                                          '0.00',
                                          style: kTextStyle.copyWith(color: kTitleColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(color: kGreyTextColor.withOpacity(0.1)),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Pending payments',
                                          style: kTextStyle.copyWith(color: kTitleColor),
                                        ),
                                        const Spacer(),
                                        Text(
                                          '0.00',
                                          style: kTextStyle.copyWith(color: kTitleColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: kBgColor),
                    child: Column(
                      children: [
                        Container(
                          width: context.width(),
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(color: kMainColor.withOpacity(0.1)),
                          child: Text(
                            'Bank Cash Info',
                            style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(color: Colors.white),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Title',
                                          style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                        ),
                                        const Spacer(),
                                        Text(
                                          'Amount',
                                          style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(color: kGreyTextColor.withOpacity(0.1)),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Total paid to merchant',
                                          style: kTextStyle.copyWith(color: kTitleColor),
                                        ),
                                        const Spacer(),
                                        Text(
                                          '0.00',
                                          style: kTextStyle.copyWith(color: kTitleColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(color: Colors.white),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Pending payments',
                                          style: kTextStyle.copyWith(color: kTitleColor),
                                        ),
                                        const Spacer(),
                                        Text(
                                          '0.00',
                                          style: kTextStyle.copyWith(color: kTitleColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(color: kGreyTextColor.withOpacity(0.1)),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Total bank opening balance',
                                          style: kTextStyle.copyWith(color: kTitleColor),
                                        ),
                                        const Spacer(),
                                        Text(
                                          '0.00',
                                          style: kTextStyle.copyWith(color: kTitleColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(color: Colors.white),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Current Cash Balance',
                                          style: kTextStyle.copyWith(color: kTitleColor),
                                        ),
                                        const Spacer(),
                                        Text(
                                          '0.00',
                                          style: kTextStyle.copyWith(color: kTitleColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
