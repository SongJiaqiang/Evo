import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:evo/recommend_page/model/lava_serializers.dart';

part 'lava_user.g.dart';

abstract class LavaUser implements Built<LavaUser, LavaUserBuilder> {
  LavaUser._();

  factory LavaUser([updates(LavaUserBuilder b)]) = _$LavaUser;

  @BuiltValueField(wireName: 'uid')
  String get uid;
  @BuiltValueField(wireName: 'uname')
  String get uname;
  @BuiltValueField(wireName: 'user_type')
  String get userType;
  @BuiltValueField(wireName: 'pic_url')
  String get picUrl;
  String toJson() {
    return json.encode(serializers.serializeWith(LavaUser.serializer, this));
  }

  static LavaUser fromJson(String jsonString) {
    return serializers.deserializeWith(
        LavaUser.serializer, json.decode(jsonString));
  }

  static Serializer<LavaUser> get serializer => _$lavaUserSerializer;
}
