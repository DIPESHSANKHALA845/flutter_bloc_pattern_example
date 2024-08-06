import 'package:bloc_pattern/constant/app_constants.dart';
import 'package:bloc_pattern/routes/app_routes.dart';
import 'package:bloc_pattern/ui/no_internet/no_internet_view.dart';
import 'package:bloc_pattern/utils/app_theme.dart';
import 'package:bloc_pattern/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'cubit_state/app_cubit.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..init(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          if (state is AppNoInternet) {
            return ScreenUtilInit(
                builder: (context,_) {
                return MaterialApp(
                  title: AppConstants.stringConstant.appName,
                  locale: state.locale,
                  debugShowCheckedModeBanner: false,
                  theme: AppTheme.defaultTheme,
                  home: const NoInternetView(),
                );
              }
            );
          } else if (state is AppLoaded) {
            return ScreenUtilInit(
                builder: (context,_) {
                return MaterialApp(
                  title: AppConstants.stringConstant.appName,
                  debugShowCheckedModeBanner: false,
                  theme: AppTheme.defaultTheme,
                  routes: AppRoutes.routes,
                  navigatorKey: NavigationService.instance.navigatorKey,
                );
              }
            );
          }else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}