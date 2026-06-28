# Fallow

A quiet space to find Stoic perspective on what you're going through.

Browse a problem that resonates — anxiety, anger, grief, self-doubt, and more. Each category offers a reflective prompt to sit with and a handful of passages from Stoic writers. The prompt and passages rotate on every visit, so returning to the same situation often surfaces something new.

Bookmark any passage to save it for later. Everything stays on your device — no accounts, no tracking.

## Content

12 categories covering common human struggles:

Anxiety · Anger · Grief · Fear of Death · Money Worry · Relationship Conflict · Procrastination · Envy · Failure & Setback · Loss of Control · Self-Doubt · Overwhelm

All quotes are drawn verbatim from public-domain translations and verified against the original source texts:

- **Marcus Aurelius, Meditations** — George Long, 1862 (Project Gutenberg #15877)
- **Epictetus, Enchiridion** — Thomas Wentworth Higginson, 1865 (Project Gutenberg #45109)

## Built with

- [Flutter](https://flutter.dev) — iOS & Android
- [Google Fonts](https://pub.dev/packages/google_fonts) — Playfair Display + Lora
- [shared_preferences](https://pub.dev/packages/shared_preferences) — local bookmark storage

## Running locally

Requires Flutter 3.19+.

```bash
flutter create .        # generates platform folders if missing
flutter pub get
flutter run             # Linux desktop, or connect a device
```

To build a release APK:

```bash
flutter build apk --release
# Output: build/app/outputs/flutter-apk/app-release.apk
```
