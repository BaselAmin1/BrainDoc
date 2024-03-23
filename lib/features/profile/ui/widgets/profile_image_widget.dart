import 'package:BrainDoc/core/theming/assets.dart';
import 'package:BrainDoc/features/profile/business_logic/profile_cubit/profile_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImageWidget extends StatelessWidget {
  ProfileImageWidget({
    super.key,
    required this.user,
    required this.isEdit,
  });
  DocumentSnapshot? user;
  bool isEdit;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 5.h,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Stack(
            children: [
              CircleAvatar(
                radius: 95.r,
                backgroundColor: Colors.white,
                child: user!['image'] == null || user!['image'] == ''
                    ? Image.asset(
                        Assets.assetsImagesProfile,
                        width: 100.r,
                      )
                    : CachedNetworkImage(
                        imageUrl: user!['image'],
                        imageBuilder: (context, imageProvider) => CircleAvatar(
                          radius: 90.r,
                          backgroundImage: imageProvider,
                        ),
                        fit: BoxFit.cover,
                      ),
              ),
            isEdit?  Positioned(
                right: 10,
                left: 130,
                top: 120,
                bottom: 0,
                child: Container(
                  width: 35.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      context.read<ProfileCubit>().imageDialog(context);
                    },
                  ),
                ),
              ):SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
