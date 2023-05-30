require "ameba"
require "./codacy-ameba/util"
require "./codacy-ameba/generate/*"

module Codacy::Ameba
  DEFAULT_DOCS_DIR = "docs"

  def self.generate
    rules = ::Ameba::Config.load.rules
    rules.reject!(::Ameba::Rule::Lint::Syntax)

    Markdown.new(rules).generate
    PatternsJSON.new(rules).generate
    DescriptionJSON.new(rules).generate
  end
end

Codacy::Ameba.generate
