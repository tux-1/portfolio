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
      child: Center(
        child: Container(
          width: 767,
          padding: EdgeInsets.symmetric(horizontal: 28),
          child: widget.child,
        ),
      ),
    );
  }
}
