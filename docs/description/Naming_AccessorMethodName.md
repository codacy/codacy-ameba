A rule that makes sure that accessor methods are named properly.

Favour this:

```
class Foo
  def user
    @user
  end

  def user=(value)
    @user = value
  end
end
```

Over this:

```
class Foo
  def get_user
    @user
  end

  def set_user(value)
    @user = value
  end
end
```

YAML configuration example:

```
Naming/AccessorMethodName:
  Enabled: true
```
