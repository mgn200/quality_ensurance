module QualityEnsurance
  class BundlerAuditEnsurance < BaseLintEnsurance
    def command
      'bundle audit'
    end
  end
end
