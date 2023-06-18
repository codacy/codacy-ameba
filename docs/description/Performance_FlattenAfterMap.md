This rule is used to identify usage of `flatten` calls that follow `map`.

For example, this is considered inefficient:

```
%w[Alice Bob].map(&.chars).flatten
```

And can be written as this:

```
%w[Alice Bob].flat_map(&.chars)
```

YAML configuration example:

```
Performance/FlattenAfterMap:
  Enabled: true
```
