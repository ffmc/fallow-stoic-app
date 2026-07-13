import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../models/content.dart';
import '../services/favorites_service.dart';
import '../theme/app_theme.dart';
import '../theme/tokens.dart';
import 'horizon_line.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  final FavoritesService favorites;

  const QuoteCard({super.key, required this.quote, required this.favorites});

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    return AnimatedBuilder(
      animation: favorites,
      builder: (context, _) {
        final fav = favorites.isFavorite(quote.id);
        return Container(
          margin: const EdgeInsets.only(bottom: Space.lg),
          padding: const EdgeInsets.fromLTRB(Space.xl, Space.xl, Space.md, Space.lg),
          decoration: BoxDecoration(
            color: colors.surfaceRaised,
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: colors.border),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(LucideIcons.quote, size: 18, color: colors.accent),
                  const Spacer(),
                  _BookmarkButton(
                    active: fav,
                    accent: colors.accent,
                    muted: colors.subtle,
                    onPressed: () => favorites.toggle(quote.id),
                  ),
                ],
              ),
              Text(
                quote.text,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: Space.md),
              HorizonLine(color: colors.accent),
              const SizedBox(height: Space.sm),
              Text(
                quote.citation,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _BookmarkButton extends StatelessWidget {
  final bool active;
  final Color accent;
  final Color muted;
  final VoidCallback onPressed;

  const _BookmarkButton({
    required this.active,
    required this.accent,
    required this.muted,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: active ? 'Remove from saved' : 'Save quote',
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onPressed,
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: active ? accent.withValues(alpha: 0.12) : Colors.transparent,
          ),
          child: Icon(
            active ? LucideIcons.bookmark500 : LucideIcons.bookmark,
            color: active ? accent : muted,
            size: 20,
          ),
        ),
      ),
    );
  }
}
