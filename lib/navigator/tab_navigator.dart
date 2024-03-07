import 'package:flutter/material.dart';
import 'package:flutter_cine_joy/pages/explore_page.dart';
import 'package:flutter_cine_joy/pages/home_page.dart';
import 'package:flutter_cine_joy/pages/live_page.dart';
import 'package:flutter_cine_joy/pages/my_page.dart';

/// 底部Tab导航
class TabNavigator extends StatefulWidget {
  const TabNavigator({super.key});

  @override
  State<TabNavigator> createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final PageController _controller = PageController(initialPage: 0);
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        // 禁止左右滚动
        physics: const NeverScrollableScrollPhysics(),
        children: const [HomePage(), LivePage(), ExplorePage(), MyPage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _controller.jumpToPage(index);
        },
        items: [
          _bottomItem("首页", Icons.home, 0),
          _bottomItem("频道", Icons.live_tv, 1),
          _bottomItem("发现", Icons.explore, 2),
          _bottomItem("我的", Icons.account_circle, 3)
        ],
      ),
    );
  }

  _bottomItem(String title, IconData icon, int index) {
    return BottomNavigationBarItem(
        icon: Icon(icon, color: _defaultColor),
        activeIcon: Icon(
          icon,
          color: _activeColor,
        ),
        label: title);
  }
}
