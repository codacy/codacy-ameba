module Codacy::Ameba
  class DefaultPatterns
    def self.patterns
      %w[
        Layout_TrailingBlankLines
        Layout_TrailingWhitespace
        Lint_ComparisonToBoolean
        Lint_DebuggerStatement
        Lint_EmptyEnsure
        Lint_EmptyExpression
        Lint_LiteralInCondition
        Lint_LiteralInInterpolation
        Lint_RandZero
        Lint_ShadowedArgument
        Lint_ShadowedException
        Lint_ShadowingOuterLocalVar
        Lint_UnneededDisableDirective
        Lint_UnreachableCode
        Lint_UnusedArgument
        Lint_UselessAssign
        Lint_UselessConditionInWhen
        Style_ConstantNames
        Style_MethodNames
        Style_NegatedConditionsInUnless
        Style_PredicateName
        Style_RedundantBegin
        Style_TypeNames
        Style_UnlessElse
        Style_VariableNames
        Style_WhileTrue
      ]
    end
  end
end
