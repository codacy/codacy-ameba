A rule that reports typos found in source files.

NOTE: Needs [typos](https://github.com/crate-ci/typos) CLI tool.
NOTE: See the chapter on [false positives](https://github.com/crate-ci/typos#false-positives).

YAML configuration example:

```
Lint/Typos:
  Enabled: true
  BinPath: ~
  FailOnError: false
```
