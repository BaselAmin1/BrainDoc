import 'package:BrainDoc/core/di.dart';
import 'package:BrainDoc/core/routing/routes.dart';
import 'package:BrainDoc/features/main_layout/business_logic/main_layout_cubit/main_layout_cubit.dart';
import 'package:BrainDoc/features/main_layout/presentation/ui/main_layout_screen.dart';
import 'package:BrainDoc/features/onboarding/ui/onboarding_screen.dart';
import 'package:BrainDoc/features/phone_auth/business_logic/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:BrainDoc/features/phone_auth/ui/login_screen.dart';
import 'package:BrainDoc/features/phone_auth/ui/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoarding:
        return PageTransition(
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.center,
          settings: settings,
          child: const OnboardingScreen(),
        );
      case Routes.loginScreen:
        return PageTransition(
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.center,
          settings: settings,
          child: BlocProvider(
            create: (context) => getIt<PhoneAuthCubit>(),
            child: LoginScreen(),
          ),
        );
      case Routes.otpScreen:
        var phoneNumber = arguments as String;
        return PageTransition(
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.center,
          settings: settings,
          child: BlocProvider(
            create: (context) => getIt<PhoneAuthCubit>(),
            child: OtpScreen(
              phoneNumber: phoneNumber,
            ),
          ),
        );
      case Routes.mainLayout:
        return PageTransition(
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.center,
          settings: settings,
          child: BlocProvider(
            create: (context) => getIt<MainLayoutCubit>(),
            child: MainLayoutScreen(),
          ),
        );
      default:
        return PageTransition(
          child: Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.center,
          settings: settings,
        );
    }
  }

  List screens = [
    const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    ),
    const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    ),
  ];
}
