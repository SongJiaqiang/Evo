import 'package:flutter/material.dart';
import 'package:evo/recommend_page/model/recommend_model.dart';
import 'package:evo/recommend_page/ui/tab_recommend_page_cell.dart';
import 'package:evo/recommend_page/ui/tab_recommend_page_header.dart';
import 'package:dio/dio.dart';

class TabRecommendPage extends StatefulWidget {
  @override
  _TabRecommendPageState createState() => _TabRecommendPageState();
}

class _TabRecommendPageState extends State<TabRecommendPage> {
  List<RecommendModel> dataSourceItems = [];

  @override
  void didChangeDependencies() {
    loadData();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataSourceItems.length + 1,
      itemBuilder: (_, index) {
        if (index == 0) {
          return TabRecommendPageHeader();
        } else {
          return TabRecommendPageCell(cellModel: dataSourceItems[index - 1]);
        }
      },
    );
  }

  void loadData() async {
    Dio dio = Dio();
    Response<Map> response = await dio.get(
        'http://www.lavaradio.com/api/radio.listGroundPrograms.json?_pn=3&_sz=20');
    print(response.data.toString());
    if (response.data['err'] == 'hapn.ok') {
      print('Request success');
      Map resultData = response.data['data'];
      if (resultData != null) {
        print(
            'Request result data size:${resultData['size']}, total:${resultData['total']}');
        List dataList = resultData['lists'];
        if (dataList != null && dataList.length > 0) {
          List<RecommendModel> newModels = [];
          for (Map item in dataList) {
            RecommendModel model = RecommendModel();
            model.id = item['program_id'];
            model.title = item['program_name'];
            model.imgUrl = item['pic_url'];
            model.userName = item['user']['uname'];
            model.avatarUrl = item['user']['pic_url'];

            newModels.add(model);
          }

          dataSourceItems.clear();
          setState(() {
            dataSourceItems.addAll(newModels);
          });
        }
      }
    }
  }
}
