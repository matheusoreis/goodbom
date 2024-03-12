import 'package:goodbom/app/data/adapter/introduction_adapter.dart';
import 'package:goodbom/app/interactor/exceptions/introduction_exception.dart';
import 'package:goodbom/app/interactor/services/introductionm_service.dart';
import 'package:goodbom/app/interactor/states/introduction_state.dart';
import 'package:goodbom/app/shared/constants.dart';
import 'package:pocketbase/pocketbase.dart';

/// Implementação concreta do serviço de introdução do aplicativo.
class IntroductionServiceImpl implements IntroductionService {
  /// Instância do PocketBase para interagir com o backend.
  final PocketBase pocketBase = PocketBase(
    Constants.appEndpoint,
  );

  @override
  Future<IntroductionState> fetchIntroductions({required IntroductionState state}) async {
    try {
      final response = await pocketBase.collection('introductionView').getFullList();

      final introductions = response.map(IntroductionAdapter.fromRecordModel).toList();

      return state.setSuccess(introductions);
    } catch (e) {
      return state.setError(
        IntroductionServiceException(e.toString()),
      );
    }
  }
}
