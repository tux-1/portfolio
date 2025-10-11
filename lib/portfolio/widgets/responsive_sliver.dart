import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murad/core/config/responsive_config.dart';

class CustomSliver extends StatefulWidget {
  const CustomSliver({super.key, required this.child});

  final Widget child;

  @override
  State<CustomSliver> createState() => _CustomSliverState();
}

class _CustomSliverState extends State<CustomSliver> {
  double horizontalPadding = 54;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    if (size.width > ResponsiveConfig.mobileBreakpoint &&
        horizontalPadding != 54) {
      setState(() {
        horizontalPadding = 54;
      });
    }
    if (size.width < ResponsiveConfig.mobileBreakpoint &&
        horizontalPadding != 24) {
      setState(() {
        horizontalPadding = 24;
      });
    }
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding.w),
      sliver: SliverToBoxAdapter(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: size.width - horizontalPadding * 2.w,
            maxWidth: size.width - horizontalPadding * 2.w,
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
