import 'package:dio/dio.dart';
import 'package:evo/recommend_page/model/lava_program.dart';
import 'package:evo/recommend_page/model/lava_result.dart';
import 'package:built_collection/built_collection.dart';

class Lava {
  static Future<BuiltList<LavaProgram>> fetchRecommendPrograms() async {
    Dio dio = Dio();
    Response response = await dio.request(
      'http://www.lavaradio.com/api/radio.listGroundPrograms.json?_pn=3&_sz=20',
      options: Options(responseType: ResponseType.plain),
    );
    print(response.data);
    LavaResult result = LavaResult.fromJson(response.data);

    if (result.err == 'hapn.ok') {
      print('Request success');
      LavaData resultData = result.data;
      if (resultData != null) {
        print(
            'Request result data size:${resultData.size}, total:${resultData.total}');
        BuiltList<LavaProgram> dataList = resultData.lists;
        if (dataList != null && dataList.length > 0) {
          return dataList;
        }
      }
    }

    return null;
  }
}
