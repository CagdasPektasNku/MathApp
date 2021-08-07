import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:math_app/core/constant/constant.dart';
import 'package:kartal/kartal.dart';
import 'package:math_app/core/init/lang/locale_keys.g.dart';
import 'package:math_app/feature/main/main_page.dart';

class SelectBudy extends StatefulWidget {
  @override
  _SelectBudyState createState() => _SelectBudyState();
}

class _SelectBudyState extends State<SelectBudy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: GridView.builder(
              itemCount: selectBudy.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                return SafeArea(
                  child: Padding(
                    padding: context.paddingLow,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainPage(
                                      img: selectBudy[index],
                                    )),
                            (route) => false);
                      },
                      child: Card(
                          child: Image(image: AssetImage(selectBudy[index]))),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  LocaleKeys.selectBuddy_chooseChar.tr(),
                  style: context.textTheme.headline3,
                ),
              ))
        ],
      ),
    );
  }
}
