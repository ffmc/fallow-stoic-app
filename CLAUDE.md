# Stoic App — Project Notes

Flutter app: user picks a life problem from a grid, gets one Stoic reflective
prompt + a few cited quotes, can bookmark quotes locally. No backend, no accounts.

## Status (as of 2026-06-17)
v1 scaffold complete and JSON-validated. NOT yet run — Flutter isn't installed on
this machine, and platform folders (android/ios) aren't generated yet.

## Locked decisions (from a /grill-me session)
- Platform: Flutter, iOS + Android.
- Backend: none. Favorites only, stored on-device via shared_preferences.
- Entry point: browse a grid of 12 fixed problem categories (no LLM at runtime).
- Per category: 1 authored reflective prompt + 3–5 quotes.
- Taxonomy axis: life problems/situations (not Stoic concepts).
- Citations are mandatory: every quote has author + work + locator (e.g.
  "Marcus Aurelius, Meditations 8.47").
- Quotes must be verbatim from a public-domain translation, verified by grep
  against the local source file before being added. No quote APIs. No Hays.

## Layout
- `assets/content.json` — the dataset. 12 categories, 38 quotes. The only content
  shipped in the app. Quote ids are `<category-id>-<index>`.
- `lib/models/content.dart` — Quote + ProblemCategory models.
- `lib/data/content_repository.dart` — loads/caches content.json, `quotesByIds`.
- `lib/services/favorites_service.dart` — ChangeNotifier over a Set<String> of
  quote ids, persisted to shared_preferences key `favorite_quote_ids`.
- `lib/theme/app_theme.dart` — dark palette + Inter/Barlow (google_fonts).
  Color tokens in `AppColors`.
- `lib/screens/` — home_screen (grid), category_detail_screen (prompt + quotes),
  favorites_screen.
- `lib/widgets/quote_card.dart` — quote + citation + bookmark toggle.
- `sources/` — public-domain texts, gitignored, kept ONLY to verify quotes:
  - `meditations_long2.txt` = Marcus Aurelius, Long (Gutenberg #15877)
  - `enchiridion.txt`        = Epictetus, Higginson (Gutenberg #45109)

## How to run (on a machine with Flutter)
From `stoic-app/`:
```
flutter create .   # generates android/ios scaffolding; won't overwrite lib/, pubspec, assets
flutter pub get
flutter run
```
Verify: 12 categories render, detail shows prompt + quotes, bookmarking survives
an app kill+relaunch.

## How to add quotes (keep the verification promise)
1. Identify passage + locator (e.g. Meditations 4.17).
2. `grep -n -i "<phrase>" sources/<file>.txt` to get the verbatim text.
3. Add to content.json with author/work/locator; trim with "…" but keep words exact.
4. Re-run the JSON validator (see below).

JSON validator (catches missing fields, dup ids, bad quote counts):
```
python3 - <<'EOF'
import json
d=json.load(open('assets/content.json')); ids=set()
for c in d['categories']:
    assert 3<=len(c['quotes'])<=5, c['id']
    for q in c['quotes']:
        assert all(q[k] for k in ('id','text','author','work','locator'))
        assert q['id'] not in ids; ids.add(q['id'])
print('OK', len(d['categories']),'cats', len(ids),'quotes')
EOF
```

## Next steps (pick up here)
1. Data pass: add Seneca's Moral Letters (Gummere) + Epictetus' Discourses to
   deepen money-worry, procrastination, work/resilience. Needs sourcing Gummere
   (not a clean single Gutenberg file — try Wikisource) and verifying locators.
2. Optionally: daily-prompt home surface (decided OUT for v1).
3. Run the app for the first time and fix any runtime issues.

## Out of scope for v1
Accounts/cloud sync, free-text problem input + LLM matching, notifications,
monetization.

## Open quality note
v1 leans on Marcus Aurelius + Epictetus only (the two fully-verified local
sources), so money-worry and procrastination are lighter than ideal — step 1 fixes that.
