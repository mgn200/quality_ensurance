require "spec_helper"

RSpec.describe QualityEnsurance::BrakemanEnsurance do
  it { expect(described_class.new.command).to eq "brakeman -c .quality/linters/.brakeman.yml" }
end
