import 'package:flutter/material.dart';
import 'package:flutter_cine_joy/widget/movie_card_widget.dart';

/// 分类列表
class CategoryListPage extends StatefulWidget {
  const CategoryListPage({super.key});

  @override
  State<CategoryListPage> createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {
  List<String> movies = [];
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    for (int i = 0; i < 20; i++) {
      movies.add("影视$i");
    }
    _controller.addListener(() {
      // Scroll滚动到最大值（最底部位置）
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        _loadData();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Builder(builder: (context) {
            return IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back_rounded,
                    color: Colors.black87));
          }),
          title: const Text(
            "分类名称",
            style: TextStyle(fontSize: 18),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: _handleRefresh,
          child: GridView.builder(
            controller: _controller,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            itemCount: movies.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.7),
            itemBuilder: (BuildContext context, int index) {
              return MovieCardWidget(
                  "https://t7.baidu.com/it/u=245883932,1750720125&fm=193&f=GIF",
                  movies[index]);
            },
          ),
        ));
  }

  Future<void> _handleRefresh() async {
    print("刷新");
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      // 刷新数据
      movies = movies.reversed.toList();
    });
  }

  Future<void> _loadData() async {
    print("加载更多");
    await Future.delayed(const Duration(seconds: 2));
    List<String> newData = ["新增数据1", "新增数据2", "新增数据3"];
    movies.addAll(newData);
    setState(() {
      movies;
    });
  }
}
