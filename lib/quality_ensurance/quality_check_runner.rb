module QualityEnsurance
  class CheckRunner
    def initialize
      @linters = get_linters
      @messages_container = {}
    end

    def run
      @linters.each do |name, linter|
        @messages_container[name] = linter.run
      end

      if @messages_container.all? { |linter, msg| msg == 'ok' }
        puts "All linters passed successfully!"
        exit(0)
      else
        print_output(@messages_container)
      end
    end

    private
    # Re-write exit to be able to stub it in specs

    def get_linters
      linters = YAML.load_file(QualityEnsurance::ConfigManager::QUALITY_CONFIG)['linters']
      linters_classes.select { |linter| linters.include?(linter.to_s) }
    end

    def linters_classes
      { brakeman:       QualityEnsurance::BrakemanEnsurance.new,
        haml_lint:      QualityEnsurance::HamlLintEnsurance.new,
        scss_lint:      QualityEnsurance::ScssLintEnsurance.new,
        bundler_audit:  QualityEnsurance::BundlerAuditEnsurance.new,
        rubocop:        QualityEnsurance::RubocopEnsurance.new,
        reek:           QualityEnsurance::ReekEnsurance.new,
        i18n_tasks:     QualityEnsurance::I18nTasksEnsuranace.new
      }
    end

    def print_output(messages)
      puts "Start of linters messages."
      messages.flat_map { |k, v| [k.to_s.capitalize!, "\n", v, "\n"] }
              .each { |msg| puts msg }
      abort("End of error messages")
    end
  end
end
