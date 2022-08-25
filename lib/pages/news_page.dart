import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../widgets/menu_drawer.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int totalResults = 0;
  List<dynamic> articles = [];
  String errorMessage = '';
  int page = 1;
  int pageSize = 5;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  //เมื่อดึงจอลงมา
  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 700));
    setState(() {
      articles.clear(); // clear all news
      page = 1;
    });
    getData();
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 500));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    if (page < (totalResults / pageSize).ceil()) {
      if (mounted) {
        setState(() {
          page = ++page;
        });
      }
      getData();
      _refreshController.loadComplete();
    } else {
      _refreshController.resetNoData();
      _refreshController.loadNoData();
    }
  }

  Future<void> getData() async {
    var url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=th&apiKey=8d3cdfffd6904606b00cfd03100735a1&page=$page&pageSize=$pageSize');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      //print(response.body);
      var news = json.decode(response.body);
      setState(() {
        totalResults = news['totalResults']; //37
        //articles = news['articles']; //ได้ทีละ 5 ข่าว
        articles.addAll(news['articles']); //เอา Array มาต่อกัน
      });
    } else {
      setState(() {
        errorMessage = 'เกิดข้อผิดพลาดจาก Server กรุณาลองใหม่';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text('ข่าวสาร $totalResults ข่าว')
        title: totalResults > 0 ? Text('ข่าวสาร $totalResults ข่าว') : null,
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: const WaterDropHeader(),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus? mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = const Text("กำลังโหลดข้อมูล...");
            } else if (mode == LoadStatus.loading) {
              body = const CircularProgressIndicator();
            } else if (mode == LoadStatus.failed) {
              body = const Text("Load Failed!Click retry!");
            } else if (mode == LoadStatus.canLoading) {
              body = const Text("release to load more");
            } else {
              body = const Text("ไม่พบข้อมูลแล้ว");
            }
            return SizedBox(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: ListView.builder(
          itemBuilder: (context, index) => Card(
            child: Center(
              child: Text(
                '${articles[index]['title']}',
              ),
            ),
          ),
          itemExtent: 100.0,
          itemCount: articles.length,
        ),
      ),
    );
  }
}
