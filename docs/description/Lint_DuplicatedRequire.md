A rule that reports duplicated require statements.

```
require "./thing"
require "./stuff"
require "./thing" # duplicated require
```

YAML configuration example:

```
Lint/DuplicatedRequire:
  Enabled: true
```
