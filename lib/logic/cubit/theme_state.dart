part of 'theme_cubit.dart';

class ThemeState {
  final bool isSystem;
  final bool isLight;
  final Lang lang;
  ThemeState({
    this.isSystem = false,
    this.isLight = false,
    this.lang = Lang.TM,
  });

  ThemeState copyWith({
    bool? isSystem,
    bool? isLight,
    Lang? lang,
  }) {
    return ThemeState(
      isSystem: isSystem ?? this.isSystem,
      isLight: isLight ?? this.isLight,
      lang: lang ?? this.lang,
    );
  }
}
