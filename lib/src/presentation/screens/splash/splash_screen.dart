import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:talent_link/src/config/routes/routes_manager.dart';
import 'package:talent_link/src/core/base/widget/base_stateful_widget.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/resources/shared_preferences_keys.dart';

class SplashScreen extends BaseStatefulWidget {
  const SplashScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _SplashScreenState();
}

class _SplashScreenState extends BaseState<SplashScreen> {
  @override
  Future<void> didChangeDependencies() async {
    await _navigationToLoginScreen();
    super.didChangeDependencies();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        return Future.value(false);
      },
        child: Center(child: SvgPicture.asset(ImagePaths.appLogo)));
  }

  Future<void> _navigationToLoginScreen() async {
    Timer(const Duration(seconds: 2), () async {
      await _isUserLoggedIn()
          ? Navigator.pushReplacementNamed(context, Routes.main ,arguments: 0)
          : Navigator.pushReplacementNamed(context, Routes.login);
    });
  }

  Future<bool> _isUserLoggedIn() async {
    int userId = (await SharedPreferences.getInstance())
            .getInt(SharedPreferenceKeys.userId) ??
        -1;
    return userId != -1;
  }
}
