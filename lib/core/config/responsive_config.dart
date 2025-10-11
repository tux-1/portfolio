class ResponsiveConfig {
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 1024;
  static const double desktopBreakpoint = 1440;

  static bool isMobile(double width) => width < mobileBreakpoint;
  static bool isTablet(double width) => 
      width >= mobileBreakpoint && width < desktopBreakpoint;
  static bool isDesktop(double width) => width >= desktopBreakpoint;
}