import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:evo/recommend_page/model/lava_serializers.dart';

part 'lava_channel.g.dart';

abstract class LavaChannel implements Built<LavaChannel, LavaChannelBuilder> {
  LavaChannel._();

  factory LavaChannel([updates(LavaChannelBuilder b)]) = _$LavaChannel;

  @BuiltValueField(wireName: 'recommend')
  String get recommend;
  @BuiltValueField(wireName: 'channel_id')
  String get channelId;
  @BuiltValueField(wireName: 'radio_id')
  String get radioId;
  @BuiltValueField(wireName: 'channel_name')
  String get channelName;
  @BuiltValueField(wireName: 'english_name')
  String get englishName;
  @BuiltValueField(wireName: 'channel_desc')
  String get channelDesc;
  @BuiltValueField(wireName: 'rank')
  String get rank;
  @BuiltValueField(wireName: 'color')
  String get color;
  @BuiltValueField(wireName: 'pic_url')
  String get picUrl;
  String toJson() {
    return json.encode(serializers.serializeWith(LavaChannel.serializer, this));
  }

  static LavaChannel fromJson(String jsonString) {
    return serializers.deserializeWith(
        LavaChannel.serializer, json.decode(jsonString));
  }

  static Serializer<LavaChannel> get serializer => _$lavaChannelSerializer;
}
