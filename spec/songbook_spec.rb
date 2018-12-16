# frozen_string_literal: true

RSpec.describe Songbook do
  it 'has a version number' do
    expect(Songbook::VERSION).not_to be nil
  end

  describe '#select_input_path' do
    context 'when path is given' do
      let(:path) { 'some-path' }

      it 'returns the path' do
        expect(described_class.select_input_path(path)).to eq(path)
      end
    end

    context 'when path is nil' do
      let(:path) { nil }

      it 'returns the present working directory' do
        expect(described_class.select_input_path(path)).to eq('.')
      end
    end
  end

  describe '#select_output_path' do
    let(:input_path) { 'some-input-path' }

    subject(:select_output_path) do
      described_class.select_output_path(
        input_path: input_path, output_path: output_path
      )
    end

    context 'when output_path is given' do
      let(:output_path) { 'some-output-path' }

      it 'returns the path' do
        expect(select_output_path).to eq(output_path)
      end
    end

    context 'when output path is nil' do
      let(:output_path) { nil }

      context 'when input path does not exist' do
        let(:input_path) { 'non-existent-path' }

        before do
          expect(Pathname.new(input_path).exist?).to be_falsey
        end

        it 'raises an argument error' do
          expect { select_output_path }.to raise_error
        end
      end

      context 'when input path is a file' do
        let(:input_path) { 'spec/fixtures/Sister Hazel - All for You.yml' }

        before do
          expect(Pathname.new(input_path).file?).to be_truthy
        end

        it 'returns the input path with the extension changed to txt' do
          expect(select_output_path)
            .to eq('spec/fixtures/Sister Hazel - All for You.txt')
        end
      end

      context 'when the input path is a directory' do
        let(:input_path) { 'spec/fixtures' }

        it 'returns the input path' do
          expect(select_output_path).to eq(input_path)
        end
      end
    end
  end
end
