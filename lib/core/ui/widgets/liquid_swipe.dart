import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class LiquidSwipeWidgets extends StatelessWidget {
  LiquidSwipeWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LiquidSwipe(
          preferDragFromRevealedArea: true,
          fullTransitionValue: 300,
          enableSideReveal: true,
          enableLoop: false,
          positionSlideIcon: 0.5,
          waveType: WaveType.liquidReveal,
          slideIconWidget: Icon(Icons.arrow_back_ios, size: 20),
          pages: pages),
    );
  }

  final pages = [
    Container(
        child: Center(
          child: IconButton.outlined(
              onPressed: () {
                print('ONE');
              },
              icon: Icon(Icons.panorama_fisheye_sharp)),
        ),
        color: Colors.amber),
    Container(
        child: Center(
          child: IconButton.outlined(
              onPressed: () {
                print('TWO');
              },
              icon: Icon(Icons.panorama_fisheye_sharp)),
        ),
        color: Colors.purple),
    Container(
        child: Center(
          child: IconButton.outlined(
              onPressed: () {
                print('THREE');
              },
              icon: Icon(Icons.add)),
        ),
        color: Colors.greenAccent),
  ];
}
