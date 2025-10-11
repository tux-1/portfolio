import 'package:flutter_bloc/flutter_bloc.dart';

/// A simple Cubit to manage the application's theme state.
///
/// The state is a boolean value:
/// - `false`: Represents a light theme.
/// - `true`: Represents a dark theme.
class ThemeCubit extends Cubit<bool> {
  final bool initialIsDarkTheme;
  ThemeCubit(this.initialIsDarkTheme) : super(initialIsDarkTheme);

  /// Toggles the current theme from light to dark, or dark to light.
  void toggleTheme() {
    emit(!state);
  }

  /// A getter to provide a more readable way to check if the theme is dark.
  bool get isDarkTheme => state;
}
