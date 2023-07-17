# #Patterns: Lint_UnusedArgument

# #Warn: Lint_UnusedArgument
collection.each_with_index do |a, i|
  a
end

->(a : Int32, b : String) do
  a + b
end

def method(a)
end

record X do
  macro foo(a, b)
    {{a}} + {{b}}
  end

  macro bar(a, b, c)
    {{a}} + {{b}} + {{c}}
  end
end
