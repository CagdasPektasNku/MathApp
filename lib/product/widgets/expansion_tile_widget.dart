import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomExpansionTileWidget extends StatelessWidget {
  final title;
  final subtitle;

  const CustomExpansionTileWidget({Key? key, this.title, this.subtitle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        title,
        style: context.textTheme.headline4,
      ),
      children: [
        Column(
          children: [
            Padding(
              padding: context.horizontalPaddingLow,
              child: Text(
                subtitle,
                style: context.textTheme.headline5,
              ),
            )
          ],
        )
      ],
    );
  }
}
