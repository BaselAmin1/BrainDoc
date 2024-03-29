import 'package:BrainDoc/core/di.dart';
import 'package:BrainDoc/core/routing/routes.dart';
import 'package:BrainDoc/features/appointments/business_logic/appointments_cubit/appointments_cubit.dart';
import 'package:BrainDoc/features/appointments/ui/appointments_screen.dart';
import 'package:BrainDoc/features/booking/business_logic/booking_cubit/booking_cubit.dart';
import 'package:BrainDoc/features/booking/ui/booking_screen.dart';
import 'package:BrainDoc/features/doctor_details/ui/doctor_details_screen.dart';
import 'package:BrainDoc/features/home/business_logic/home_cubit/home_cubit.dart';
import 'package:BrainDoc/features/home/ui/all_doctors_screen.dart';
import 'package:BrainDoc/features/home/ui/home_screen.dart';
import 'package:BrainDoc/features/main_layout/business_logic/main_layout_cubit/main_layout_cubit.dart';
import 'package:BrainDoc/features/main_layout/presentation/ui/main_layout_screen.dart';
import 'package:BrainDoc/features/new_user/business_logic/new_user_cubit/new_user_cubit.dart';
import 'package:BrainDoc/features/new_user/ui/new_user_screen.dart';
import 'package:BrainDoc/features/onboarding/ui/onboarding_screen.dart';
import 'package:BrainDoc/features/payment/business_logic/confirm_booking_cubit/confirm_booking_cubit.dart';
import 'package:BrainDoc/features/payment/data/models/appointment_model.dart';
import 'package:BrainDoc/features/payment/ui/booking_success_screen.dart';
import 'package:BrainDoc/features/payment/ui/payment_screen.dart';
import 'package:BrainDoc/features/payment/ui/payment_summary_screen.dart';
import 'package:BrainDoc/features/phone_auth/business_logic/phone_auth_cubit/phone_auth_cubit.dart';
import 'package:BrainDoc/features/phone_auth/ui/login_screen.dart';
import 'package:BrainDoc/features/phone_auth/ui/otp_screen.dart';
import 'package:BrainDoc/features/profile/business_logic/profile_cubit/profile_cubit.dart';
import 'package:BrainDoc/features/profile/ui/edit_profile_screen.dart';
import 'package:BrainDoc/features/profile/ui/profile_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
          child: BlocProvider<PhoneAuthCubit>.value(
            value: getIt<PhoneAuthCubit>(),
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
          child: BlocProvider<PhoneAuthCubit>.value(
            value: getIt<PhoneAuthCubit>(),
            child: OtpScreen(
              phoneNumber: phoneNumber,
            ),
          ),
        );
      case Routes.newUserScreen:
        return PageTransition(
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.center,
          settings: settings,
          child: BlocProvider(
            create: (context) => getIt<NewUserCubit>(),
            child: NewUserScreen(),
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
      case Routes.editProfileScreen:
        var user = arguments as DocumentSnapshot;
        return PageTransition(
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.center,
          settings: settings,
          child: BlocProvider(
            create: (context) => getIt<ProfileCubit>(),
            child: EditProfileScreen(
              user: user,
            ),
          ),
        );
      case Routes.allDoctorsScreen:
        var doctors = arguments as List<DocumentSnapshot>;
        return PageTransition(
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.center,
          settings: settings,
          child: AllDoctorsScreen(
            doctors: doctors,
          ),
        );
      case Routes.doctorDetailsScreen:
        var doctor = arguments as DocumentSnapshot;
        return PageTransition(
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.center,
          settings: settings,
          child: DoctorDetailsScreen(
            doctor: doctor,
          ),
        );
      case Routes.bookingScreen:
        var doctor = arguments as DocumentSnapshot;
        return PageTransition(
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.center,
          settings: settings,
          child: BlocProvider(
            create: (context) => getIt<BookingCubit>()
              ..onSelectDate(
                  doctorDates: doctor['dates'],
                  dayOfWeek: DateFormat('EEEE').format(DateTime.now())),
            child: BookingScreen(
              doctor: arguments,
            ),
          ),
        );
      case Routes.paymentSummaryScreen:
        var paymentSummaryModel = arguments as PaymentSummaryModel;

        return PageTransition(
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.center,
          settings: settings,
          child: PaymentSummaryScreen(
            paymentSummaryModel: paymentSummaryModel,
          ),
        );
      case Routes.paymentScreen:
        var paymentSummaryModel = arguments as PaymentSummaryModel;

        return PageTransition(
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.center,
          settings: settings,
          child: PaymentScreen(
            paymentSummaryModel: paymentSummaryModel,
          ),
        );
      case Routes.bookingSuccessScreen:
        var paymentSummaryModel = arguments as PaymentSummaryModel;
        return PageTransition(
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.center,
          settings: settings,
          child: BlocProvider(
            create: (context) => getIt<ConfirmBookingCubit>()
              ..makeAppointment(
                appointmentModel: AppointmentModel(
                  userName: getIt<FirebaseAuth>().currentUser!.displayName,
                  userId: getIt<FirebaseAuth>().currentUser!.uid,
                  doctorName: paymentSummaryModel.doctor['name'],
                  doctorId: paymentSummaryModel.doctor.id,
                  date: paymentSummaryModel.date,
                  time: paymentSummaryModel.time,
                  notes: paymentSummaryModel.notes,
                  rating: null,
                  review: null,
                  isVisa: paymentSummaryModel.isVisa,
                  totalPrice: paymentSummaryModel.doctor['price'],
                  doctorImage: paymentSummaryModel.doctor['image'],
                  patientImage: getIt<FirebaseAuth>().currentUser!.photoURL,
                ),
              ),
            child: BookingSuccessScreen(
              paymentSummaryModel: paymentSummaryModel,
            ),
          ),
        );
      case Routes.appointmentsScreen:
        return PageTransition(
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.center,
          settings: settings,
          child: BlocProvider(
            create: (context) => getIt<AppointmentsCubit>()..getAppointments(),
            child: const AppointmentsScreen(),
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
    BlocProvider(
      create: (context) => getIt<HomeCubit>()
        ..getDoctors()
        ..getBanners(),
      child: const HomeScreen(),
    ),
    BlocProvider(
      create: (context) => getIt<ProfileCubit>()..getUserProfileData(),
      child: const ProfileScreen(),
    ),
  ];
}

class PaymentSummaryModel {
  final DocumentSnapshot doctor;
  final String date;
  final String time;
  bool isVisa;
  String? notes;
  PaymentSummaryModel(
      {required this.doctor,
      required this.date,
      required this.time,
      required this.isVisa,
      this.notes});
}
