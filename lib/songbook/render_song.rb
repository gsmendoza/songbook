# frozen_string_literal: true

require 'tty-table'

module Songbook
  class RenderSong
    SEPARATOR = [nil, nil].freeze
    LYRICS_CHORDS_SEPARATOR = '   '

    attr_reader :song

    def initialize(song)
      @song = song
    end

    def call
      result = <<~RESULT
        #{song.title}\n
        #{song.details}
        #{verses_table}
      RESULT

      result.split("\n").map(&:rstrip).join("\n")
    end

    private

    # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    def verses_table
      table = TTY::Table.new do |t|
        song.verses.each do |verse|
          t << ["[#{verse.title}]", nil]

          verse.lines.each do |line|
            t << [line.chords, line.lyrics]
          end

          t << SEPARATOR
        end
      end

      table.render(:basic, table_settings) do |renderer|
        renderer.border do
          center LYRICS_CHORDS_SEPARATOR
        end
      end
    end
    # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

    def table_settings
      { column_widths: [chords_column_width, lyrics_column_width], multiline: true }
    end

    def lyrics_column_width
      [
        song.table_width - chords_column_width - LYRICS_CHORDS_SEPARATOR.length,
        max_lyrics_column_width
      ].min
    end

    def max_lyrics_column_width
      song.verses.flat_map(&:lines).flat_map(&:lyrics).map(&:length).max
    end

    def chords_column_width
      song.verses.flat_map(&:lines).flat_map(&:chords).map(&:length).max
    end
  end
end
