import 'package:flutter/material.dart';
import 'package:murad/core/config/margins.dart';
import 'package:murad/core/config/responsive_config.dart';

class HighlightsResponsiveItem extends StatelessWidget {
  final Widget first;
  final Widget second;

  const HighlightsResponsiveItem({
    super.key,
    required this.first,
    required this.second,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > ResponsiveConfig.mobileBreakpoint) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(flex: 4, child: first),
              Spacer(),

              Align(alignment: AlignmentDirectional.bottomEnd, child: second),
            ],
          );
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              first,
              12.ph,
              Align(alignment: AlignmentDirectional.bottomEnd, child: second),
            ],
          );
        }
      },
    );
  }
}
