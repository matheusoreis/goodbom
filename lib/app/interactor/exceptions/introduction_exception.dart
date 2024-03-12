/// Exceção relacionada a introdução.
///
/// Esta classe é selada, o que significa que suas subclasses devem ser definidas no mesmo arquivo.
sealed class IntroductionException implements Exception {
  /// Cria uma nova instância de IntroductionException com a mensagem e stack trace opcional.
  const IntroductionException(
    this.message, [
    this.stackTrace,
  ]);

  /// A mensagem associada com a exceção.
  final String message;

  /// O stack trace associado com a exceção, se disponível.
  final StackTrace? stackTrace;

  @override
  String toString() {
    return "$runtimeType: $message${stackTrace == null ? '' : '\n$stackTrace'}";
  }
}

/// Exceção específica para erros relacionados ao serviço de introdução.
class IntroductionServiceException extends IntroductionException {
  const IntroductionServiceException(super.message, [super.stackTrace]);
}
