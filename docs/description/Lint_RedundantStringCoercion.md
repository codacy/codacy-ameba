A rule that disallows string conversion in string interpolation,
which is redundant.

For example, this is considered invalid:

```
"Hello, #{name.to_s}"
```

And this is valid:

```
"Hello, #{name}"
```

YAML configuration example:

```
Lint/RedundantStringCoersion
  Enabled: true
```
