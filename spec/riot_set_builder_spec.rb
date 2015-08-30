require 'spec_helper'

describe RiotSetBuilder do
  it 'has a version number' do
    expect(RiotSetBuilder::VERSION).not_to be nil
  end

  it 'assigns default configuration' do
    expect(described_class.league_path).to eq described_class::Configuration::DEFAULT_KEYS[:league_path]
  end

  describe '.configure' do
    context 'when entering valid options' do
      subject do
        described_class.configure do |config|
          config.league_path = '/league_path'
        end
      end

      it 'changes the option' do
        expect(described_class.league_path).to eq './'
        subject
        expect(described_class.league_path).to eq '/league_path'
      end
    end

    context 'when entering invalid options' do
      subject do
        described_class.configure do |config|
          config.invalid_option = ''
        end
      end

      it 'raises an error' do
        expect { subject }.to raise_error NoMethodError
      end
    end
  end

  describe '.options' do
    subject { described_class.options }

    it 'should return a hash of options' do
      expect(subject).to be_a Hash
      expect(subject[:league_path]).to eq described_class.league_path
    end
  end

  describe '.reset_config' do
    subject { described_class.reset_config }

    before do
      described_class.configure do |config|
        config.league_path = "hahaha"
      end
    end

    it "resets config to default values" do
      subject
      expect(described_class.league_path).to eq described_class::Configuration::DEFAULT_KEYS[:league_path]
    end
  end
end
