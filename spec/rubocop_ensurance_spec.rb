require 'spec_helper'

RSpec.describe QualityEnsurance::RubocopEnsurance do
  it { expect(described_class.new.command).to eq 'rubocop -c .quality/linters/.rubocop.yml' }
end
