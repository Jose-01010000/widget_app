import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider<bool>((ref) => false);

// Listado de colores inmutables
final colorListProvider = Provider((ref) => colorList);

// Color seleccionado
final selectedIndexColorProvider = StateProvider<int>((ref) => 0);

// Objeto de tipo AppTheme
final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

// Puede tener el nombre controller o notifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  // El estado inicial es el tema por defecto (AppTheme())
  ThemeNotifier() : super(AppTheme());

  // Cambia el tema
  void togleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
