import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:math_app/core/constant/constant.dart';
import 'package:math_app/core/functions/global_functions.dart';
import 'package:kartal/kartal.dart';
import 'package:math_app/core/init/lang/locale_keys.g.dart';
import 'package:math_app/feature/main/end_page.dart';

class MinusPage extends StatefulWidget {
  final img;
  const MinusPage({Key? key, this.img}) : super(key: key);

  @override
  _MinusPageState createState() => _MinusPageState();
}

class _MinusPageState extends State<MinusPage> {
  late CountdownTimerController controller;
  int endTime = DateTime.now().millisecondsSinceEpoch +
      Duration(seconds: 60).inMilliseconds;

  @override
  void initState() {
    super.initState();
    controller = CountdownTimerController(endTime: endTime, onEnd: onEnd);
  }

  void onEnd() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => EndPage()),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    var a = GlobalFunctions().randomNumberMaker();
    var b = GlobalFunctions().randomNumberMaker();
    if (a < b) {
      a = a + b;
    }
    answers.clear();

    var trueAnswer = GlobalFunctions().resultMinus(a, b);
    Color _colorContainer = Colors.orange;

    answers.add(GlobalFunctions().randomNumberMaker());
    answers.add(GlobalFunctions().randomNumberMaker());

    answers.add(GlobalFunctions().randomNumberMaker());

    answers.add(GlobalFunctions().resultMinus(a, b));
    answers.shuffle();

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: context.verticalPaddingMedium,
                child: Container(
                  height: 150,
                  width: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(widget.img))),
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            height: 50,
            width: 300,
            color: Color(0xff6600ff),
            child: Center(
              child: Text(
                "${a.toString()}-${b.toString()}",
                style: context.primaryTextTheme.headline4,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () async {
                if (trueAnswer == answers[0]) {
                  score = score + 10;

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green,
                      duration: const Duration(seconds: 1),
                      content:
                          Text(LocaleKeys.mathPage_trueAnswer.tr() + '$score'),
                    ),
                  );
                } else {
                  score = score - 10;

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      duration: const Duration(seconds: 1),
                      content:
                          Text(LocaleKeys.mathPage_wrongAnswer.tr() + '$score'),
                    ),
                  );
                }
                await Future.delayed(Duration(seconds: 2));
                setState(() {});
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 300,
                color: Color(0xff99adff),
                child: Center(
                  child: Text(
                    "${answers[0].toString()}",
                    style: context.primaryTextTheme.headline4,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () async {
                if (trueAnswer == answers[1]) {
                  score = score + 10;

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green,
                      duration: const Duration(seconds: 1),
                      content:
                          Text(LocaleKeys.mathPage_trueAnswer.tr() + '$score'),
                    ),
                  );
                } else {
                  score = score - 10;

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      duration: const Duration(seconds: 1),
                      content:
                          Text(LocaleKeys.mathPage_trueAnswer.tr() + '$score'),
                    ),
                  );
                }
                await Future.delayed(Duration(seconds: 2));
                setState(() {});
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 300,
                color: Color(0xff99adff),
                child: Center(
                  child: Text(
                    "${answers[1].toString()}",
                    style: context.primaryTextTheme.headline4,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () async {
                if (trueAnswer == answers[2]) {
                  score = score + 10;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green,
                      duration: const Duration(seconds: 1),
                      content:
                          Text(LocaleKeys.mathPage_trueAnswer.tr() + '$score'),
                    ),
                  );
                } else {
                  score = score - 10;

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      duration: const Duration(seconds: 1),
                      content:
                          Text(LocaleKeys.mathPage_wrongAnswer.tr() + '$score'),
                    ),
                  );
                }
                await Future.delayed(Duration(seconds: 2));
                setState(() {});
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 300,
                color: Color(0xff99adff),
                child: Center(
                  child: Text(
                    "${answers[2].toString()}",
                    style: context.primaryTextTheme.headline4,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () async {
                if (trueAnswer == answers[3]) {
                  score = score + 10;

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green,
                      duration: const Duration(seconds: 1),
                      content:
                          Text(LocaleKeys.mathPage_trueAnswer.tr() + '$score'),
                    ),
                  );
                } else {
                  score = score - 10;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      duration: const Duration(seconds: 1),
                      content:
                          Text(LocaleKeys.mathPage_wrongAnswer.tr() + '$score'),
                    ),
                  );
                }
                await Future.delayed(Duration(seconds: 2));
                setState(() {});
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 300,
                color: Color(0xff99adff),
                child: Center(
                  child: Text(
                    "${answers[3].toString()}",
                    style: context.primaryTextTheme.headline4,
                  ),
                ),
              ),
            ),
          ),
          CountdownTimer(
            controller: controller,
            widgetBuilder: (_, CurrentRemainingTime? time) {
              if (time == null) {
                return Text(LocaleKeys.mathPage_gameOver.tr());
              }
              return Text(LocaleKeys.mathPage_timeToEnd.tr() + '${time.sec}');
            },
          ),
        ],
      ),
    );
  }
}
