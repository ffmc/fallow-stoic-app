import 'package:flutter/material.dart';
import '../models/content.dart';
import '../services/favorites_service.dart';
import '../theme/app_theme.dart';

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
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.fromLTRB(18, 18, 12, 14),
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: colors.border),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                quote.text,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 16,
                      height: 1.6,
                    ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      quote.citation,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: colors.accent,
                            fontSize: 13,
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                  ),
                  IconButton(
                    visualDensity: VisualDensity.compact,
                    icon: Icon(
                      fav ? Icons.bookmark : Icons.bookmark_border,
                      color: fav ? colors.accent : colors.muted,
                      size: 22,
                    ),
                    onPressed: () => favorites.toggle(quote.id),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
