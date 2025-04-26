import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:scribblr/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'colors.dart';

const double DEFAULT_RADIUS = 10.0;
final RegExp emailValidate = RegExp('^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]');

InputDecoration inputDecoration(BuildContext context,
    {String? hintText, String? labelText, Widget? suffixIcon}) {
  return InputDecoration(
    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(DEFAULT_RADIUS),borderSide: BorderSide(color: appColorPrimary)),
    focusColor: appColorPrimary,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(DEFAULT_RADIUS),borderSide: BorderSide(color: appColorPrimary)),
    labelText: labelText ?? '',
    labelStyle: TextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
    suffixIcon: suffixIcon,
  );
}

Future<FirebaseRemoteConfig> setupFirebaseRemoteConfig() async {
  final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

  remoteConfig.setConfigSettings(RemoteConfigSettings(fetchTimeout: Duration.zero, minimumFetchInterval: Duration.zero));
  await remoteConfig.fetch();
  await remoteConfig.fetchAndActivate();
  return remoteConfig;
}

Future<void> commonLaunchUrl(String address, {LaunchMode launchMode = LaunchMode.inAppWebView}) async {
  await launchUrl(Uri.parse(address), mode: launchMode).catchError((e) {
    toast('Invalid URL: $address');
  });
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {PointerDeviceKind.touch, PointerDeviceKind.mouse};
}