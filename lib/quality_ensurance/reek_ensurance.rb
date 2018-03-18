module QualityEnsurance
  class ReekEnsurance < BaseLintEnsurance
    def command
      'reek -c .quality/linters/.reek'
    end
  end
end
