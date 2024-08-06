import 'package:flutter_bloc/flutter_bloc.dart';
import '../../routes/app_routes.dart';
import '../../utils/navigation.dart';
import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState().init());

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 2)).whenComplete(
            () => NavigationService.instance.navigateTo(AppRoutes.login));
  }
}
