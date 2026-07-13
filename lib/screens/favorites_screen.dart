import 'package:flutter/material.dart';
import '../data/content_repository.dart';
import '../services/favorites_service.dart';
import '../theme/tokens.dart';
import '../widgets/quote_card.dart';

class FavoritesScreen extends StatelessWidget {
  final ContentRepository repository;
  final FavoritesService favorites;

  const FavoritesScreen({
    super.key,
    required this.repository,
    required this.favorites,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Saved')),
      body: AnimatedBuilder(
        animation: favorites,
        builder: (context, _) {
          final quotes = repository.quotesByIds(favorites.ids);
          if (quotes.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(Space.xl2),
                child: Text(
                  'Bookmark a passage and it will wait for you here.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            );
          }
          return ListView(
            padding: const EdgeInsets.fromLTRB(Space.xl, Space.md, Space.xl, Space.xl2),
            children: [
              for (final q in quotes)
                QuoteCard(quote: q, favorites: favorites),
            ],
          );
        },
      ),
    );
  }
}
