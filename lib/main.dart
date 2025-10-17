import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:portfolio/core/theme/theme.dart';
import 'package:portfolio/core/theme/theme_controller.dart';
import 'package:portfolio/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final platformBrightness = MediaQuery.of(context).platformBrightness;
    final isSystemDark = platformBrightness == Brightness.dark;
    return ScreenUtilInit(
      enableScaleText: () => true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ThemeCubit>(
            create: (context) => ThemeCubit(isSystemDark),
          ),
        ],
        child: BlocBuilder<ThemeCubit, bool>(
          builder: (context, isDarkTheme) => MaterialApp(
            title: 'Murad Mohamed',
            debugShowCheckedModeBanner: false,

            // Theme Configuration
            theme: ThemeConfig.lightTheme,
            darkTheme: ThemeConfig.darkTheme,
            themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,

            // Localization Configuration
            locale: context.locale,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,

            home: const HomePage(),
          ),
        ),
      ),
    );
  }
}
