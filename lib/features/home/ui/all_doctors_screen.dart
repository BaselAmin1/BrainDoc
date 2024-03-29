import 'package:BrainDoc/core/shared/widgets/custom_text_form_field.dart';
import 'package:BrainDoc/core/theming/text_styles.dart';
import 'package:BrainDoc/features/home/ui/widgets/all_doctor_list_view_item_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllDoctorsScreen extends StatefulWidget {
  const AllDoctorsScreen({super.key, required this.doctors});
  final List<DocumentSnapshot> doctors;

  @override
  _AllDoctorsScreenState createState() => _AllDoctorsScreenState();
}

class _AllDoctorsScreenState extends State<AllDoctorsScreen> {
  late List<DocumentSnapshot> filteredDoctors;

  @override
  void initState() {
    filteredDoctors = widget.doctors;
    super.initState();
  }

  void filterDoctors(String query) {
    Future.delayed(const Duration(milliseconds: 300)).then((value) {
      setState(() {
        filteredDoctors = widget.doctors
            .where((doctor) => doctor['name']
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('allDoctors'.tr(), style: TextStyles.textStyle22),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextFormField(
                hintText: 'search'.tr(),
                prefixIcon: const Icon(Icons.search),
                onChanged: filterDoctors,
              ),
              SizedBox(height: 8.h),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredDoctors.length,
                itemBuilder: (context, index) {
                  return AllDoctorListViewItemWidget(
                    doctor: filteredDoctors[index],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
