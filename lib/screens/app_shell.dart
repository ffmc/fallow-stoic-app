import 'package:flutter/material.dart';
import '../data/content_repository.dart';
import '../models/content.dart';
import '../services/favorites_service.dart';
import '../theme/app_theme.dart';
import 'favorites_screen.dart';
import 'home_screen.dart';

class AppShell extends StatefulWidget {
  final ContentRepository repository;
  final FavoritesService favorites;
  final List<ProblemCategory> categories;
  final ValueNotifier<ThemeMode> themeMode;

  const AppShell({
    super.key,
    required this.repository,
    required this.favorites,
    required this.categories,
    required this.themeMode,
  });

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: [
          HomeScreen(
            repository: widget.repository,
            favorites: widget.favorites,
            categories: widget.categories,
            themeMode: widget.themeMode,
          ),
          FavoritesScreen(
            repository: widget.repository,
            favorites: widget.favorites,
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        backgroundColor: colors.surface,
        indicatorColor: colors.accent.withValues(alpha: 0.15),
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home_outlined, color: colors.muted),
            selectedIcon: Icon(Icons.home, color: colors.accent),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.bookmark_border, color: colors.muted),
            selectedIcon: Icon(Icons.bookmark, color: colors.accent),
            label: 'Saved',
          ),
        ],
      ),
    );
  }
}
