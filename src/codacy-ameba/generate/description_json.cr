module Codacy::Ameba
  class DescriptionJSON
    record Parameter,
      name : String,
      description : String do
      include JSON::Serializable
    end

    record Description,
      id : String,
      title : String,
      description : String,
      time_to_fix : Int32,
      parameters : Array(Parameter) do
      def to_json(json : JSON::Builder)
        json.object do
          json.field "patternId", id
          json.field "title", title
          json.field "description", description
          json.field "timeToFix", time_to_fix
          if !parameters.empty?
            json.field "parameters", parameters
          end
        end
      end
    end

    @descriptions : Array(Description)

    def initialize(rules, @filename = Path[DEFAULT_DOCS_DIR, "description", "description.json"])
      @descriptions = rules.map do |rule|
        Description.new(
          id: name(rule),
          title: rule.description,
          description: rule.description,
          time_to_fix: 5,
          parameters: [] of Parameter,
        )
      end
    end

    private def name(rule)
      Ameba.generate_pattern_id(rule.name)
    end

    def generate
      File.write(@filename, to_pretty_json)
    end

    def to_json(json : JSON::Builder)
      @descriptions.to_json(json)
    end
  end
end
