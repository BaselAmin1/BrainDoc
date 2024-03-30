import 'package:BrainDoc/core/routing/app_router.dart';
import 'package:BrainDoc/core/shared/localization_cubit/localization_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../business_logic/main_layout_cubit/main_layout_cubit.dart';

class MainLayoutScreen extends StatelessWidget {
  MainLayoutScreen({
    super.key,
  });
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var cubit = MainLayoutCubit.get(context);

    return BlocConsumer<MainLayoutCubit, MainLayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        List<BottomNavigationBarItem> bottomItems = [
          BottomNavigationBarItem(
            label: 'home'.tr(),
            icon: const Icon(
              FontAwesomeIcons.houseMedical,
            ),
          ),
          BottomNavigationBarItem(
            label: 'profile'.tr(),
            icon: const Icon(
              FontAwesomeIcons.solidUser,
            ),
          ),
        ];
    
        return state is LocalizationLoading
            ? const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Scaffold(
                key: _key,
                body: PopScope(
                  canPop: false,
                  child: AppRouter()
                      .screens[cubit.mainLayoutInitialScreenIndex],
                ),
                bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  currentIndex: cubit.mainLayoutInitialScreenIndex,
                  onTap: (index) {
                    cubit.changeBottomNavBar(
                      index,
                    );
                  },
                  showSelectedLabels: true,
                  showUnselectedLabels: true,
                  items: bottomItems,
                ),
              );
      },
    );
  }
}
