module QualityEnsurance
  # Brakeman linter runner and configuration
  class BrakemanEnsurance < BaseLintEnsurance    
    def command
      'brakeman -c .quality/linters/.brakeman.yml'
    end
  end
end
