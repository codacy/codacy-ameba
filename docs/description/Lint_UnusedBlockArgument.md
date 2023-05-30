A rule that reports unused block arguments.
For example, this is considered invalid:

```
def foo(a, b, &block)
  a + b
end

def bar(&block)
  yield 42
end
```

and should be written as:

```
def foo(a, b, &_block)
  a + b
end

def bar(&)
  yield 42
end
```

YAML configuration example:

```
Lint/UnusedBlockArgument:
  Enabled: true
```
