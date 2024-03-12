import 'package:flutter/material.dart';
import 'package:goodbom/app/shared/constants.dart';
import 'package:goodbom/app/shared/theme/colors.dart';

class GoodButtonStyle {
  ButtonStyle primary() {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return GoodColors.primaryDisabled;
          }

          return GoodColors.primary;
        },
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            Constants.appRadius,
          ),
        ),
      ),
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) => Colors.white,
      ),
    );
  }

  ButtonStyle secondary() {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return GoodColors.primaryDisabled;
          }

          return GoodColors.secondary;
        },
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            Constants.appRadius,
          ),
        ),
      ),
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) => Colors.white,
      ),
    );
  }
}
