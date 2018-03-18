require "spec_helper"

RSpec.describe QualityEnsurance::HamlLintEnsurance do
  it { expect(described_class.new.command).to eq 'haml-lint -c .quality/linters/.haml-lint.yml' }
end
