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

  describe "#recent_builds_for" do
    subject { parser.recent_builds_for(:Aatrox) }

    it "returns a list of recent builds" do
      expect(subject).to all be_a RiotSetBuilder::Build
      expect(subject).not_to be_empty
    end
  end

  describe "#all_recent_builds" do
    subject { parser.all_recent_builds }

    before do
      allow(parser).to receive(:recent_builds_for).and_return(["builds"])
    end

    it "gets builds for each champion" do
      expect(subject.count).to eq parser.champions.count
    end
  end
end
