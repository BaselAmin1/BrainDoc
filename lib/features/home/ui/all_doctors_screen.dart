import 'package:BrainDoc/core/shared/widgets/custom_text_form_field.dart';
import 'package:BrainDoc/core/theming/text_styles.dart';
import 'package:BrainDoc/features/home/ui/widgets/all_doctor_list_view_item_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllDoctorsScreen extends StatelessWidget {
  AllDoctorsScreen({super.key, required this.doctors});
  List<DocumentSnapshot> doctors;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('allDoctors'.tr(), style: TextStyles.textStyle22),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextFormField(
                  hintText: 'search'.tr(),
                  prefixIcon: const Icon(Icons.search),
                  onChanged: (value) {},
                ),
                SizedBox(height: 8.h),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: doctors.length,
                  itemBuilder: (context, index) {
                    return AllDoctorListViewItemWidget(
                      doctor: doctors[index],
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
