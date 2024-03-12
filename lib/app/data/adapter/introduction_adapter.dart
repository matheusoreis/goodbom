import 'package:goodbom/app/interactor/models/introduction_model.dart';
import 'package:pocketbase/pocketbase.dart';

class IntroductionAdapter {
  static IntroductionModel clear() {
    return IntroductionModel(
      background: '',
      title: '',
      buttonText: '',
      collectionId: '',
      recordId: '',
    );
  }

  static IntroductionModel fromMap(Map<String, dynamic> map) {
    return IntroductionModel(
      background: map['background'],
      title: map['title'],
      buttonText: map['buttonText'],
      collectionId: map['collectionId'],
      recordId: map['id'],
    );
  }

  static Map<String, dynamic> toMap(IntroductionModel model) {
    return {
      'background': model.background,
      'title': model.title,
      'buttonText': model.buttonText,
      'collectionId': model.collectionId,
      'id': model.recordId,
    };
  }

  static IntroductionModel fromRecordModel(RecordModel recordModel) {
    return IntroductionModel(
      background: recordModel.data['background'],
      title: recordModel.data['title'],
      buttonText: recordModel.data['buttonText'],
      collectionId: recordModel.collectionId,
      recordId: recordModel.id,
    );
  }

  static IntroductionModel copyWith(
    IntroductionModel model, {
    String? background,
    String? title,
    String? buttonText,
    String? collectionId,
    String? recordId,
  }) {
    return IntroductionModel(
      background: background ?? model.background,
      title: title ?? model.title,
      buttonText: buttonText ?? model.buttonText,
      collectionId: collectionId ?? model.collectionId,
      recordId: recordId ?? model.recordId,
    );
  }
}
