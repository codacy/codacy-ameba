This rule is used to identify usage of `min/max/minmax` calls that follow `map`.

For example, this is considered invalid:

```
%w[Alice Bob].map(&.size).min
%w[Alice Bob].map(&.size).max
%w[Alice Bob].map(&.size).minmax
```

And it should be written as this:

```
%w[Alice Bob].min_of(&.size)
%w[Alice Bob].max_of(&.size)
%w[Alice Bob].minmax_of(&.size)
```

YAML configuration example:

```
Performance/MinMaxAfterMap:
  Enabled: true
```
