import 'package:flutter/material.dart';
import 'package:goodbom/app/shared/constants.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: Constants.appPadding * 4),
      child: Image.asset(
        'assets/img/logo.png',
      ),
    );
  }
}
