import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatefulWidget {
  final List<String> banners;

  const BannerWidget(this.banners, {super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final CarouselController _controller = CarouselController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 轮播
        CarouselSlider(
            items:
                widget.banners.map((banner) => _bannerImage(banner)).toList(),
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                height: 160,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                })),
        // 底部指示器
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: _indicator(),
        )
      ],
    );
  }

  Widget _bannerImage(String banner) {
    return GestureDetector(
      // banner点击
      onTap: () {},
      child: Image.network(
        banner,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
    );
  }

  _indicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget.banners.asMap().entries.map((banner) {
        return GestureDetector(
          onTap: () => _controller.animateToPage(banner.key),
          child: Container(
            width: 6,
            height: 6,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white
                    .withOpacity(_current == banner.key ? 0.9 : 0.4)),
          ),
        );
      }).toList(),
    );
  }
}
