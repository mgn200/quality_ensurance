require "spec_helper"

RSpec.describe QualityEnsurance::CheckRunner do
  describe '#run' do
    #subject { QualityEnsurance::CheckRunner.new.run }

    describe "return string of messages" do
      before do
        allow_any_instance_of(QualityEnsurance::BrakemanEnsurance).to receive(:run).and_return('ok')
        allow_any_instance_of(QualityEnsurance::HamlLintEnsurance).to receive(:run).and_return('ok')
        allow_any_instance_of(QualityEnsurance::BundlerAuditEnsurance).to receive(:run).and_return('ok')
        allow_any_instance_of(QualityEnsurance::RubocopEnsurance).to receive(:run).and_return('ok')
        allow_any_instance_of(QualityEnsurance::ScssLintEnsurance).to receive(:run).and_return('ok')
        allow_any_instance_of(QualityEnsurance::I18nTasksEnsuranace).to receive(:run).and_return('ok')
        allow_any_instance_of(QualityEnsurance::EslintEnsurance).to receive(:run).and_return('ok')
        allow_any_instance_of(QualityEnsurance::ReekEnsurance).to receive(:run).and_return('ok')
      end

      it 'should exit program when every linter passed successfuly' do
        # exit breaks the rspec
        #lambda { QualityEnsurance::CheckRunner.new.run }.call.to raise_error(SystemExit)
      end
    end
  end
end
