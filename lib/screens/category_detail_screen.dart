import 'dart:math';
import 'package:flutter/material.dart';
import '../models/content.dart';
import '../services/favorites_service.dart';
import '../theme/app_theme.dart';
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

  @override
  void initState() {
    super.initState();
    final prompts = widget.category.prompts;
    _prompt = prompts[Random().nextInt(prompts.length)];
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(widget.category.title)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: colors.surfaceAlt,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: colors.border),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'REFLECT',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: colors.accent,
                        fontSize: 11,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                      ),
                ),
                const SizedBox(height: 10),
                Text(
                  _prompt,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 17,
                        height: 1.65,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'From the Stoics',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 18),
          ),
          const SizedBox(height: 12),
          ...widget.category.quotes.map(
            (q) => QuoteCard(quote: q, favorites: widget.favorites),
          ),
        ],
      ),
    );
  }
}
