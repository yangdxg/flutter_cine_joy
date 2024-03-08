import 'package:flutter/material.dart';
import 'package:flutter_cine_joy/widget/banner_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final banners = [
    'https://t7.baidu.com/it/u=1732966997,2981886582&fm=193&f=GIF',
    'https://t7.baidu.com/it/u=1785207335,3397162108&fm=193&f=GIF',
    'https://t7.baidu.com/it/u=2581522032,2615939966&fm=193&f=GIF',
    'https://t7.baidu.com/it/u=245883932,1750720125&fm=193&f=GIF'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [BannerWidget(banners)],
      ),
    );
  }
}
