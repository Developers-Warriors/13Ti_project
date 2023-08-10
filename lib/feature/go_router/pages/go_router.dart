import 'package:abstracts/feature/go_router/widgets/navigatorKey.dart';
import 'package:flutter/material.dart';

class GORouters extends StatelessWidget {
  const GORouters({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: FilledButton(
              onPressed: () {
                navigatorKey!.currentState!.pushReplacementNamed('OneScreens');
              },
              child: Text('в перед'),
            ),
          )
        ],
      ),
    );
  }
}

class OneScreens extends StatelessWidget {
  const OneScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OneScreens'),
        leading: IconButton(
          onPressed: () {
            navigatorKey!.currentState!.popAndPushNamed('HomeScreens');
          },
          icon: Icon(Icons.keyboard_double_arrow_left_rounded),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: FilledButton(
              onPressed: () {
                navigatorKey!.currentState!.pushReplacementNamed('TwoScreens');
              },
              child: Text('в TwoScreens'),
            ),
          ),
          // FilledButton(
          //   onPressed: () {
          //     navigatorKey!.currentState!.pop('HomeScreens');
          //   },
          //   child: Text('назад'),
          // )
        ],
      ),
    );
  }
}

class TwoScreens extends StatelessWidget {
  const TwoScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TwoScreens'),
        leading: IconButton(
            onPressed: () {
              navigatorKey!.currentState!.popAndPushNamed('OneScreens');
            },
            icon: Icon(Icons.arrow_left_rounded)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: FilledButton(
              onPressed: () {
                // navigatorKey!.currentState!.pushReplacementNamed('ThreeScreens');
              },
              child: Text('в ThreeScreens'),
            ),
          ),
        ],
      ),
    );
  }
}

class ThreeScreens extends StatelessWidget {
  const ThreeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('ThreeScreens'),
          leading: IconButton(
              onPressed: () {
                navigatorKey!.currentState!.pop('TwoScreens');
              },
              icon: Icon(Icons.chevron_left_rounded))),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: FilledButton(
              onPressed: () {},
              child: Text('ThreeScreens'),
            ),
          ),
          // FilledButton(
          //     onPressed: () {
          //       navigatorKey!.currentState!.pop('TwoScreens');
          //     },
          //     child: Text('в TwoScreens')),
        ],
      ),
    );
  }
}
