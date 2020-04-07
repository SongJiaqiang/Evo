import 'package:evo/recommend_page/ui/tab_recommend_page.dart';
import 'package:evo/top_bar.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _currentIndex;
  String _topBarTitle;

  final List<String> _topBarTitles = ['私人兆赫', '今天'];

  @override
  void initState() {
    super.initState();

    _currentIndex = 1;
    _topBarTitle = _topBarTitles[_currentIndex];

    _tabController = TabController(length: 2, vsync: this, initialIndex: _currentIndex);
    _tabController.addListener(_handleTabController);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Scaffold(
        appBar: TopBar(
          title: _topBarTitle,
          onTitleTapped: () {
            print('Tap title');
          },
          indicatorLength: 2,
          indicatorIndex: _currentIndex,
          children: <Widget>[
            IconButton(
              iconSize: 30,
              icon: Icon(Icons.search, size: 24),
              onPressed: () {},
            ),
            IconButton(
              iconSize: 30,
              icon: Icon(Icons.person_outline, size: 24),
              onPressed: () {},
            ),
          ],
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Container(
              color: Colors.redAccent,
              child: Center(
                child: Text(
                  _topBarTitles[0],
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            TabRecommendPage(),
          ],
        ),
      ),
    );
  }

  void _handleTabController() {
    final int index = _tabController.index;

    setState(() {
      _currentIndex = index;
      _topBarTitle = _topBarTitles[index];
    });
  }
}
