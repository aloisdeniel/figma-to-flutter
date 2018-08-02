# Sample

## Generation

To trigger a generation, use the cli with this command from the root of the repo :

```bash
dart cli/bin/cli.dart -t <API TOKEN> -f <FILE KEY> -w Logo -o sample/lib/widgets/sample.g.dart
dart cli/bin/cli.dart -t <API TOKEN> -f <FILE KEY> -w Logo -w Constraints_1 -w Constraints_nested -w Landscape_simple -w Landscape_effects -w Goups -w Frames -w Goups2 -w MultiGoups  -o sample/lib/gallery/gallery.g.dart -c
```