import 'package:goodbom/app/interactor/exceptions/introduction_exception.dart';
import 'package:goodbom/app/interactor/models/introduction_model.dart';

/// Classe base para representar os diferentes estados relacionados à introdução do aplicativo.
///
/// Esta é uma classe selada, o que significa que suas subclasses deve ser definidas no mesmo arquivo.
sealed class IntroductionState {
  // Construtor constante que inicializa os atributos da classe.
  const IntroductionState({
    required this.introductions,
    this.exception,
    this.isLoading = false,
  });

  /// Método de fábrica para retornar um estado inicia.
  ///
  /// Este método é útil para inicializar o estado da introdução quando não há introduções carregadas.
  factory IntroductionState.setInitial() {
    return InitialIntroductionState();
  }

  /// Lista das introduções.
  final List<IntroductionModel> introductions;

  /// Exceção, se houver, relacionada às introduções.
  final IntroductionException? exception;

  /// Indica se o as introduções está em carregamento.
  final bool isLoading;

  /// Define o estado para o carregamento.
  ///
  /// Indica que o aplicativo está carregando as introduções.
  IntroductionState setLoading() {
    return LoadingIntroductionState(introductions: introductions);
  }

  /// Define o estado para o sucesso.
  ///
  /// Indica que as introduções foram carregadas com sucesso.
  IntroductionState setSuccess(List<IntroductionModel> introductions) {
    return SuccessIntroductionState(introductions: introductions);
  }

  /// Define o estado para o erro.
  ///
  /// Indica que ocorreu um erro ao carregar as introduções.
  IntroductionState setError(IntroductionException exception) {
    return ErrorIntroductionState(
      exception: exception,
      introductions: introductions,
    );
  }
}

/// Subclasse que representa o estado inicial, com a lista de introduções vazia.
class InitialIntroductionState extends IntroductionState {
  InitialIntroductionState() : super(introductions: []);
}

/// Subclasse que representa o estado de carregamento, indicando que o aplicativo está carregando as introduções.
class LoadingIntroductionState extends IntroductionState {
  const LoadingIntroductionState({
    required super.introductions,
  }) : super(isLoading: true);
}

/// Subclasse que representa o estado de sucesso, indicando que as introduções foram carregadas com sucesso.
class SuccessIntroductionState extends IntroductionState {
  const SuccessIntroductionState({required super.introductions});
}

/// Subclasse que representa o estado de erro, indicando que ocorreu um erro ao carregar as introduções.
class ErrorIntroductionState extends IntroductionState {
  const ErrorIntroductionState({
    required super.exception,
    required super.introductions,
  }) : super(isLoading: false);
}
