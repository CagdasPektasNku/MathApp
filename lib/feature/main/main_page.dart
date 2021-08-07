import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:math_app/core/init/lang/language_manager.dart';
import 'package:math_app/core/init/lang/locale_keys.g.dart';
import 'package:math_app/core/init/notifier/theme_notifier.dart';
import 'package:math_app/core/init/theme/enum/theme_enum.dart';
import 'package:math_app/feature/main/math_page.dart';
import 'package:math_app/feature/main/minus_page.dart';
import 'package:math_app/feature/main/select_buddy.dart';
import 'package:math_app/product/widgets/expansion_tile_widget.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  final img;

  const MainPage({Key? key, @required this.img}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool switchLang = false;

  Locale? appLocale = LanguageManager.instance!.trLocale;
  void changeAppLocalization(Locale? locale) {
    if (locale != null) {
      appLocale = locale;
      context.setLocale(locale);
    }
  }

  void changeAppTheme() {
    context.read<ThemeNotifier>().changeTheme();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                height: 100,
                width: context.width,
                color: Color(0xff99adff),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        iconSize: 30,
                        icon: Icon(Icons.cancel),
                        onPressed: () => Navigator.pop(context)),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.mainPage_changeAppLang.tr(),
                    style: context.textTheme.headline5,
                  ),
                  DropdownButton<Locale>(
                    items: [
                      buildSelectTr(context),
                      buildSelectEn(context),
                    ],
                    onChanged: (value) {
                      changeAppLocalization(value);
                    },
                    value: appLocale,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.mainPage_changeAppTheme.tr(),
                    style: context.textTheme.headline5,
                  ),
                  IconButton(
                      icon: context.watch<ThemeNotifier>().currenThemeEnum ==
                              AppThemes.LIGHT
                          ? Icon(Icons.nights_stay_outlined,
                              size: context.dynamicWidth(0.07))
                          : Icon(Icons.wb_sunny_outlined,
                              size: context.dynamicWidth(0.07)),
                      onPressed: changeAppTheme),
                ],
              )
            ],
          ),
        ),
        backgroundColor: Color(0xffb3ecff),
        appBar: AppBar(),
        body: Column(
          children: [
            Padding(
              padding: context.paddingLow,
              child: Card(
                elevation: 5,
                child: CustomExpansionTileWidget(
                  title: LocaleKeys.mainPage_aboutAppTitle.tr(),
                  subtitle: LocaleKeys.mainPage_aboutAppSubTitle.tr(),
                ),
              ),
            ),
            Padding(
              padding: context.paddingLow,
              child: Card(
                elevation: 5,
                child: CustomExpansionTileWidget(
                    title: LocaleKeys.mainPage_howToPlay.tr(),
                    subtitle: LocaleKeys.mainPage_howToPlaySubTtile.tr()),
              ),
            ),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(widget.img))),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Color(0xff5200cc)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SelectBudy()));
                },
                child: Text(
                  LocaleKeys.mainPage_changeCharacter.tr(),
                  style: context.primaryTextTheme.headline4,
                )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Color(0xff5200cc)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MathPage(
                                img: widget.img,
                              )));
                },
                child: Text(
                  LocaleKeys.mainPage_addPage.tr(),
                  style: context.primaryTextTheme.headline4,
                )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Color(0xff5200cc)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MinusPage(
                                img: widget.img,
                              )));
                },
                child: Text(
                  LocaleKeys.mainPage_minusPage.tr(),
                  style: context.primaryTextTheme.headline4,
                ))
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<Locale> buildSelectEn(BuildContext context) {
    return DropdownMenuItem(
        value: LanguageManager.instance!.enLocale, child: Text('en'));
  }

  DropdownMenuItem<Locale> buildSelectTr(BuildContext context) {
    return DropdownMenuItem(
        value: LanguageManager.instance!.trLocale, child: Text('tr'));
  }
}
