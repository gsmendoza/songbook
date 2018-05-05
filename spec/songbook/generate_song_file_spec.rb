# frozen_string_literal: true

require 'songbook/generate_song_file'

RSpec.describe Songbook::GenerateSongFile do
  describe '#call' do
    let(:input_path) { 'spec/fixtures/Sister Hazel - All for You.yml' }
    let(:output_path) { 'spec/tmp/Sister Hazel - All for You.txt' }

    let(:expected_output) do
      File.read('spec/fixtures/Sister Hazel - All for You.txt')
    end

    subject(:service) do
      described_class.new(input_path: input_path, output_path: output_path)
    end

    after do
      File.delete(output_path)
    end

    it 'generates a song file for the song data YAML file' do
      service.call

      expect(File.read(output_path)).to eq(expected_output)
    end
  end
end
