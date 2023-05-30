This rule is used to identify usage of chained calls not utilizing
the bang method variants.

For example, this is considered inefficient:

```
names = %w[Alice Bob]
chars = names
  .flat_map(&.chars)
  .uniq
  .sort
```

And can be written as this:

```
names = %w[Alice Bob]
chars = names
  .flat_map(&.chars)
  .uniq!
  .sort!
```

YAML configuration example:

```
Performance/ChainedCallWithNoBang:
  Enabled: true
  CallNames:
    - uniq
    - sort
    - sort_by
    - shuffle
    - reverse
```
