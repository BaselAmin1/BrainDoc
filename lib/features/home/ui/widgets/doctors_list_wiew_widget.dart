import 'package:BrainDoc/core/helpers/extensions.dart';
import 'package:BrainDoc/core/routing/routes.dart';
import 'package:BrainDoc/core/theming/colors.dart';
import 'package:BrainDoc/core/theming/text_styles.dart';
import 'package:BrainDoc/features/home/business_logic/home_cubit/home_cubit.dart';
import 'package:BrainDoc/features/home/ui/widgets/doctor_list_view_item_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class DoctorsListViewWidget extends StatelessWidget {
  const DoctorsListViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('browseDoctors'.tr(), style: TextStyles.textStyle22),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    if (state.doctors != null) {
                      context.pushNamed(
                        Routes.allDoctorsScreen,
                        arguments: state.doctors,
                      );
                    }
                  },
                  child: Text(
                    'seeAll'.tr(),
                    style: TextStyles.textStyle14.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            state.doctors != null
                ? SizedBox(
                    height: 250.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.doctors!.length,
                      itemBuilder: (context, index) {
                        return DoctorListViewItemWidget(
                          doctor: state.doctors![index],
                        );
                      },
                    ),
                  )
                : SizedBox(
                    height: 250.h,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5, // Placeholder for shimmer effect
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            margin: EdgeInsets.only(right: 16.w),
                            width: 160.w,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
            SizedBox(height: 4.h),
          ],
        );
      },
    );
  }
}
