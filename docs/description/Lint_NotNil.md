This rule is used to identify usages of `not_nil!` calls.

For example, this is considered a code smell:

```
names = %w[Alice Bob]
alice = names.find { |name| name == "Alice" }.not_nil!
```

And can be written as this:

```
names = %w[Alice Bob]
alice = names.find { |name| name == "Alice" }

if alice
  # ...
end
```

YAML configuration example:

```
Lint/NotNil:
  Enabled: true
```
