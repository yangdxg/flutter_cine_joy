import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [_background(), _content()],
      ),
    );
  }

  _background() {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blueAccent, Colors.white])),
    );
  }

  _content() {
    return Positioned.fill(
      child: ListView(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: _topBack(),
          ),

        ],
      ),
    );
  }

  _topBack() {
    return const Padding(
        padding: EdgeInsets.all(12),
        child: Icon(Icons.arrow_back_rounded, size: 22, color: Colors.white));
  }
}
