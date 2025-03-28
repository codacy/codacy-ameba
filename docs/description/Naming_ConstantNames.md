A rule that enforces constant names to be in screaming case.

For example, these constant names are considered valid:

```
LUCKY_NUMBERS     = [3, 7, 11]
DOCUMENTATION_URL = "http://crystal-lang.org/docs"
```

And these are invalid names:

```
myBadConstant = 1
Wrong_NAME = 2
```

YAML configuration example:

```
Naming/ConstantNames:
  Enabled: true
```
