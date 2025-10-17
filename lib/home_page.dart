import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/core/config/locale_helper.dart';
import 'package:portfolio/core/config/margins.dart';
import 'package:portfolio/core/config/smooth_scroll_controller.dart';
import 'package:portfolio/core/theme/theme_controller.dart';
import 'package:portfolio/portfolio/experience/experience_section.dart';
import 'package:portfolio/portfolio/projects/projects_section.dart';
import 'package:portfolio/portfolio/widgets/cursor_follower.dart';
import 'package:portfolio/portfolio/widgets/lift_effect.dart';
import 'package:portfolio/portfolio/widgets/responsive_sliver.dart';
import 'package:portfolio/portfolio/widgets/highlights_responsive_item.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scrollController = SmoothScrollController();
  final projectsKey = GlobalKey();

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      // Optionally show a snackbar or log an error if the URL can't be launched
      throw Exception('Could not launch $url');
    }
  }

  void _scrollToTarget(GlobalKey targetKey) {
    final RenderBox? renderBox =
        targetKey.currentContext?.findRenderObject() as RenderBox?;

    if (renderBox == null) {
      // Safety check: key might not be mounted yet
      return;
    }

    // Get the position of the target widget relative to the entire screen
    final offset = renderBox.localToGlobal(Offset.zero);

    // Calculate the actual scroll offset.
    // We subtract the current scroll position of the controller
    // from the target's vertical position (offset.dy).
    final double scrollOffset = offset.dy + scrollController.offset;

    const double padding = 20.0;

    // 4. Animate the CustomScrollView
    scrollController.animateTo(
      scrollOffset - padding,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<ThemeCubit>().isDarkTheme;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      body: GradientCursorFollower(
        content: CustomScrollView(
          controller: scrollController,
          scrollBehavior: CupertinoScrollBehavior(),
          slivers: [
            SliverAppBar(
              floating: true,
              surfaceTintColor: Colors.transparent,
              backgroundColor: theme.colorScheme.inversePrimary,
              title: Text('Murad Mohamed'.tr()),

              actionsPadding: EdgeInsets.symmetric(horizontal: 12),

              actions: [
                TextButton(
                  onPressed: () {
                    _scrollToTarget(projectsKey);
                  },
                  child: Text("Projects".tr()),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Let's talk".tr()),
                ),
                TextButton(
                  onPressed: () async {
                    await LocaleHelper.switchLocale(context);
                  },
                  child: Text("switch_language".tr()),
                ),

                IconButton(
                  onPressed: () {
                    context.read<ThemeCubit>().toggleTheme();
                  },
                  icon: Icon(
                    isDarkMode ? Icons.sunny : Icons.nightlight_outlined,
                  ),
                ),
              ],
            ),
            48.sliverH,
            CustomSliver(
              child: Text(
                'Murad Mohamed'.tr(),
                textAlign: TextAlign.start,
                style: textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            8.sliverH,

            CustomSliver(
              child: Text(
                'Mobile Applications Developer based in Maadi, Egypt'.tr(),
                textAlign: TextAlign.start,
                style: textTheme.headlineSmall,
              ),
            ),
            12.sliverH,

            CustomSliver(
              child: Text(
                'As an experience mobile applications developer, I create custom, high quality, and performant mobile applications that are fun to use.'
                    .tr(),
                textAlign: TextAlign.start,
                style: textTheme.bodyLarge,
              ),
            ),
            12.sliverH,
            CustomSliver(
              child: Text(
                'If you are hiring, reach out via email!'.tr(),
                textAlign: TextAlign.start,
                style: textTheme.bodyLarge,
              ),
            ),
            12.sliverH,
            CustomSliver(
              child: Wrap(
                spacing: 6.w,
                children: [
                  TextButton.icon(
                    icon: FaIcon(FontAwesomeIcons.github),
                    onPressed: () => _launchUrl('https://github.com/tux-1'),
                    label: Text('GitHub'),
                  ),
                  TextButton.icon(
                    icon: FaIcon(FontAwesomeIcons.linkedin),
                    onPressed: () => _launchUrl(
                      'https://www.linkedin.com/in/mourad-mohamed/',
                    ),
                    label: Text('LinkedIn'),
                  ),
                  TextButton.icon(
                    icon: FaIcon(Icons.email_outlined),
                    onPressed: () =>
                        _launchUrl('mailto:murad.hafez2@gmail.com'),
                    label: Text('murad.hafez2@gmail.com'),
                  ),
                ],
              ),
            ),

            24.sliverH,
            CustomSliver(
              child: RichText(
                text: TextSpan(
                  style: textTheme.bodyLarge,
                  children: [
                    TextSpan(
                      text: 'Highlights'.tr(),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            16.sliverH,
            CustomSliver(
              child: LiftEffect(
                onPressed: () {
                  _launchUrl('https://github.com/tux-1/easy-attend');
                },
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: HighlightsResponsiveItem(
                    first: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('EasyAttend', style: textTheme.bodyLarge),
                        12.ph,
                        Text(
                          'A mobile application designed to simplify attendance tracking for hosts and attendees. The app enables hosts to generate a unique QR code for a specific event, which attendees can then scan to register their presence. This provides a secure, real-time, and two-factor registration system.'
                              .tr(),
                          style: textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    second: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.asset(
                        'assets/images/easyattend.jpg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            16.sliverH,
            CustomSliver(
              child: LiftEffect(
                onPressed: () {
                  _launchUrl('https://github.com/tux-1/on_my_way');
                },
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: HighlightsResponsiveItem(
                    first: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('OnMyWay', style: textTheme.bodyLarge),
                        12.ph,
                        Text(
                          'An e-commerce application with a combined focus on ride-hailing and ordering food/groceries. It aims to provide a platform where users can book rides, order meals from restaurants, and purchase groceries, all within a single app.'
                              .tr(),
                          style: textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    second: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.asset(
                        'assets/images/onmyway.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            24.sliverH,
            CustomSliver(
              child: RichText(
                key: projectsKey,
                text: TextSpan(
                  style: textTheme.bodyLarge,
                  children: [
                    TextSpan(
                      text: 'Projects'.tr(),

                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: ' — hover!'.tr(),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: textTheme.bodyLarge?.color?.withAlpha(
                          (255 * 0.55).floor(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            16.sliverH,
            CustomSliver(child: ProjectsSection()),

            24.sliverH,
            CustomSliver(
              child: Text(
                'Experience'.tr(),
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            16.sliverH,
            CustomSliver(child: ExperienceSection()),

            SliverToBoxAdapter(child: 48.ph),
          ],
        ),
      ),
    );
  }
}
