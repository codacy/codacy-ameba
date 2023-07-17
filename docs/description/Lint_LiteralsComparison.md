This rule is used to identify comparisons between two literals.

They usually have the same result - except for non-primitive
types like containers, range or regex.

For example, this will be always false:

```
"foo" == 42
```

YAML configuration example:

```
Lint/LiteralsComparison:
  Enabled: true
```
