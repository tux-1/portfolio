import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/config/margins.dart';
import 'package:portfolio/core/config/responsive_config.dart';
import 'package:portfolio/portfolio/experience/models/experience_model.dart';
import 'package:portfolio/portfolio/widgets/overlay_effect.dart';

class ExperienceRow extends StatelessWidget {
  final ExperienceModel experience;
  const ExperienceRow({super.key, required this.experience});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final size = MediaQuery.sizeOf(context);
    return OverlayEffect(
      targetWidget: size.width > ResponsiveConfig.tabletBreakpoint
          ? Row(
              children: [
                Text(
                  experience.position.tr(),
                  style: TextStyle(
                    fontSize: textTheme.bodyLarge?.fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Text(
                    " — ${experience.company.tr()}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: textTheme.bodyLarge?.fontSize,
                      color: theme.colorScheme.onSecondary,
                    ),
                  ),
                ),

                Text(
                  experience.fromTo,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: textTheme.bodyMedium?.fontSize,
                    color: theme.colorScheme.onSecondary,
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  experience.position.tr(),
                  style: TextStyle(
                    fontSize: textTheme.bodyLarge?.fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  experience.company,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: textTheme.bodyLarge?.fontSize,
                    color: theme.colorScheme.onSecondary,
                  ),
                ),

                Text(
                  experience.fromTo,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: textTheme.bodyMedium?.fontSize,
                    color: theme.colorScheme.onSecondary,
                  ),
                ),
              ],
            ),
      // Pass the widget you want to float and follow the cursor
      previewImage: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            experience.position.tr(),
            style: TextStyle(
              fontSize: textTheme.bodyLarge?.fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          4.h.ph,
          Text(
            experience.company.tr(),
            style: TextStyle(
              fontSize: textTheme.bodyLarge?.fontSize,
              color: theme.colorScheme.onSecondary,
            ),
          ),
          8.h.ph,
          Text(
            experience.description.tr(),
            style: TextStyle(fontSize: textTheme.bodyLarge?.fontSize),
          ),
        ],
      ),
    );
  }
}
