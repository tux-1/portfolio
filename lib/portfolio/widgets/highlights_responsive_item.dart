import 'package:flutter/material.dart';
import 'package:portfolio/core/config/margins.dart';
import 'package:portfolio/core/config/responsive_config.dart';

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
              16.pw,
              Flexible(
                flex: 2,
                child: ConstrainedBox(
                  constraints: constraints,
                  child: Align(
                    alignment: AlignmentDirectional.topCenter,
                    child: second,
                  ),
                ),
              ),
            ],
          );
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [first, 16.ph, second],
          );
        }
      },
    );
  }
}
