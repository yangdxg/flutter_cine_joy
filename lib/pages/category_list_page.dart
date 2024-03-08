import 'package:flutter/material.dart';
import 'package:flutter_cine_joy/widget/movie_card_widget.dart';

/// 分类列表
class CategoryListPage extends StatefulWidget {
  const CategoryListPage({super.key});

  @override
  State<CategoryListPage> createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {},
              icon:
                  const Icon(Icons.arrow_back_rounded, color: Colors.black87));
        }),
        title: const Text(
          "分类名称",
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        itemCount: 20,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.7),
        itemBuilder: (BuildContext context, int index) {
          return const MovieCardWidget(
              "https://t7.baidu.com/it/u=245883932,1750720125&fm=193&f=GIF",
              "movieTitle");
        },
      ),
    );
  }
}
