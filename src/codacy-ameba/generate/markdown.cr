require "file_utils"

module Codacy::Ameba
  class Markdown
    @rules : Array(::Ameba::Rule::Base)

    def initialize(@rules, @directory = Path[DEFAULT_DOCS_DIR, "description"])
    end

    def generate
      FileUtils.rm_rf(@directory)
      FileUtils.mkdir_p(@directory)

      @rules.each do |rule|
        next unless doc = rule.class.parsed_doc

        filename = Path[@directory, "#{Ameba.generate_pattern_id(rule.name)}.md"]
        File.open filename, "w", &.puts(doc)
      end
    end
  end
end
