import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:evo/recommend_page/model/lava_channel.dart';
import 'package:evo/recommend_page/model/lava_user.dart';
import 'package:evo/recommend_page/model/lava_serializers.dart';

part 'lava_program.g.dart';

abstract class LavaProgram implements Built<LavaProgram, LavaProgramBuilder> {
  LavaProgram._();

  factory LavaProgram([updates(LavaProgramBuilder b)]) = _$LavaProgram;

  @BuiltValueField(wireName: 'program_id')
  String get programId;
  @BuiltValueField(wireName: 'program_name')
  String get programName;
  @BuiltValueField(wireName: 'program_desc')
  String get programDesc;
  @BuiltValueField(wireName: 'uid')
  String get uid;
  @BuiltValueField(wireName: 'create_time')
  String get createTime;
  @BuiltValueField(wireName: 'modify_time')
  String get modifyTime;
  @BuiltValueField(wireName: 'song_num')
  String get songNum;
  @BuiltValueField(wireName: 'status')
  String get status;
  @BuiltValueField(wireName: 'duration')
  String get duration;
  @BuiltValueField(wireName: 'key')
  String get key;
  @BuiltValueField(wireName: 'channels')
  BuiltList<LavaChannel> get channels;
  @BuiltValueField(wireName: 'user')
  LavaUser get user;
  @BuiltValueField(wireName: 'pic_url')
  String get picUrl;

  String toJson() {
    return json.encode(serializers.serializeWith(LavaProgram.serializer, this));
  }

  static LavaProgram fromJson(String jsonString) {
    return serializers.deserializeWith(
        LavaProgram.serializer, json.decode(jsonString));
  }

  static Serializer<LavaProgram> get serializer => _$lavaProgramSerializer;
}
