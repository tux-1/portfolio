import 'dart:math';

import 'package:flutter/material.dart';

class CustomSliver extends StatefulWidget {
  const CustomSliver({super.key, required this.child});

  final Widget child;

  @override
  State<CustomSliver> createState() => _CustomSliverState();
}

class _CustomSliverState extends State<CustomSliver> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: max(24, constraints.maxWidth * 0.119),
            ),
            child: widget.child,
          );
        },
      ),
    );
  }
}
