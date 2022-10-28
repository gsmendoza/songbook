# frozen_string_literal: true

require 'yaml'
require_relative 'song'
require_relative 'render_song'

module Songbook
  class GenerateSongFile
    attr_reader :input_path, :output_path, :verbose

    def initialize(input_path:, output_path:, verbose: false)
      @input_path = input_path
      @output_path = output_path
      @verbose = verbose
    end

    def call
      puts "Generating #{output_path}..." if verbose

      File.open(output_path, 'w') { |file| file.write(song_text) }
    end

    private

    def song_text
      @song_text ||= RenderSong.new(song).call
    end

    def song
      table_width = song_data['config']['table_width'] if song_data['config']

      @song ||= Song.new(
        title: File.basename(input_path, '.yml'),
        details: song_data['details'],
        chords: song_data['chords'],
        lyrics: song_data['lyrics'],
        table_width: table_width
      )
    end

    def song_data
      @song_data ||= YAML.load_file(input_path)
    end
  end
end
