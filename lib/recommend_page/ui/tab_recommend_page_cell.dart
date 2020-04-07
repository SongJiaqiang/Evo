import 'package:evo/recommend_page/model/recommend_model.dart';
import 'package:flutter/material.dart';

class TabRecommendPageCell extends StatelessWidget {
  final RecommendModel cellModel;

  const TabRecommendPageCell({Key key, @required this.cellModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 16),
      child: Column(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 16),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          cellModel.title,
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 30,
                  padding: EdgeInsets.only(left: 16),
                  child: Row(
                    children: <Widget>[
                      ClipOval(
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          child: Image.network(cellModel.avatarUrl),
                        ),
                      ),
                      SizedBox(width: 8),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.black, fontSize: 12),
                          children: <TextSpan>[
                            TextSpan(text: '来自'),
                            TextSpan(
                              text: ' ${cellModel.userName} ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: '的推荐'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: Container(
                    height: 260,
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Image.network(
                            cellModel.imgUrl,
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              height: 60,
                              padding: EdgeInsets.only(left: 16),
                              child: Center(
                                child: Container(
                                  width: 36,
                                  height: 36,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(18)),
                                  ),
                                  child: GestureDetector(
                                    child: Icon(
                                      Icons.headset,
                                      color: Colors.black,
                                    ),
                                    onTap: () {},
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 60,
                              padding: EdgeInsets.only(right: 16),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(16)),
                                    ),
                                    child: GestureDetector(
                                      child: Icon(
                                        Icons.share,
                                        color: Colors.black,
                                      ),
                                      onTap: () {},
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(16)),
                                    ),
                                    child: GestureDetector(
                                      child: Icon(
                                        Icons.favorite_border,
                                        color: Colors.redAccent,
                                      ),
                                      onTap: () {},
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
