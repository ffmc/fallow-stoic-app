import 'package:flutter/material.dart';
import '../data/content_repository.dart';
import '../services/favorites_service.dart';
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
                padding: const EdgeInsets.all(40),
                child: Text(
                  'Bookmark a passage and it will wait for you here.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            );
          }
          return ListView(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
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
