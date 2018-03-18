require 'spec_helper'

RSpec.describe QualityEnsurance::EslintEnsurance do
  it { expect(described_class.new.command).to eq 'eslint -c .quality/linters/.eslintrc.yml' }

  subject { QualityEnsurance::EslintEnsurance.new.run }

  context 'when eslint package is not installed' do
    it { is_expected.to eq "You need to install eslint package separatelyin order for it to work. Please visit https://eslint.org/docs/user-guide/"}
  end
end
