module QualityEnsurance
  class HamlLintEnsurance < BaseLintEnsurance
    def command
      'haml-lint -c .quality/linters/.haml-lint.yml'
    end
  end
end
