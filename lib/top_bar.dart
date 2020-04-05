import 'package:flutter/material.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  // 标题
  final String title;
  // 右侧功能按钮组合
  final List<Widget> children;
  // 标题点击事件
  final Function onTitleTapped;
  // 指示器长度
  final int indicatorLength;
  // 指示器下标
  final int indicatorIndex;

  @override
  final Size preferredSize;

  TopBar({
    @required this.title, // title为必须属性
    this.children,
    this.onTitleTapped,
    @required this.indicatorLength,
    this.indicatorIndex = 0,
  }) : preferredSize = Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 16),
                  child: GestureDetector(
                    onTap: onTitleTapped,
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Row(children: children != null ? children : []),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 16),
            height: 4,
            child: _buildIndicator(indicatorLength, indicatorIndex, 4),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildIndicator(int length, int index, double height) {
    double normalWidth = height;
    double maxWidth = normalWidth * 4;

    List<Widget> children = [];
    for (var i = 0; i < length; i++) {
      double itemWidth = index == i ? maxWidth : normalWidth;
      double itemHeight = normalWidth;
      double itemSpacing = normalWidth;

      // add spacing
      if (i > 0) {
        children.add(SizedBox(width: itemSpacing));
      }

      // add item
      var item = Container(
        width: itemWidth,
        height: itemHeight,
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.all(Radius.circular(itemHeight / 2)),
        ),
      );
      children.add(item);
    }
    return Row(children: children);
  }
}
