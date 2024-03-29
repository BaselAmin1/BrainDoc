import 'package:BrainDoc/core/theming/colors.dart';
import 'package:BrainDoc/core/theming/text_styles.dart';
import 'package:BrainDoc/features/appointments/business_logic/appointments_cubit/appointments_cubit.dart';
import 'package:BrainDoc/features/appointments/ui/widgets/appointments_list_view_widget.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppointmentsCubit, AppointmentsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('appointments'.tr(), style: TextStyles.textStyle22),
          ),
          body: ContainedTabBarView(
            tabBarProperties: TabBarProperties(
              height: 50.h,
              indicator: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.primaryColor,
                    width: 2,
                  ),
                ),
              ),
            ),
            tabs: [
              Text('current'.tr(), style: TextStyles.textStyle18),
              Text('past'.tr(), style: TextStyles.textStyle18)
            ],
            views: [
              AppointmentsListViewWidget(isCurrent: true),
              AppointmentsListViewWidget(isCurrent: false),
            ],
          ),
        );
      },
    );
  }
}
