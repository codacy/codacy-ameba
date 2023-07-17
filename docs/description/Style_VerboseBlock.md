This rule is used to identify usage of single expression blocks with
argument as a receiver, that can be collapsed into a short form.

For example, this is considered invalid:

```
(1..3).any? { |i| i.odd? }
```

And it should be written as this:

```
(1..3).any?(&.odd?)
```

YAML configuration example:

```
Style/VerboseBlock:
  Enabled: true
  ExcludeMultipleLineBlocks: true
  ExcludeCallsWithBlock: true
  ExcludePrefixOperators: true
  ExcludeOperators: true
  ExcludeSetters: false
  MaxLineLength: ~
  MaxLength: 50 # use ~ to disable
```
