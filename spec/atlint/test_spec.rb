# frozen_string_literal: true

RSpec.describe Atlint::Test do
  subject { described_class.new }

  context "tests meth method" do
    it "calls test method" do
      expect(subject.meth).to eq(400)
    end
  end

end
