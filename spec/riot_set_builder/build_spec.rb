require 'spec_helper'
require 'riot_set_builder/build'

RSpec.describe RiotSetBuilder::Build do
  describe "#initialize" do
    subject { described_class.new(test_options) }

    context "when valid options are passed" do

      context "when all options are passed" do
        let(:test_options) do
          {
            title: "PB - Dyrus",
            champion: :Lulu,
            type: "custom",
            map: "TT",
            mode: "CLASSIC",
            priority: true,
            sortrank: 1,
            blocks: []
          }
        end

        it "assigns the correct values" do
          expect(subject).to have_attributes test_options
        end
      end

      context "when only required options are passed" do
        let(:test_options) { { title: "PB - Dyrus" } }

        it "assigns default values" do
          expect(subject).to have_attributes(type: "global", map: "SR", mode: "any", priority: false, sortrank: 0, blocks: [])
        end
      end
    end

    context "when invalid options are passed" do

      shared_examples "a method that raises an error" do |error_class|
        it "raises an error" do
          expect{ subject }.to raise_error error_class
        end
      end

      context "when no title is passed" do
        let(:test_options) { {} }

        it_behaves_like "a method that raises an error", described_class::NoTitle
      end

      context "when an invalid type is passed" do
        let(:test_options) { { title: "PB - Dyrus", type: "RitoPlz" } }

        it_behaves_like "a method that raises an error", described_class::InvalidType
      end

      context "when an invalid map is passed" do
        let(:test_options) { { title: "PB - Dyrus", map: "KK" } }

        it_behaves_like "a method that raises an error", described_class::InvalidMap
      end

      context "when an invalid mode is passed" do
        let(:test_options) { { title: "PB - Dyrus", mode: "Sandbox" } }

        it_behaves_like "a method that raises an error", described_class::InvalidMode
      end
    end
  end
end
