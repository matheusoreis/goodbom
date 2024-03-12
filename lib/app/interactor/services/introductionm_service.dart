import 'package:goodbom/app/interactor/states/introduction_state.dart';

/// Interface para um serviço de introdução.
abstract interface class IntroductionService {
  /// Método que retorna o estado da introdução.
  ///
  /// [state] O estado atual da introdução, que pode ser usado para determinar a próxima ação.
  ///
  /// Retorna um [Future] que completa com um [IntroductionState] representando o resultado da busca.
  Future<IntroductionState> fetchIntroductions({required IntroductionState state});
}
