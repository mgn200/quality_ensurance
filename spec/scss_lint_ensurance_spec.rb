require "spec_helper"

RSpec.describe QualityEnsurance::ScssLintEnsurance do
  it { expect(described_class.new.command).to eq "scss-lint app/assets/stylesheets/ --config .quality/linters/.scss-lint.yml" }
end
