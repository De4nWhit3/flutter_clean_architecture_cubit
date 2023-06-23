import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/3_application/pages/advice/advice_page.dart';
import 'package:flutter_clean_architecture/theme.dart';
import 'package:provider/provider.dart';

import '3_application/core/services/theme_service.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeService(),
    child: const CleanApp(),
  ));
}

class CleanApp extends StatelessWidget {
  const CleanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(
      builder: (context, themeService, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Clean App',
          themeMode:
              themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          home: const AdviserPageWrapperProvider(),
        );
      },
    );
  }
}
