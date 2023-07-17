A rule that disallows assignments with literal values
in control expressions.

For example, this is considered invalid:

```
if foo = 42
  do_something
end
```

And most likely should be replaced by the following:

```
if foo == 42
  do_something
end
```

YAML configuration example:

```
Lint/LiteralAssignmentsInExpressions:
  Enabled: true
```
