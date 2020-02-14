A rule that disallows redundant `each_with_object` calls.

For example, this is considered invalid:

```
collection.each_with_object(0) do |e|
  # ...
end

collection.each_with_object(0) do |e, _|
  # ...
end
```

and it should be written as follows:

```
collection.each do |e|
  # ...
end
```

YAML configuration example:

```
Lint/RedundantWithObject:
  Enabled: true
```
