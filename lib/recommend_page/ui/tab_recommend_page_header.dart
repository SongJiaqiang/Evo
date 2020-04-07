
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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