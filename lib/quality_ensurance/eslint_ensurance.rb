module QualityEnsurance
  class EslintEnsurance < BaseLintEnsurance
    def run
      begin
        super
      rescue Errno::ENOENT
        return "You need to install eslint package separately in order for it to work. Please visit https://eslint.org/docs/user-guide/"
      end
    end

    def command
      'eslint -c .quality/linters/.eslintrc.yml'
    end
  end
end
