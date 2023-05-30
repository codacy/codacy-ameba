This rule is used to identify usage of `sum/product` calls
that follow `map`.

For example, this is considered inefficient:

```
(1..3).map(&.*(2)).sum
```

And can be written as this:

```
(1..3).sum(&.*(2))
```

YAML configuration example:

```
Performance/MapInsteadOfBlock:
  Enabled: true
```
