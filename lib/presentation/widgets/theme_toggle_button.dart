import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/theme_provider.dart';

class ThemeToggleButton extends ConsumerWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final notifier = ref.read(themeModeProvider.notifier);

    return IconButton(
      icon: Icon(themeMode == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode),
      onPressed: () {
        notifier.state = themeMode == ThemeMode.dark
            ? ThemeMode.light
            : ThemeMode.dark;
      },
    );
  }
}
