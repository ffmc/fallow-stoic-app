import 'package:flutter/material.dart';
import 'data/content_repository.dart';
import 'models/content.dart';
import 'screens/app_shell.dart';
import 'services/favorites_service.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const FallowApp());
}

class FallowApp extends StatefulWidget {
  const FallowApp({super.key});

  @override
  State<FallowApp> createState() => _FallowAppState();
}

class _FallowAppState extends State<FallowApp> {
  final _repository = ContentRepository();
  final _favorites = FavoritesService();
  final _themeMode = ValueNotifier(ThemeMode.system);
  late final Future<List<ProblemCategory>> _bootstrap = _load();

  Future<List<ProblemCategory>> _load() async {
    await _favorites.load();
    return _repository.load();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: _themeMode,
      builder: (context, mode, _) => MaterialApp(
        title: 'Fallow',
        debugShowCheckedModeBanner: false,
        theme: buildLightTheme(),
        darkTheme: buildDarkTheme(),
        themeMode: mode,
        home: FutureBuilder<List<ProblemCategory>>(
          future: _bootstrap,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }
            return AppShell(
              repository: _repository,
              favorites: _favorites,
              categories: snapshot.data!,
              themeMode: _themeMode,
            );
          },
        ),
      ),
    );
  }
}
