require "json"

module Codacy::Ameba
  struct Parameter
    include JSON::Serializable

    property name : String
    property value : String
  end

  struct Pattern
    include JSON::Serializable

    @[JSON::Field(key: "patternId")]
    property id : String
    property parameters : Array(Parameter)?
  end

  struct Tool
    include JSON::Serializable

    property name : String
    property patterns : Array(Pattern)
  end

  struct Config
    include JSON::Serializable

    property files = [] of String
    property tools = [] of Tool

    def self.load(base_dir, filename = ".codacyrc")
      path = Path[base_dir, filename]
      data = File.read(path)
      Config.from_json(data)
    rescue
      nil
    end
  end
end
