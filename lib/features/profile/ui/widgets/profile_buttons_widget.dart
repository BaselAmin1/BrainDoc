import 'package:BrainDoc/core/cache_helper/cache_helper.dart';
import 'package:BrainDoc/core/routing/routes.dart';
import 'package:BrainDoc/core/theming/text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileButtonsWidget extends StatelessWidget {
  const ProfileButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ListTile(
          title: Text(
            'appointments'.tr(),
            style: TextStyles.textStyle18,
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: const Divider(
            color: Colors.grey,
          ),
        ),
        ListTile(
          title: Text(
            'editProfile'.tr(),
            style: TextStyles.textStyle18,
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: const Divider(
            color: Colors.grey,
          ),
        ),
        ListTile(
          title: Text(
            'changeLanguage'.tr(),
            style: TextStyles.textStyle18,
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: const Divider(
            color: Colors.grey,
          ),
        ),
        ListTile(
          title: Text(
            'logout'.tr(),
            style: TextStyles.textStyle18,
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            FirebaseAuth.instance.signOut();
            CacheHelper.clearAllData();
            Navigator.pushReplacementNamed(
              context,
              Routes.loginScreen,
            );
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: const Divider(
            color: Colors.grey,
          ),
        ),
        ListTile(
          title: Text(
            'privacyAndPolicy'.tr(),
            style: TextStyles.textStyle18,
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),
      ],
    );
  }
}
