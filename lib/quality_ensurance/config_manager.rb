module QualityEnsurance
  class ConfigManager
    DATA_PATH = File.expand_path "../../../data", __FILE__
    QUALITY_CONFIG = File.expand_path ".quality/.quality.yml"

    def self.copy_configs
      FileUtils.cp_r("#{DATA_PATH}/configs/.", ".quality")
      FileUtils.mkdir('config') unless File.directory?('config')
      FileUtils.copy("#{DATA_PATH}/configs/linters/i18n-tasks.yml", "config")
    end
  end
end
