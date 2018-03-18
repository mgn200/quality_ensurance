module QualityEnsurance
  class BaseLintEnsurance
    def run
      stdout, stderr, exit_code = Open3.capture3(command)
      return "ok" if exit_code == 0
      [stderr, stdout]
      #return stderr if stdout.empty?
      #stdout
    end

    def command
      raise 'Specify command in linter subclass'
    end
  end
end
