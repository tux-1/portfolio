import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              16.w.pw,
              Flexible(
                flex: 2,
                child: SizedBox(
                  height: 250,
                  child: Align(
                    alignment: AlignmentDirectional.bottomEnd,
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
