import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/content.dart';

class ContentRepository {
  List<ProblemCategory>? _categories;

  Future<List<ProblemCategory>> load() async {
    if (_categories != null) return _categories!;
    final raw = await rootBundle.loadString('assets/content.json');
    final json = jsonDecode(raw) as Map<String, dynamic>;
    _categories = (json['categories'] as List)
        .map((c) => ProblemCategory.fromJson(c as Map<String, dynamic>))
        .toList();
    return _categories!;
  }

  List<Quote> quotesByIds(Set<String> ids) {
    final all = _categories;
    if (all == null) return const [];
    return [
      for (final c in all)
        for (final q in c.quotes)
          if (ids.contains(q.id)) q
    ];
  }
}
