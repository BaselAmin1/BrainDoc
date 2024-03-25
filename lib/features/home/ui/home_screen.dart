import 'package:BrainDoc/core/theming/text_styles.dart';
import 'package:BrainDoc/features/home/business_logic/home_cubit/home_cubit.dart';
import 'package:BrainDoc/features/home/ui/widgets/doctors_list_wiew_widget.dart';
import 'package:BrainDoc/features/home/ui/widgets/home_banners_widget.dart';
import 'package:BrainDoc/features/home/ui/widgets/home_scan_and_freq_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title: Text(
                        'hello'.tr(),
                        style: TextStyles.textStyle22,
                      ),
                      subtitle: Text(
                        'mayYouAlwaysInAGoodCondition'.tr(),
                        style: TextStyles.textStyle16,
                      ),
                    ),
                    const HomeScanAndFreqWidget(),
                    DoctorsListViewWidget(),
                    const BannerWidget(),
                    SizedBox(height: 8.h),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
