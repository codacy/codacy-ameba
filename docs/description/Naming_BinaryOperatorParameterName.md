A rule that enforces that certain binary operator methods have
their sole parameter named `other`.

For example, this is considered valid:

```
class Money
  def +(other)
  end
end
```

And this is invalid parameter name:

```
class Money
  def +(amount)
  end
end
```

YAML configuration example:

```
Naming/BinaryOperatorParameterName:
  Enabled: true
  ExcludedOperators: ["[]", "[]?", "[]=", "<<", ">>", "=~", "!~"]
```
