module Codacy::Ameba
  class Formatter < ::Ameba::Formatter::BaseFormatter
    @mutex = Mutex.new

    def initialize(@output = STDOUT, @base_dir = "./")
    end

    def source_finished(source)
      source.issues.each do |issue|
        if issue.syntax?
          formatted_error = format_error(source)

          @mutex.synchronize do
            output.puts(formatted_error)
          end
          return
        end

        next if issue.disabled?
        next unless location = issue.location

        formatted_issue = format_issue(issue, source, location)

        @mutex.synchronize do
          output.puts(formatted_issue)
        end
      end
    end

    private def format_issue(issue, source, location)
      {
        filename:  remove_base_dir(source.path),
        message:   issue.message,
        patternId: Ameba.generate_pattern_id(issue.rule.name),
        line:      location.line_number,
      }.to_json
    end

    private def format_error(source)
      {
        filename: remove_base_dir(source.path),
        message:  "could not parse the file",
      }.to_json
    end

    private def remove_base_dir(path)
      path.lchop(@base_dir).lchop('/')
    end
  end
end
