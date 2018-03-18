module QualityEnsurance
  class RubocopEnsurance < BaseLintEnsurance
    def command
      'rubocop -c .quality/linters/.rubocop.yml'
    end
  end
end
