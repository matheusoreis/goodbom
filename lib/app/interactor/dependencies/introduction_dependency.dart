import 'package:goodbom/app/data/services/introductionm_service_impl.dart';
import 'package:goodbom/app/interactor/stores/introduction_store.dart';
import 'package:goodbom/app/shared/get_it.dart';
import 'package:goodbom/app/shared/theme/button_style.dart';

class IntroductionDependency {
  static void setupIntroductionDependency() {
    dependency
      ..registerFactory(
        IntroductionServiceImpl.new,
      )
      ..registerFactory(
        () => IntroductionStore(
          service: dependency.get<IntroductionServiceImpl>(),
          buttonStyle: dependency.get<GoodButtonStyle>(),
        ),
      );
  }
}
