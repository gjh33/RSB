require 'spec_helper'
require 'riot_set_builder/pro_builds/parser'

RSpec.describe RiotSetBuilder::ProBuilds::Parser do
  let(:parser) { described_class.new }

  describe "#champions" do
    subject { parser.champions }

    it "returns all the champions" do
      expect(subject).to include :Ahri, :Katarina, :Malzahar, :ChoGath
    end
  end
end
