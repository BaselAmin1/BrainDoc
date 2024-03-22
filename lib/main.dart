import 'package:BrainDoc/core/bloc_observer.dart';
import 'package:BrainDoc/core/cache_helper/cache_helper.dart';
import 'package:BrainDoc/core/di.dart';
import 'package:BrainDoc/core/routing/app_router.dart';
import 'package:BrainDoc/core/routing/routes.dart';
import 'package:BrainDoc/core/shared/localization_cubit/localization_cubit.dart';
import 'package:BrainDoc/core/theming/themes.dart';
import 'package:BrainDoc/firebase_options.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupGetIt();
  await EasyLocalization.ensureInitialized();
  await CacheHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  late String initialRoute;

  Bloc.observer = MyBlocObserver();
 await FirebaseAuth.instance.authStateChanges().listen(
    (user) {
      if (user == null) {
        initialRoute = Routes.onBoarding;
      } else {
        initialRoute = Routes.mainLayout;
      }
    },
  );

  runApp(
    EasyLocalization(
      saveLocale: true,
      useFallbackTranslations: true,
      fallbackLocale: const Locale('en', 'UK'),
      supportedLocales: const [
        Locale('ar', 'EG'),
        Locale('en', 'UK'),
      ],
      path: 'assets/languages',
      child: MyApp(
        appRouter: AppRouter(),
        initialRoute: initialRoute,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  String? initialRoute;

   MyApp({super.key, required this.appRouter, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LocalizationCubit>(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
          ),
          child: MaterialApp(
            title: 'egyptChemicals'.tr(),
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: lightTheme,
            themeMode: ThemeMode.light,
            initialRoute: initialRoute,
            onGenerateRoute: appRouter.generateRoute,
            builder: EasyLoading.init(),
          ),
        ),
      ),
    );
  }
}
