import 'package:flutter/material.dart';

class MovieCardWidget extends StatelessWidget {
  final String coverImg;
  final String movieTitle;

  const MovieCardWidget(this.coverImg, this.movieTitle, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          coverImg,
          height: 120,
          fit: BoxFit.cover,
        ),
        Text(movieTitle)
      ],
    );
  }
}
