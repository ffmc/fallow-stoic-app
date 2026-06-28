import 'package:flutter/material.dart';
import '../data/content_repository.dart';
import '../models/content.dart';
import '../services/favorites_service.dart';
import '../theme/app_theme.dart';
import 'category_detail_screen.dart';
import 'info_screen.dart';

class HomeScreen extends StatelessWidget {
  final ContentRepository repository;
  final FavoritesService favorites;
  final List<ProblemCategory> categories;
  final ValueNotifier<ThemeMode> themeMode;

  const HomeScreen({
    super.key,
    required this.repository,
    required this.favorites,
    required this.categories,
    required this.themeMode,
  });

  void _toggleTheme(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    themeMode.value =
        brightness == Brightness.dark ? ThemeMode.light : ThemeMode.dark;
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text('Fallow', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: colors.accent)),
            actions: [
              ValueListenableBuilder<ThemeMode>(
                valueListenable: themeMode,
                builder: (context, _, __) => IconButton(
                  icon: Icon(
                    isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
                    color: colors.muted,
                  ),
                  onPressed: () => _toggleTheme(context),
                ),
              ),
              IconButton(
                icon: Icon(Icons.info_outline, color: colors.muted),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const InfoScreen()),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 8),
              child: Text(
                'What are you facing?',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 28),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, i) => _CategoryRow(
                category: categories[i],
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => CategoryDetailScreen(
                      category: categories[i],
                      favorites: favorites,
                    ),
                  ),
                ),
              ),
              childCount: categories.length,
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryRow extends StatelessWidget {
  final ProblemCategory category;
  final VoidCallback onTap;

  const _CategoryRow({required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: colors.border)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.title,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: 19),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    category.blurb,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Icon(Icons.arrow_forward_ios, size: 14, color: colors.muted),
          ],
        ),
      ),
    );
  }
}
