import 'package:flutter/material.dart';

import '../services/view.dart';

class ScreenContainer extends StatelessWidget {
  const ScreenContainer({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = getHeightStatusBar(context);
    
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: statusBarHeight + 24,
          left: 24,
          right: 24,
          bottom: 24,
        ),
        color: Colors.white,
        child: Column(
          children: children,
        )
      )
    );
  }
}