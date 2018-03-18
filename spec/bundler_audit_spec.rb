require 'spec_helper'

RSpec.describe QualityEnsurance::BundlerAuditEnsurance do
  it { expect(described_class.new.command).to eq "bundle audit" }
end
