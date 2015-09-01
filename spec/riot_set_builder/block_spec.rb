require 'spec_helper'
require 'riot_set_builder/block'

RSpec.describe RiotSetBuilder::Block do
  describe "#initialize" do
    subject { described_class.new(test_options) }

    context "when valid options are passed" do
      context "when all options are passed" do
        let(:test_options) do
          {
            type: "Starting Items",
            rec_math: true,
            min_summoner_level: 12,
            max_summoner_level: 22,
            show_if_summoner_spell: "Flash",
            hide_if_summoner_spell: "Flash",
            items: "item"
          }

          it "assigns the correct values" do
            expect(subject).to have_attributes test_options
          end
        end

        context "when only required are passed" do
          let(:test_options) { {} }

          it "assigns default values" do
            expect(subject).to have_attributes(type: "Block", rec_math: false, min_summoner_level: -1, max_summoner_level: -1, show_if_summoner_spell: "", hide_if_summoner_spell: "", items: [])
          end
        end
      end

      context "when invalid options are passed" do
        shared_examples "a method that raises an error" do |error_class|
          it "raises an error" do
            expect{ subject }.to raise_error error_class
          end
        end

        context "when an invalid min_summoner_level is passed" do
          let(:test_options) { { min_summoner_level: -5 } }

          it_behaves_like "a method that raises an error", described_class::InvalidMinLevel
        end

        context "when an invalide max_summoner_level is passed" do
          let(:test_options) { { max_summoner_level: -5 } }

          it_behaves_like "a method that raises an error", described_class::InvalidMaxLevel
        end
      end
    end
  end
end
