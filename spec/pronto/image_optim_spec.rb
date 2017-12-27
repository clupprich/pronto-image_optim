require 'spec_helper'


describe Pronto::ImageOptim do
  subject { described_class.new(patches) }

  describe '#run' do
    context 'patches are nil' do
      let(:patches) { nil }

      it 'returns no messages' do
        expect(subject.run).to eq []
      end
    end

    context 'patches are empty' do
      let(:patches) { [] }

      it 'returns no messages' do
        expect(subject.run).to eq []
      end
    end
  end
end
