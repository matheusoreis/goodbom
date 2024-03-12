import 'package:goodbom/app/shared/get_it.dart';
import 'package:goodbom/app/shared/theme/button_style.dart';

class StyleDependency {
  static void setupStyleDependency() {
    dependency.registerFactory(
      GoodButtonStyle.new,
    );
  }
}
