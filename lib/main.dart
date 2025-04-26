import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:scribblr/screens/scribblr_splash_screen.dart';
import 'package:scribblr/store/app_store.dart';
import 'package:scribblr/utils/app_theme.dart';
import 'package:scribblr/utils/common.dart';
import 'package:scribblr/utils/firebase_options.dart';
import 'package:scribblr/utils/flutter_web_frame/flutter_web_frame.dart';

AppStore appStore = AppStore();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());

  if (isWeb) {
    maxScreenWidth = 475.0;
  }

  if (isMobile || isWeb) {
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value) {
      setupFirebaseRemoteConfig();
    });
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterWebFrame(
      maximumSize: Size(475.0, 812.0),
      enabled: kIsWeb,
      builder: (ctx) {
        return Observer(builder: (ctx) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: !appStore.isDarkModeOn ? AppThemeData.lightTheme : AppThemeData.darkTheme,
            title: 'Scribblr',
            navigatorKey: navigatorKey,
            scrollBehavior: AppScrollBehavior(),
            home: const ScribblrSplashScreen(),
          );
        });
      },
    );
  }
}
