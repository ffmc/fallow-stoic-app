import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final text = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 48),
        children: [
          Text('Fallow', style: text.displaySmall),
          const SizedBox(height: 12),
          Text(
            'A quiet space to find Stoic perspective on what you\'re going through.',
            style: text.bodyLarge,
          ),
          const SizedBox(height: 32),
          _SectionHeading('How it works', colors, text),
          const SizedBox(height: 12),
          Text(
            'Browse a problem that resonates with what you\'re facing. You\'ll find a reflective prompt to sit with and a handful of passages from Stoic writers. Tap the bookmark icon on any passage to save it for later.',
            style: text.bodyLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'The reflective prompt and passages change each time you open a category, so returning to the same situation often surfaces something new.',
            style: text.bodyLarge,
          ),
          const SizedBox(height: 32),
          _SectionHeading('Sources', colors, text),
          const SizedBox(height: 12),
          Text(
            'Every passage is drawn verbatim from a public-domain translation and verified against the original source text before inclusion.',
            style: text.bodyMedium,
          ),
          const SizedBox(height: 16),
          _SourceCard(
            author: 'Marcus Aurelius',
            work: 'Meditations',
            translation: 'George Long, 1862',
            origin: 'Project Gutenberg #15877',
            url: 'https://www.gutenberg.org/ebooks/15877',
            colors: colors,
          ),
          const SizedBox(height: 10),
          _SourceCard(
            author: 'Epictetus',
            work: 'Enchiridion',
            translation: 'Thomas Wentworth Higginson, 1865',
            origin: 'Project Gutenberg #45109',
            url: 'https://www.gutenberg.org/ebooks/45109',
            colors: colors,
          ),
        ],
      ),
    );
  }
}

class _SectionHeading extends StatelessWidget {
  final String title;
  final AppColors colors;
  final TextTheme text;

  const _SectionHeading(this.title, this.colors, this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 3,
          height: 18,
          decoration: BoxDecoration(
            color: colors.accent,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 10),
        Text(title, style: text.titleLarge?.copyWith(fontSize: 18)),
      ],
    );
  }
}

class _SourceCard extends StatelessWidget {
  final String author;
  final String work;
  final String translation;
  final String origin;
  final String url;
  final AppColors colors;

  const _SourceCard({
    required this.author,
    required this.work,
    required this.translation,
    required this.origin,
    required this.url,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () => launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: colors.surfaceAlt,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: colors.border),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$author — $work',
                    style: text.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  Text(translation, style: text.bodyMedium),
                  const SizedBox(height: 2),
                  Text(
                    origin,
                    style: text.bodyMedium?.copyWith(
                      color: colors.accent,
                      fontStyle: FontStyle.italic,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.open_in_new, size: 16, color: colors.muted),
          ],
        ),
      ),
    );
  }
}
