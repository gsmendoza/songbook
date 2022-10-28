# frozen_string_literal: true

require 'songbook/generate_song_files'

RSpec.describe Songbook::GenerateSongFiles do
  describe '#call' do
    context 'by default' do
      let(:input_dir) { 'spec/fixtures' }
      let(:output_dir) { 'spec/tmp' }
      let(:input_path) { "#{input_dir}/Sister Hazel - All for You.yml" }
      let(:output_path) { "#{output_dir}/Sister Hazel - All for You.txt" }

      let(:expected_output) do
        File.read("#{input_dir}/Sister Hazel - All for You.txt")
      end

      subject(:service) do
        described_class.new(input_path: input_dir, output_path: output_dir)
      end

      after do
        File.delete(output_path)
      end

      it 'generates a song file for the song data YAML file' do
        service.call

        expect(File.read(output_path)).to eq(expected_output)
      end
    end

    context 'with table width' do
      let(:input_dir) { 'spec/fixtures' }
      let(:output_dir) { 'spec/tmp' }
      let(:input_path) { "#{input_dir}/Asin - Ang Bayan Kong Sinilangan - Cotabato.yml" }
      let(:output_path) { "#{output_dir}/Asin - Ang Bayan Kong Sinilangan - Cotabato.txt" }

      let(:expected_output) do
        File.read("#{input_dir}/Asin - Ang Bayan Kong Sinilangan - Cotabato.txt")
      end

      subject(:service) do
        described_class.new(input_path: input_dir, output_path: output_dir)
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
end
