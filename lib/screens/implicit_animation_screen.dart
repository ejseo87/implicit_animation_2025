import 'package:flutter/material.dart';

class ImplicitAnimationScreen extends StatefulWidget {
  const ImplicitAnimationScreen({super.key});

  @override
  State<ImplicitAnimationScreen> createState() =>
      _ImplicitAnimationScreenState();
}

class _ImplicitAnimationScreenState extends State<ImplicitAnimationScreen> {
  final Duration _duration = Duration(milliseconds: 1000);
  bool _rectangle = false;
  bool _white = false;

  void _onAnimationTap() {
    setState(() {
      _rectangle = !_rectangle;
      if (_rectangle) {
        _white = true;
      } else {
        _white = false;
      }
    });
    //_infiniteLoopingAnimation();
  }

  /*  void _infiniteLoopingAnimation() {
    Future.delayed(_duration, () {
      _onAnimationTap();
    });
  }
 */
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: _rectangle ? Colors.black : Colors.white,
      appBar: AppBar(
        title: Text(
          "Implicit Animations",
          style: TextStyle(color: _rectangle ? Colors.white : Colors.black),
        ),
        backgroundColor: _rectangle ? Colors.black : Colors.white,
      ),
      body: Center(
        child: GestureDetector(
          onTap: _onAnimationTap,
          child: Container(
            //clipBehavior: Clip.hardEdge,
            width: size.width * 0.6,
            height: size.width * 0.6,
            decoration: BoxDecoration(
              color: Colors.red,
              shape: _rectangle ? BoxShape.rectangle : BoxShape.circle,
            ),
            child: AnimatedAlign(
              alignment: _white ? Alignment.topRight : Alignment.topLeft,
              duration: _duration,
              onEnd: _onAnimationTap,
              child: Container(
                width: 10,
                height: size.width * 0.6,
                color: _white ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
