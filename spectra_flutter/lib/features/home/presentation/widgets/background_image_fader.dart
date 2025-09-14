import 'package:flutter/material.dart';

class BackgroundImageFader extends StatefulWidget {
  final List<String> imageUrls;
  final Duration fadeDuration;
  final Duration displayDuration;

  const BackgroundImageFader({super.key, 
    required this.imageUrls,
    this.fadeDuration = const Duration(seconds: 2),
    this.displayDuration = const Duration(seconds: 5),
  });

  @override
  BackgroundImageFaderState createState() => BackgroundImageFaderState();
}

class BackgroundImageFaderState extends State<BackgroundImageFader> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _startImageRotation();
  }

  void _startImageRotation() {
    Future.delayed(widget.displayDuration, () {
      if (!mounted) return;
      setState(() {
        _currentIndex = (_currentIndex + 1) % widget.imageUrls.length;
      });
      _startImageRotation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: widget.fadeDuration,
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeOut,
      layoutBuilder: (currentChild, previousChildren) => Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ...previousChildren,
          if (currentChild != null) currentChild,
        ],
      ),
      child: Image.asset(
        widget.imageUrls[_currentIndex],
        key: ValueKey(_currentIndex),
        fit: BoxFit.cover,
        width: double.maxFinite,
      ),
    );
  }
}
