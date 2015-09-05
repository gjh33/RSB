require 'spec_helper'
require 'riot_set_builder/pro_builds/champion_page'

RSpec.describe RiotSetBuilder::ProBuilds::ChampionPage do
  let(:champion_page) { described_class.new(:Aatrox) }

  describe "#recent_builds" do
    subject { champion_page.recent_builds }

    it "returns a list of builds for a champion" do
      expect(subject).not_to be_empty
      expect(subject).to all(be_a RiotSetBuilder::Build)
      expect(subject).to all(have_attributes champion: :Aatrox)
    end
  end
end
