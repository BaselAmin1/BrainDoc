import 'package:BrainDoc/core/cache_helper/cache_helper.dart';
import 'package:BrainDoc/core/di.dart';
import 'package:BrainDoc/core/helpers/extensions.dart';
import 'package:BrainDoc/core/routing/routes.dart';
import 'package:BrainDoc/core/theming/text_styles.dart';
import 'package:BrainDoc/features/profile/business_logic/profile_cubit/profile_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileButtonsWidget extends StatelessWidget {
  ProfileButtonsWidget({super.key, required this.user});

  DocumentSnapshot user;
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
          onTap: () {
            context.pushNamed(Routes.editProfileScreen, arguments: user).then(
                (value) => context.read<ProfileCubit>().getUserProfileData());
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
            'changeLanguage'.tr(),
            style: TextStyles.textStyle18,
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('changeLanguage'.tr()),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: const Text('العربيه'),
                        onTap: () {
                          context.setLocale(const Locale('ar', 'EG'));
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: const Text('English'),
                        onTap: () {
                          context.setLocale(const Locale('en', 'UK'));
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              },
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
            'logout'.tr(),
            style: TextStyles.textStyle18,
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('logout'.tr()),
                    content: Text('areYouSureYouWantToLogout'.tr()),
                    actions: [
                      TextButton(
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                          getIt<CacheHelper>().clearAllData();
                          Navigator.pushReplacementNamed(
                            context,
                            Routes.loginScreen,
                          );
                        },
                        child: Text('yes'.tr()),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('no'.tr()),
                      ),
                    ],
                  );
                });
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
