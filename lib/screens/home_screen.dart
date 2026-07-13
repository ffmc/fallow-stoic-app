import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../data/content_repository.dart';
import '../models/content.dart';
import '../services/favorites_service.dart';
import '../theme/app_theme.dart';
import '../theme/tokens.dart';
import '../widgets/horizon_line.dart';
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
            title: Text('Fallow', style: Theme.of(context).textTheme.titleLarge),
            actions: [
              ValueListenableBuilder<ThemeMode>(
                valueListenable: themeMode,
                builder: (context, _, __) => IconButton(
                  icon: Icon(
                    isDark ? LucideIcons.sun : LucideIcons.moon,
                    color: colors.muted,
                  ),
                  onPressed: () => _toggleTheme(context),
                ),
              ),
              IconButton(
                icon: Icon(LucideIcons.info, color: colors.muted),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const InfoScreen()),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(Space.xl, Space.xl, Space.xl, Space.sm),
              child: Text(
                'What are you facing?',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(Space.xl, Space.xs, Space.xl, Space.sm),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) => _CategoryTile(
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
          ),
        ],
      ),
    );
  }
}

class _CategoryTile extends StatelessWidget {
  final ProblemCategory category;
  final VoidCallback onTap;

  const _CategoryTile({required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    return Semantics(
      button: true,
      child: Container(
        margin: const EdgeInsets.only(bottom: Space.md),
        child: InkWell(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(Space.xl),
            decoration: BoxDecoration(
              color: colors.surfaceRaised,
              borderRadius: BorderRadius.circular(AppRadius.lg),
              border: Border.all(color: colors.border),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category.title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: Space.xs),
                Text(
                  category.blurb,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: Space.lg),
                HorizonLine(color: colors.accent),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
