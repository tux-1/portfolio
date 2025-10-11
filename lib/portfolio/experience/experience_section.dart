import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murad/portfolio/experience/models/experience_model.dart';
import 'package:murad/portfolio/experience/widgets/experience_row.dart';

class ExperienceSection extends StatefulWidget {
  const ExperienceSection({super.key});

  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 8.h,
      children: List.generate(
        experiences.length,
        (index) => ExperienceRow(experience: experiences[index]),
      ),
    );
  }
}
