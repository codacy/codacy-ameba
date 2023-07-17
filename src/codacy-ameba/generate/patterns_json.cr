require "./defaults"

module Codacy::Ameba
  class PatternsJSON
    record Parameter,
      name : String,
      default : String do
      include JSON::Serializable
    end

    record Pattern,
      id : String,
      level : String,
      category : String,
      parameters : Array(Parameter),
      enabled : Bool do
      def to_json(json : JSON::Builder)
        json.object do
          json.field "patternId", id
          json.field "level", level
          json.field "category", category
          if !parameters.empty?
            json.field "parameters", parameters
          end
          json.field "enabled", enabled
        end
      end
    end

    @patterns = [] of Pattern

    def initialize(rules, @filename = Path[DEFAULT_DOCS_DIR, "patterns.json"])
      @patterns = rules.map do |rule|
        Pattern.new(
          id: name(rule),
          level: level(rule),
          category: category(rule),
          parameters: [] of Parameter,
          enabled: enabled(rule),
        )
      end
    end

    private def name(rule)
      Ameba.generate_pattern_id(rule.name)
    end

    private def level(rule)
      case
      when rule.name.includes?("Syntax")
        "Error"
      when rule.group.in?("Lint", "Performance", "Style")
        "Warning"
      else
        "Info"
      end
    end

    private def category(rule)
      case rule.group
      when "Performance"     then "Performance"
      when "Style", "Layout" then "CodeStyle"
      when "Security"        then "Security"
      when "Documentation"   then "Documentation"
      else
        if rule.name.includes?("UnreachableCode")
          "UnusedCode"
        else
          "ErrorProne"
        end
      end
    end

    private def enabled(rule)
      name(rule).in?(DefaultPatterns.patterns)
    end

    def generate
      Dir.mkdir_p(@filename.dirname)
      File.write(@filename, to_pretty_json)
    end

    def to_json(json : JSON::Builder)
      json.object do
        json.field "name", TOOL_NAME
        json.field "version", ::Ameba::VERSION
        json.field "patterns", @patterns
      end
    end
  end
end
