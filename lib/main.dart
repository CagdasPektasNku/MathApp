import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:math_app/core/constant/app_constants.dart';
import 'package:math_app/core/init/lang/language_manager.dart';
import 'package:math_app/feature/main/select_buddy.dart';
import 'package:provider/provider.dart';

import 'core/init/notifier/app_provider_list.dart';
import 'core/init/notifier/theme_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(MultiProvider(
    providers: [...ApplicationProvider.instance!.dependItems],
    child: EasyLocalization(
        child: MyApp(),
        supportedLocales: LanguageManager.instance!.supportedLocales,
        startLocale: LanguageManager.instance!.trLocale,
        path: ApplicationConstants.LANG_ASSET_PATH),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      theme: context.watch<ThemeNotifier>().currentTheme,
      home: SelectBudy(),
    );
  }
}
