require 'spec_helper'

RSpec.describe RiotSetBuilder::Item do
  describe "#initialize" do
    subject { described_class.new(test_options) }

    context "when valid options are passed" do

      context "when all options are passed" do
        let(:test_options) do
          {
            id: 1234,
            count: 3
          }
        end

        it "assigns the correct values" do
          expect(subject).to have_attributes(id: 1234, count: 3)
        end
      end

      context "when only required options are passed" do
        let(:test_options) do
          {
            id: 1234
          }
        end

        it "assigns default values" do
          expect(subject).to have_attributes(id:1234, count: 1)
        end
      end
    end

    context "when invalid options are passed" do

      shared_examples "a method that raises an error" do |error_class|
        it "raises an error" do
          expect { subject }.to raise_error error_class
        end
      end

      context "when no id is passed" do
        let(:test_options) { {} }

        it_behaves_like "a method that raises an error", described_class::NoID
      end

      context "when an invalid item count is passed" do
        let(:test_options) do
          {
            id: 1234,
            count: -1
          }
        end

        it_behaves_like "a method that raises an error", described_class::InvalidCount
      end
    end
  end
end
