This rule is used to identify usage of `index/rindex/find` calls
followed by a call to `not_nil!`.

For example, this is considered a code smell:

```
%w[Alice Bob].find(&.match(/^A./)).not_nil!
```

And can be written as this:

```
%w[Alice Bob].find!(&.match(/^A./))
```

YAML configuration example:

```
Lint/NotNilAfterNoBang:
  Enabled: true
```
