import 'package:built_value/built_value.dart';

part 'recommend_model.g.dart';

abstract class RecommendModel
    implements Built<RecommendModel, RecommendModelBuilder> {
  RecommendModel._();

  factory RecommendModel([updates(RecommendModelBuilder b)]) = _$RecommendModel;

  String get id;
  String get title;
  String get avatarUrl;
  String get userName;
  String get imgUrl;
}
