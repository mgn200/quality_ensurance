module QualityEnsurance
  class ScssLintEnsurance < BaseLintEnsurance
    def command
      "scss-lint app/assets/stylesheets/ --config .quality/linters/.scss-lint.yml"
    end
  end
end
