import 'package:authentication/core/constants/constants.dart';
import 'package:authentication/core/router/route_name.dart';
import 'package:authentication/core/router/router.dart';
import 'package:authentication/theme/ui_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('vi')],
      path: Constants.languagePath,
      useOnlyLangCode: true,
      fallbackLocale: const Locale('en'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.titleApp,
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      theme: uiThemeLight,
      darkTheme: uiThemeDark,
      initialRoute: RouteName.welcomeRoute,
      onGenerateRoute: MyRouter.generateRoute,
    );
  }
}
