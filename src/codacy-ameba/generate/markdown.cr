module Codacy::Ameba
  class Markdown
    @rules : Array(::Ameba::Rule::Base)

    def initialize(@rules, @directory = "docs/description")
    end

    def generate
      @rules.each do |rule|
        filename = Path[@directory, "#{Ameba.generate_pattern_id(rule.name)}.md"]
        File.open(filename, "w") do |io|
          io.puts rule.class.parsed_doc
        end
      end
    end
  end
end
