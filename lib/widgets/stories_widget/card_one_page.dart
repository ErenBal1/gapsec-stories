import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gapsec/stories/stories.dart';
import 'package:gapsec/utils/app_colors.dart';
import 'package:gapsec/utils/constants.dart';
import 'package:gapsec/widgets/stories_widget/card_widget.dart';
import 'package:tab_container/tab_container.dart';

class MyCard {
  static Widget cardOne({required BuildContext context, required int i}) {
    return SizedBox(
      width: Config.screenWidth! * 0.7,
      height: 400,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: TabContainer(
          color: CustomColors.red.withOpacity(0.3),
          tabEdge: TabEdge.right,
          childPadding: const EdgeInsets.all(20.0),
          tabs: tabs[i],
          children: [
            stories(context: context)[i][0],
            stories(context: context)[i][1],
            stories(context: context)[i][2],
            stories(context: context)[i][3],
          ],
        ),
      ),
    );
  }

  static List<Widget> getTabs2(BuildContext context) => <Widget>[
        const Icon(
          Icons.star_border,
          color: CustomColors.white,
        ),
        const Icon(
          Icons.star_border,
          color: CustomColors.white,
        ),
        const Icon(
          Icons.lock,
          color: CustomColors.white,
        ),
        const Icon(
          Icons.lock,
          color: CustomColors.white,
        ),
        /*  const Icon(
        Icons.star_border,
        color: CustomColors.red,
      ),
      const Icon(
        Icons.star_border,
        color: CustomColors.red,
      ),
      const Icon(
        Icons.lock,
        color: CustomColors.red,
      ),
      const Icon(
        Icons.lock,
        color: CustomColors.red,
      ), */
      ];
}
