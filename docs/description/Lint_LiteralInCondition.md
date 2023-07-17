A rule that disallows useless conditional statements that contain a literal
in place of a variable or predicate function.

This is because a conditional construct with a literal predicate will
always result in the same behaviour at run time, meaning it can be
replaced with either the body of the construct, or deleted entirely.

This is considered invalid:

```
if "something"
  :ok
end
```

YAML configuration example:

```
Lint/LiteralInCondition:
  Enabled: true
```
