import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/presentation/providers/theme_provider.dart';

class ThemeCHangerScreen extends ConsumerWidget {
  const ThemeCHangerScreen({super.key});

  static const String name = 'theme_changer_screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Theme Changer Screen'),
          actions: [
            IconButton(
              icon: Icon(isDarkMode
                  ? Icons.light_mode_rounded
                  : Icons.dark_mode_rounded),
              onPressed: () {
                // ref.read(isDarkModeProvider.notifier).update((state) => !state);
                ref.read(themeNotifierProvider.notifier).togleDarkMode();
              },
            ),
          ],
        ),
        body: const _ThemeChangerView());
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    // final int selectedIndex = ref.watch(selectedIndexColorProvider);

    final selectedColor = ref.watch(themeNotifierProvider).selectedColor;

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];
        return RadioListTile<int>(
          title: Text(
            "Este color",
            style: TextStyle(color: color),
          ),
          subtitle: Text(
            "Este es el color ${color.value}",
            style: TextStyle(color: color),
          ),
          activeColor: color,
          value: index,
          groupValue: selectedColor,
          onChanged: (value) {
            // ref.read(selectedIndexColorProvider.notifier).state = index;
            ref.read(themeNotifierProvider.notifier).changeColorIndex(index);
          },
        );
      },
    );
  }
}
