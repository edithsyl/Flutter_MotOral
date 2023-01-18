import 'package:beta_version/assets/custom_icons.dart';
import 'package:beta_version/data/exercise_categories_data.dart';
import 'package:beta_version/widgets/alert_dialogue.dart';
import 'package:beta_version/widgets/daily_practice_widgets/completed_all_card.dart';
import 'package:beta_version/widgets/daily_practice_widgets/daily_parctice_card.dart';
import 'package:beta_version/widgets/daily_practice_widgets/daily_practice_dots.dart';
import 'package:beta_version/widgets/daily_practice_widgets/daily_practice_lines.dart';

import 'package:beta_version/widgets/home_announcements/do_case_history_card.dart';
import 'package:beta_version/widgets/snack_bars.dart';
import 'package:custom_ui/custom_ui.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  final String userName = 'Joe';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColorsData.regular().primaryOrange,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 56, 24, 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Welcome, $userName',
                    style: AppTypographyData.primaryWhite().quicksandTitle2,
                  ),
                  IconButton(
                    icon: const Icon(
                      CustomIcons.inbox_1,
                    ),
                    color: AppColorsData.regular().primaryWhite,
                    onPressed: () => context.goNamed('notification'),
                  )
                ],
              ),
            ),
            // const VerticalGap(num: 25),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.fromLTRB(32, 40, 32, 32),
              decoration: BoxDecoration(
                color: AppColorsData.regular().primaryWhite,
                borderRadius: const AppRadiusData.regular()
                    .asBorderRadius()
                    .verticalRegular,
              ),
              child: Column(
                children: <Widget>[
                  DoCaseHistory(
                    ontap: () {},
                  ),
                  const VerticalGap(num: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(CustomIcons.streakfire,
                          color: AppColorsData.regular().primaryOrange),
                      const HorizontalGap(num: 48),
                      Text(
                        'Your Daily Practice',
                        style:
                            AppTypographyData.primaryOrange().quicksandTitle2,
                      ),
                    ],
                  ),
                  const VerticalGap(num: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //const CompletedAllCard(),
                        YourDailyPractice(context),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

///// sample from https://stackoverflow.com/questions/61822182/flutter-expand-column-inside-row
Widget YourDailyPractice(BuildContext context) {
  return IntrinsicHeight(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const InvisibleLine(),
            const CompletedDot(),
            const GreyLine(),
            ////
            const GreyLine(),
            const ThisDot(),
            const OrangeLine(),
            ////
            const OrangeLine(),
            const TodoDot(),
            const OrangeLine(),
          ],
        ),
        const HorizontalGap(num: 16.0),
        Flexible(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CompletedDailyPractice(
                  exercise: ExerciseCategories.category('c3').exercise('en1'),
                  ontap: () => showCustomDialog(
                    context,
                    'Go to this exericse?',
                    'cancel',
                    'Confirm',
                    () => Navigator.of(context).pop(),
                    () => context.go('/category/c1/exerciseinfo/en1'),
                  ),
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
                ThisDailyPractice(
                  exercise: ExerciseCategories.category('c1').exercise('en2'),
                  ontap: () {
                    context.go('/category/c1/exerciseinfo/en2'); //FIXME
                  },
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
                TodoDailyPractice(
                  exercise: ExerciseCategories.category('c2').exercise('en3'),
                  ontap: () => showCustomDialog(
                    context,
                    'Go to this exericse?',
                    'cancel',
                    'Confirm',
                    () => Navigator.of(context).pop(),
                    () => context.go('/category/c2/exerciseinfo/en3'),
                  ),
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
