require 'spec_helper'

RSpec.describe QualityEnsurance::ReekEnsurance do
  it { expect(described_class.new.command).to eq 'reek -c .quality/linters/.reek' }
end
