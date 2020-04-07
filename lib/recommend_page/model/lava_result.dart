import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:evo/recommend_page/model/lava_program.dart';
import 'package:evo/recommend_page/model/lava_serializers.dart';

part 'lava_result.g.dart';

abstract class LavaResult implements Built<LavaResult, LavaResultBuilder> {
  LavaResult._();

  factory LavaResult([updates(LavaResultBuilder b)]) = _$LavaResult;

  @BuiltValueField(wireName: 'err')
  String get err;
  @BuiltValueField(wireName: 'data')
  LavaData get data;

  String toJson() {
    return json.encode(serializers.serializeWith(LavaResult.serializer, this));
  }

  static LavaResult fromJson(String jsonString) {
    return serializers.deserializeWith(
        LavaResult.serializer, jsonDecode(jsonString));
  }

  static LavaResult fromMap(Map map) {
    return serializers.deserializeWith(LavaResult.serializer, map);
  }

  static Serializer<LavaResult> get serializer => _$lavaResultSerializer;
}

abstract class LavaData implements Built<LavaData, LavaDataBuilder> {
  LavaData._();

  factory LavaData([updates(LavaDataBuilder b)]) = _$LavaData;

  @BuiltValueField(wireName: 'size')
  String get size;
  @BuiltValueField(wireName: 'total')
  int get total;
  @BuiltValueField(wireName: 'lists')
  BuiltList<LavaProgram> get lists;

  String toJson() {
    return json.encode(serializers.serializeWith(LavaData.serializer, this));
  }

  static LavaData fromJson(String jsonString) {
    return serializers.deserializeWith(
        LavaData.serializer, json.decode(jsonString));
  }

  static Serializer<LavaData> get serializer => _$lavaDataSerializer;
}
