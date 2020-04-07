import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:evo/recommend_page/model/lava_channel.dart';
import 'package:evo/recommend_page/model/lava_program.dart';
import 'package:evo/recommend_page/model/lava_result.dart';
import 'package:evo/recommend_page/model/lava_user.dart';

part 'lava_serializers.g.dart';

@SerializersFor(
  [
    LavaResult,
    LavaProgram,
    LavaChannel,
    LavaUser,
  ],
)

final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();