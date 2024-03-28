import 'package:BrainDoc/core/theming/text_styles.dart';
import 'package:BrainDoc/features/appointments/business_logic/appointments_cubit/appointments_cubit.dart';
import 'package:BrainDoc/features/appointments/ui/widgets/current_appointments_list_view_item_widget.dart';
import 'package:BrainDoc/features/appointments/ui/widgets/past_appointments_list_view_item_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentsListViewWidget extends StatelessWidget {
  AppointmentsListViewWidget({super.key, required this.isCurrent});
  bool isCurrent;
  List appointments = [];
  @override
  Widget build(BuildContext context) {
    isCurrent
        ? appointments = context.read<AppointmentsCubit>().currentAppointments
        : appointments = context.read<AppointmentsCubit>().pastAppointments;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          appointments.isEmpty
              ? Center(
                  child: Text(
                    'noAppointments'.tr(),
                    style: TextStyles.textStyle18,
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: appointments.length,
                    itemBuilder: (context, index) {
                      return isCurrent
                          ? CurrentAppointmentsListViewItemWidget(
                              appointments: appointments,
                              index: index,
                            )
                          : PastAppointmentsListViewItemWidget(
                              appointments: appointments,
                              index: index,
                            );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
