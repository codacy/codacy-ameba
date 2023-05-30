A rule that checks for the presence of superfluous parentheses
around the condition of `if`, `unless`, `case`, `while` and `until`.

For example, this is considered invalid:

```
if (foo == 42)
  do_something
end
```

And should be replaced by the following:

```
if foo == 42
  do_something
end
```

YAML configuration example:

```
Style/ParenthesesAroundCondition:
  Enabled: true
  ExcludeTernary: false
  AllowSafeAssignment: false
```
