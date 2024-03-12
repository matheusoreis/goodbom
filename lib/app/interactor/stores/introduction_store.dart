import 'package:flutter/material.dart';
import 'package:goodbom/app/data/services/introductionm_service_impl.dart';
import 'package:goodbom/app/interactor/states/introduction_state.dart';
import 'package:goodbom/app/shared/theme/button_style.dart';

class IntroductionStore extends ValueNotifier<IntroductionState> {
  IntroductionStore({
    required this.service,
    required this.buttonStyle,
  }) : super(IntroductionState.setInitial());

  final IntroductionServiceImpl service;
  final GoodButtonStyle buttonStyle;

  Future<void> fetchIntroductions() async {
    value = value.setLoading();

    value = await service.fetchIntroductions(state: value);
  }
}
