# #Patterns: Style_RedundantBegin

def method
  # #Warn: Style_RedundantBegin
  begin
    a = 1
    b = 2
  end
end

def method(a : String) : String
  # #Warn: Style_RedundantBegin
  begin
    open_file
    do_some_stuff
  ensure
    close_file
  end
end

def method
  do_something
rescue
  do_something_else
end

def method
  do_something
  do_something_else
ensure
  handle_something
end

def inner_handler
  begin
  rescue
  end
rescue
end

def method
  yield
rescue
end
