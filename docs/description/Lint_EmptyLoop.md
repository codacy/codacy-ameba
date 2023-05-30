A rule that disallows empty loops.

This is considered invalid:

```
while false
end

until 10
end

loop do
  # nothing here
end
```

And this is valid:

```
a = 1
while a < 10
  a += 1
end

until socket_opened?
end

loop do
  do_something_here
end
```

YAML configuration example:

```
Lint/EmptyLoop:
  Enabled: true
```
