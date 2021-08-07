import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:math_app/core/constant/constant.dart';
import 'package:math_app/core/init/lang/locale_keys.g.dart';
import 'package:math_app/feature/main/select_buddy.dart';
import 'package:share/share.dart';

class EndPage extends StatefulWidget {
  const EndPage({Key? key}) : super(key: key);

  @override
  _EndPageState createState() => _EndPageState();
}

class _EndPageState extends State<EndPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(child: Text(score.toString())),
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Color(0xff5200cc)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SelectBudy()));
                score = 0;
              },
              child: Text(LocaleKeys.endPage_restart.tr())),
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Color(0xff5200cc)),
              onPressed: () {
                Share.share(LocaleKeys.endPage_shareScore.tr() + "$score");
              },
              child: Text(LocaleKeys.endPage_shareMyScore.tr()))
        ],
      ),
    );
  }
}
