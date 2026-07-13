import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../theme/tokens.dart';
import '../widgets/horizon_line.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final text = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(Space.xl, Space.lg, Space.xl, Space.xl3),
        children: [
          Text('Fallow', style: text.displaySmall),
          const SizedBox(height: Space.md),
          Text(
            'A quiet space to find Stoic perspective on what you\'re going through.',
            style: text.bodyMedium,
          ),
          const SizedBox(height: Space.xl2),
          _SectionHeading('How it works', colors, text),
          const SizedBox(height: Space.md),
          Text(
            'Browse a problem that resonates with what you\'re facing. You\'ll find a reflective prompt to sit with and a handful of passages from Stoic writers. Tap the bookmark icon on any passage to save it for later.',
            style: text.bodyMedium,
          ),
          const SizedBox(height: Space.sm),
          Text(
            'The reflective prompt and passages change each time you open a category, so returning to the same situation often surfaces something new.',
            style: text.bodyMedium,
          ),
          const SizedBox(height: Space.xl2),
          _SectionHeading('Sources', colors, text),
          const SizedBox(height: Space.md),
          Text(
            'Every passage is drawn verbatim from a public-domain translation and verified against the original source text before inclusion.',
            style: text.bodyMedium,
          ),
          const SizedBox(height: Space.lg),
          _SourceCard(
            author: 'Marcus Aurelius',
            work: 'Meditations',
            translation: 'George Long, 1862',
            origin: 'Project Gutenberg #15877',
            url: 'https://www.gutenberg.org/ebooks/15877',
            colors: colors,
          ),
          const SizedBox(height: Space.sm),
          _SourceCard(
            author: 'Epictetus',
            work: 'Enchiridion',
            translation: 'Thomas Wentworth Higginson, 1865',
            origin: 'Project Gutenberg #45109',
            url: 'https://www.gutenberg.org/ebooks/45109',
            colors: colors,
          ),
          const SizedBox(height: Space.sm),
          _SourceCard(
            author: 'Epictetus',
            work: 'Discourses',
            translation: 'George Long, 1890',
            origin: 'Project Gutenberg #10661',
            url: 'https://www.gutenberg.org/ebooks/10661',
            colors: colors,
          ),
          const SizedBox(height: Space.sm),
          _SourceCard(
            author: 'Seneca',
            work: 'Moral Letters',
            translation: 'Richard M. Gummere, Loeb Classical Library, 1917',
            origin: 'archive.org, adluciliumepistu01seneuoft',
            url: 'https://archive.org/details/adluciliumepistu01seneuoft',
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: text.headlineSmall),
        const SizedBox(height: Space.sm),
        HorizonLine(color: colors.accent),
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
      borderRadius: BorderRadius.circular(AppRadius.lg),
      onTap: () => launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication),
      child: Container(
        padding: const EdgeInsets.all(Space.lg),
        decoration: BoxDecoration(
          color: colors.surfaceRaised,
          borderRadius: BorderRadius.circular(AppRadius.lg),
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
                    style: text.headlineSmall,
                  ),
                  const SizedBox(height: Space.xs),
                  Text(translation, style: text.bodySmall),
                  const SizedBox(height: 2),
                  Text(
                    origin,
                    style: text.labelMedium?.copyWith(color: colors.accent),
                  ),
                ],
              ),
            ),
            Icon(LucideIcons.externalLink, size: 16, color: colors.subtle),
          ],
        ),
      ),
    );
  }
}
