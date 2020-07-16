A rule that reports incorrect comment directives for Ameba.

For example, the user can mistakenly add a directive
to disable a rule that even doesn't exist:

```
# ameba:disable BadRuleName
def foo
  :bar
end
```

YAML configuration example:

```
Lint/BadDirective:
  Enabled: true
```
