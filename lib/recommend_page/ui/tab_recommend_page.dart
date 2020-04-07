import 'package:evo/net/lava_api.dart';
import 'package:evo/recommend_page/model/lava_program.dart';
import 'package:flutter/material.dart';
import 'package:evo/recommend_page/model/recommend_model.dart';
import 'package:evo/recommend_page/ui/tab_recommend_page_cell.dart';
import 'package:evo/recommend_page/ui/tab_recommend_page_header.dart';
import 'package:built_collection/built_collection.dart';

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
    BuiltList<LavaProgram> dataList = await Lava.fetchRecommendPrograms();
    
    if (dataList != null && dataList.length > 0) {
      List<RecommendModel> newModels = [];
      for (LavaProgram p in dataList) {
        RecommendModel model = RecommendModel((builder) => builder
          ..id = p.programId
          ..title = p.programName
          ..imgUrl = p.picUrl
          ..userName = p.user.uname
          ..avatarUrl = p.user.picUrl);
        newModels.add(model);
      }

      dataSourceItems.clear();
      setState(() {
        dataSourceItems.addAll(newModels);
      });
    }
  }
}
