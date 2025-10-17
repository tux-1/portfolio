import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/core/config/margins.dart';
import 'package:portfolio/portfolio/projects/models/project_model.dart';
import 'package:portfolio/portfolio/widgets/overlay_effect.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectRow extends StatelessWidget {
  final ProjectModel project;
  const ProjectRow({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return OverlayEffect(
      targetWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                project.name,
                style: TextStyle(
                  fontSize: textTheme.bodyLarge?.fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Spacer(),
              if (project.codeUrl != null)
                TextButton.icon(
                  icon: FaIcon(FontAwesomeIcons.code),
                  onPressed: () async {
                    final Uri url = Uri.parse(project.codeUrl!);
                    if (!await launchUrl(url)) {
                      // Optionally show a snackbar or log an error if the URL can't be launched
                      throw Exception('Could not launch $url');
                    }
                  },
                  label: Text('code'.tr()),
                  style: TextButton.styleFrom(
                    visualDensity: VisualDensity(vertical: -4),
                  ),
                ),
            ],
          ),
          4.h.ph,
          Text(
            project.shortDescription.tr(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: textTheme.bodyLarge?.fontSize,
              color: theme.colorScheme.onSecondary,
            ),
          ),
        ],
      ),
      // Pass the widget you want to float and follow the cursor
      previewImage: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12.h,
        children: [
          Text(
            project.name,
            style: TextStyle(
              fontSize: textTheme.bodyLarge?.fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            project.longDescription.tr(),
            style: TextStyle(
              fontSize: textTheme.bodyLarge?.fontSize,
              color: theme.colorScheme.onSecondary,
            ),
          ),
          if (project.preview != null)
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: FittedBox(
                fit: BoxFit.contain,
                child: SizedBox(
                  width: 960,
                  height: 740,
                  child: project.preview!,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
