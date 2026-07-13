import 'dart:math';
import 'package:flutter/material.dart';
import '../models/content.dart';
import '../services/favorites_service.dart';
import '../theme/app_theme.dart';
import '../theme/tokens.dart';
import '../widgets/horizon_line.dart';
import '../widgets/quote_card.dart';

class CategoryDetailScreen extends StatefulWidget {
  final ProblemCategory category;
  final FavoritesService favorites;

  const CategoryDetailScreen({
    super.key,
    required this.category,
    required this.favorites,
  });

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  late final String _prompt;
  late final List<Quote> _quotes;

  @override
  void initState() {
    super.initState();
    final prompts = widget.category.prompts;
    _prompt = prompts[Random().nextInt(prompts.length)];
    _quotes = List.of(widget.category.quotes)..shuffle();
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(widget.category.title)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(Space.xl, Space.sm, Space.xl, Space.xl2),
        children: [
          Container(
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
                  'REFLECT',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: colors.accent,
                      ),
                ),
                const SizedBox(height: Space.sm),
                Text(
                  _prompt,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: colors.text,
                      ),
                ),
                const SizedBox(height: Space.lg),
                HorizonLine(color: colors.accent),
              ],
            ),
          ),
          const SizedBox(height: Space.xl),
          Text(
            'From the Stoics',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: Space.md),
          ..._quotes.map(
            (q) => QuoteCard(quote: q, favorites: widget.favorites),
          ),
        ],
      ),
    );
  }
}
