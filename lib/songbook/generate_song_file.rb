# frozen_string_literal: true

require 'yaml'
require_relative 'song'
require_relative 'render_song'

module Songbook
  class GenerateSongFile
    attr_reader :input_path, :output_path

    def initialize(input_path:, output_path:)
      @input_path = input_path
      @output_path = output_path
    end

    def call
      song_data = YAML.load_file(input_path)

      song = Song.new(
        title: File.basename(input_path, '.yml'),
        details: song_data['details'],
        chords: song_data['chords'],
        lyrics: song_data['lyrics']
      )

      song_text = RenderSong.new(song).call

      File.open(output_path, 'w') { |file| file.write(song_text) }
    end
  end
end
