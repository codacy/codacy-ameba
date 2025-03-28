A rule that enforces spec filenames to have `_spec` suffix.

YAML configuration example:

```
Lint/SpecFilename:
  Enabled: true
  IgnoredDirs: [spec/support spec/fixtures spec/data]
  IgnoredFilenames: [spec_helper]
```
