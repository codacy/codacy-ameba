This rule is used to identify usage of `compact` calls that follow `map`.

For example, this is considered inefficient:

```
%w[Alice Bob].map(&.match(/^A./)).compact
```

And can be written as this:

```
%w[Alice Bob].compact_map(&.match(/^A./))
```

YAML configuration example:

```
Performance/CompactAfterMap:
  Enabled: true
```
