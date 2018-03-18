require "spec_helper"

RSpec.describe QualityEnsurance do
  let(:install_command) { 'quality_ensurance install' }
  let(:check_command) { 'quality_ensurance check' }

  def clean_configs
    FileUtils.rm_rf(".quality")
    FileUtils.rm_rf("config")
  end

  describe 'install command' do
    before { `#{install_command}` }

    it 'creates config files in currents paths .quality/ folder' do
      expect(File.exist?(".quality/.quality.yml")).to eq true
      expect(Dir.empty?(".quality/linters")).to eq false
      #clean_configs
    end

    it 'copies i18n-tasks config to config/' do
      expect(File.exist?("config/i18n-tasks.yml")).to eq true
    end
  end

  describe 'check command' do
    subject { `#{check_command}` }

    context 'when all linters pass without error' do
      before do
        allow_any_instance_of(QualityEnsurance::CheckRunner).to receive(:get_linters).and_return([QualityEnsurance::BrakemanEnsurance.new])
        allow_any_instance_of(QualityEnsurance::BrakemanEnsurance).to receive(:run).and_return('ok')
      end

      it { is_expected.to eq 'All linters run successfully' }
    end

    context 'when any linter find an error' do
      before do
        allow_any_instance_of(QualityEnsurance::CheckRunner).to receive(:get_linters).and_return([QualityEnsurance::RubocopEnsurance.new])
        allow_any_instance_of(QualityEnsurance::BrakemanEnsurance).to receive(:run).and_return(['not ok'])
      end
      it { expect(subject.include? 'End of linters error prints')}
    end
  end

  context 'version' do
    it "has a version number" do
      expect(QualityEnsurance::VERSION).not_to be nil
    end
  end
end
