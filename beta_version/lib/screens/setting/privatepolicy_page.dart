import 'package:beta_version/widgets/login_widgets.dart';
import 'package:beta_version/widgets/top_app_bar.dart';
import 'package:custom_ui/custom_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// TODO: recreate setting page

class PrivatePolicyPage extends StatefulWidget {
  const PrivatePolicyPage({Key? key}) : super(key: key);

  @override
  State<PrivatePolicyPage> createState() => _PrivatePolicyPageState();
}

class _PrivatePolicyPageState extends State<PrivatePolicyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO:  test app bar here
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(24, 30, 24, 0),
          decoration: BoxDecoration(
            color: AppColorsData.regular().primaryOrange,
          ),
          child: AppBarContent(
            title: 'PrivatePolicy',
            leftOnPressed: () {
              context.goNamed('home');
            },
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text('PrivatePolicy page'),
                  const VerticalGap(num: 25),
                  const VerticalGap(num: 25),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
