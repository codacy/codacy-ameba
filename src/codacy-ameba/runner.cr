module Codacy::Ameba
  class Runner
    getter dir : String

    def initialize(@dir = "/src")
    end

    def run
      codacy_config = Config.load("/")

      ameba_config = ::Ameba::Config.load(
        Path[dir, ::Ameba::Config::FILENAME],
        colors: true,
      )

      if codacy_config
        configure_files(ameba_config, codacy_config.files)
        configure_rules(ameba_config, codacy_config.tools)
      else
        configure_files(ameba_config, nil)
        configure_rules(ameba_config)
      end
      configure_formatter(ameba_config)

      ::Ameba.run(ameba_config)
    rescue
      false
    end

    private def configure_files(config, files)
      if files.nil? || files.empty?
        config.globs = default_files
      else
        config.globs = files.map { |path| "#{dir}/#{path}" }
      end
    end

    private def configure_rules(config)
      config.rules.map! do |rule|
        rule.excluded.try &.map! { |path| "#{dir}/#{path}" }
        rule
      end
    end

    private def configure_rules(config, tools)
      return unless tools

      patterns = tools
        .find(&.name.== TOOL_NAME)
        .try(&.patterns)

      if patterns
        selected_rule_names = patterns.map do |pattern|
          Ameba.get_rule_name(pattern.id)
        end
        config.rules.map! { |r| r.enabled = false; r }
        config.update_rules(selected_rule_names, enabled: true)
      else
        config.rules.map! { |r| r.enabled = true; r }
      end
    end

    private def configure_formatter(config)
      config.formatter = Codacy::Ameba::Formatter.new(STDOUT, dir)
    end

    private def default_files
      ["#{dir}/**/*.cr"]
    end
  end
end
