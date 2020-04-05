import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TabRecommendPage extends StatefulWidget {
  @override
  _TabRecommendPageState createState() => _TabRecommendPageState();
}

class _TabRecommendPageState extends State<TabRecommendPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 20,
        itemBuilder: (_, index) {
          if (index == 0) {
            return TabRecommendPageHeader();
          } else {
            return TabRecommendPageCell();
          }
        });
  }
}

class TabRecommendPageCell extends StatelessWidget {
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
                          '我想和你虚度时光',
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
                          child: Image.network(
                              'https://img9.doubanio.com/icon/ul129958703-1.jpg'),
                        ),
                      ),
                      SizedBox(width: 8),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.black, fontSize: 12),
                          children: <TextSpan>[
                            TextSpan(text: '来自'),
                            TextSpan(
                              text: ' Evo官方 ',
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
                            'https://p2.music.126.net/PJz3X_y5Il564dV27jHQeg==/2535473815844119.jpg',
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

class TabRecommendPageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ClipRRect(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        child: Container(
          // height: 130,
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: Image.network(
                  'https://hbimg.huabanimg.com/dd618f5006aaff178eaa2a1aae563fd29736a633dcd76-yBwuSb_fw658',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                child: Container(
                  height: 130,
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '每日私享歌单',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      Text(
                        dayOfWeekString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        dateString(),
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String dateString() {
    final DateTime now = DateTime.now();
    return DateFormat('yyyy.MM.dd').format(now);
  }

  String dayOfWeekString() {
    final DateTime now = DateTime.now();
    return DateFormat.E().format(now);
  }
}
