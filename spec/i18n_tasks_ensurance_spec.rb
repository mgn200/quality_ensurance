require "spec_helper"

RSpec.describe QualityEnsurance::I18nTasksEnsuranace do
  it { expect(described_class.new.command).to eq 'i18n-tasks health' }
end
