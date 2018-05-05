# frozen_string_literal: true

require 'tty-table'

module Songbook
  class RenderSong
    SEPARATOR = [nil, nil].freeze
    TABLE_WIDTH = 80

    attr_reader :song

    def initialize(song)
      @song = song
    end

    def call
      <<~RESULT
        #{song.title}
        #{song.details}
        #{verses_table}
      RESULT
    end

    private

    def verses_table
      table = TTY::Table.new do |t|
        song.verses.each do |verse|
          t << [verse.title, nil]

          verse.lines.each do |line|
            t << [line.lyrics, line.chords]
          end

          t << SEPARATOR
        end
      end

      table.render(:basic, table_settings)
    end

    def table_settings
      { column_widths: [lyrics_column_width, nil], multiline: true }
    end

    def lyrics_column_width
      TABLE_WIDTH - chords_column_width - 1
    end

    def chords_column_width
      song.verses.flat_map(&:lines).flat_map(&:chords).map(&:length).max
    end
  end
end
