require "quality_ensurance/config_manager"
require "quality_ensurance/version"
require "quality_ensurance/base_lint_ensurance"
require "quality_ensurance/eslint_ensurance"
require "quality_ensurance/quality_check_runner"
require "quality_ensurance/reek_ensurance"
require "quality_ensurance/rubocop_ensurance"
require "quality_ensurance/brakeman_ensurance"
require "quality_ensurance/bundler_audit_ensurance"
require "quality_ensurance/haml_lint_ensurance"
require "quality_ensurance/scss_lint_ensurance"
require "quality_ensurance/i18n_tasks_ensurance"
require 'fileutils'
require 'byebug'
require 'open3'
require 'yaml'

module QualityEnsurance
  def self.copy_config_files
    QualityEnsurance::ConfigManager.copy_configs
  end

  def self.check
    print QualityEnsurance::CheckRunner.new.run
  end
end
