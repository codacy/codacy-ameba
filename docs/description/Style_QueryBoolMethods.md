A rule that disallows boolean properties without the `?` suffix - defined
using `Object#(class_)property` or `Object#(class_)getter` macros.

Favour this:

```
class Person
  property? deceased = false
  getter? witty = true
end
```

Over this:

```
class Person
  property deceased = false
  getter witty = true
end
```

YAML configuration example:

```
Style/QueryBoolMethods:
  Enabled: true
```
