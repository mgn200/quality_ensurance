module QualityEnsurance
  # Only check if any keys are missed or not used.
  class I18nTasksEnsuranace < BaseLintEnsurance
    def run
      puts 'i18n config file is located at config/i18n-tasts.yml. Linter uses that file insted of one in .quality/linters'
    end

    def command
      'i18n-tasks health'
    end
  end
end
