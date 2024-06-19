A rule that reports non-descriptive block parameter names.

Favour this:

```
tokens.each { |token| token.last_accessed_at = Time.utc }
```

Over this:

```
tokens.each { |t| t.last_accessed_at = Time.utc }
```

YAML configuration example:

```
Naming/BlockParameterName:
  Enabled: true
  MinNameLength: 3
  AllowNamesEndingInNumbers: true
  AllowedNames: [_, e, i, j, k, v, x, y, ex, io, ws, op, tx, id, ip, k1, k2, v1, v2]
  ForbiddenNames: []
```
