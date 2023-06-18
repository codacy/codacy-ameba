# #Patterns: Lint_ShadowedException

begin
rescue Exception
  handle_exception
  # #Warn: Lint_ShadowedException
rescue ArgumentError
  handle_argument_error_exception
end

begin
rescue Exception
  2
  # #Warn: Lint_ShadowedException
rescue MySuperException
  3
end

begin
  # #Warn: Lint_ShadowedException
rescue Exception | IndexError
end

begin
  # #Warn: Lint_ShadowedException
rescue IndexError | Exception
  # #Warn: Lint_ShadowedException
rescue Exception
rescue
end

begin
rescue IndexError
  # #Warn: Lint_ShadowedException
rescue IndexError
end

begin
  do_something
rescue Exception
  nil
end
