class Quote {
  final String id;
  final String text;
  final String author;
  final String work;
  final String locator;

  const Quote({
    required this.id,
    required this.text,
    required this.author,
    required this.work,
    required this.locator,
  });

  String get citation => '$author, $work $locator';

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        id: json['id'] as String,
        text: json['text'] as String,
        author: json['author'] as String,
        work: json['work'] as String,
        locator: json['locator'] as String,
      );
}

class ProblemCategory {
  final String id;
  final String title;
  final String blurb;
  final List<String> prompts;
  final List<Quote> quotes;

  const ProblemCategory({
    required this.id,
    required this.title,
    required this.blurb,
    required this.prompts,
    required this.quotes,
  });

  factory ProblemCategory.fromJson(Map<String, dynamic> json) => ProblemCategory(
        id: json['id'] as String,
        title: json['title'] as String,
        blurb: json['blurb'] as String,
        prompts: (json['prompts'] as List).map((e) => e as String).toList(),
        quotes: (json['quotes'] as List)
            .map((q) => Quote.fromJson(q as Map<String, dynamic>))
            .toList(),
      );
}
