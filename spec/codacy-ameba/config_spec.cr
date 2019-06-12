require "../spec_helper.cr"

module Codacy::Ameba
  describe Config do
    it "returns nil if there's no config file" do
      config = Config.load("/")
      config.should eq nil
    end

    it "loads config from the file" do
      codacy_json = <<-CONFIG
        {
          "files" : ["foo/bar/baz.js", "foo2/bar/baz.php"],
          "tools":[
            {
              "name":"jshint",
              "patterns":[
                {
                  "patternId":"latedef",
                  "parameters":[
                    {
                      "name":"latedef",
                      "value":"vars"
                    }
                  ]
                }
              ]
            }
          ]
        }
      CONFIG

      config = Config.from_json(codacy_json)
      config.files.should eq ["foo/bar/baz.js", "foo2/bar/baz.php"]
      config.tools.size.should eq 1

      tool = config.tools.first
      tool.name.should eq "jshint"
      tool.patterns.size.should eq 1

      pattern = tool.patterns.first
      pattern.id.should eq "latedef"

      parameters = pattern.parameters || [] of Parameter
      parameters.size.should eq 1
      parameter = parameters.first
      parameter.name.should eq "latedef"
      parameter.value.should eq "vars"
    end
  end
end
