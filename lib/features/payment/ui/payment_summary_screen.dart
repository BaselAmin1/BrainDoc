import 'package:BrainDoc/core/helpers/extensions.dart';
import 'package:BrainDoc/core/routing/app_router.dart';
import 'package:BrainDoc/core/routing/routes.dart';
import 'package:BrainDoc/core/shared/widgets/custom_button.dart';
import 'package:BrainDoc/core/theming/assets.dart';
import 'package:BrainDoc/core/theming/colors.dart';
import 'package:BrainDoc/core/theming/text_styles.dart';
import 'package:BrainDoc/features/payment/ui/widgets/doctor_details_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentSummaryScreen extends StatefulWidget {
  PaymentSummaryScreen({
    super.key,
    required this.paymentSummaryModel,
  });
  PaymentSummaryModel paymentSummaryModel;
  bool isCredit = true;
  @override
  State<PaymentSummaryScreen> createState() => _PaymentSummaryScreenState();
}

class _PaymentSummaryScreenState extends State<PaymentSummaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('paymentSummary'.tr(), style: TextStyles.textStyle22),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DoctorDetailsWidget(
                doctor: widget.paymentSummaryModel.doctor,
              ),
              SizedBox(height: 16.h),
              Text(
                'scheduleDate'.tr(),
                style: TextStyles.textStyle22,
              ),
              SizedBox(height: 8.h),
              Card(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        Assets.assetsImagesScheduleIcon,
                        width: 45.w,
                      ),
                      SizedBox(width: 16.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'appointmentDate'.tr(),
                            style: TextStyles.textStyle18.copyWith(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            '${widget.paymentSummaryModel.date} ${widget.paymentSummaryModel.time}',
                            style: TextStyles.textStyle18,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'selectPaymentMethod'.tr(),
                style: TextStyles.textStyle22,
              ),
              SizedBox(height: 8.h),
              GestureDetector(
                onTap: () => setState(() {
                  widget.isCredit = true;
                }),
                child: Card(
                  child: Container(
                    height: 50.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    decoration: const BoxDecoration(),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          FontAwesomeIcons.solidCreditCard,
                          size: 24,
                        ),
                        SizedBox(width: 16.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'creditCard'.tr(),
                              style: TextStyles.textStyle22,
                            ),
                          ],
                        ),
                        const Spacer(),
                        widget.isCredit
                            ? const Icon(
                                FontAwesomeIcons.solidCircleCheck,
                                color: AppColors.primaryColor,
                                size: 24,
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => setState(() {
                  widget.isCredit = false;
                }),
                child: Card(
                  child: Container(
                    height: 50.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    decoration: const BoxDecoration(),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          FontAwesomeIcons.houseChimneyMedical,
                          size: 24,
                        ),
                        SizedBox(width: 16.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'cache'.tr(),
                              style: TextStyles.textStyle22,
                            ),
                          ],
                        ),
                        const Spacer(),
                        !widget.isCredit
                            ? const Icon(
                                FontAwesomeIcons.solidCircleCheck,
                                color: AppColors.primaryColor,
                                size: 24,
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 50.h,
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'total'.tr(),
                    style: TextStyles.textStyle18.copyWith(
                        color: Colors.grey, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '${widget.paymentSummaryModel.doctor['price']} ${'egp'.tr()}',
                    style: TextStyles.textStyle18,
                  ),
                ],
              ),
              const Spacer(),
              CustomButton(
                width: 150.w,
                onPressed: () {
                  if (widget.isCredit) {
                    context.pushNamed(
                      Routes.paymentScreen,
                      arguments: widget.paymentSummaryModel,
                    );
                  } else {
                    context.pushNamed(
                      Routes.bookingSuccessScreen,
                      arguments: PaymentSummaryModel(
                        doctor: widget.paymentSummaryModel.doctor,
                        date: widget.paymentSummaryModel.date,
                        time: widget.paymentSummaryModel.time,
                        isVisa: false,
                        notes: widget.paymentSummaryModel.notes,
                      ),
                    );
                  }
                },
                text: widget.isCredit ? 'pay'.tr() : 'confirm'.tr(),
              ),
            ],
          ),
        ));
  }
}
