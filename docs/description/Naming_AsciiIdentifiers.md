A rule that reports non-ascii characters in identifiers.

Favour this:

```
class BigAwesomeWolf
end
```

Over this:

```
class BigAwesome🐺
end
```

YAML configuration example:

```
Naming/AsciiIdentifiers:
  Enabled: true
  IgnoreSymbols: false
```
