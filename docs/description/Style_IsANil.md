A rule that disallows calls to `is_a?(Nil)` in favor of `nil?`.

This is considered bad:

```
var.is_a?(Nil)
```

And needs to be written as:

```
var.nil?
```

YAML configuration example:

```
Style/IsANil:
  Enabled: true
```
