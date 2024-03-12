import 'package:flutter/material.dart';
import 'package:goodbom/app/app_widget.dart';
import 'package:goodbom/app/interactor/dependencies/introduction_dependency.dart';
import 'package:goodbom/app/interactor/dependencies/style_dependency.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  StyleDependency.setupStyleDependency();
  IntroductionDependency.setupIntroductionDependency();

  runApp(
    const AppWidget(),
  );
}
