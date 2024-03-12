import 'package:flutter/material.dart';
import 'package:goodbom/app/shared/constants.dart';
import 'package:goodbom/app/shared/theme/colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: Constants.appPadding * 4),
            child: Image.asset(
              'assets/img/logo.png',
            ),
          ),
          const CircularProgressIndicator(
            color: GoodColors.secondary,
          ),
        ],
      ),
    );
  }
}
