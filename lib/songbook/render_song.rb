# frozen_string_literal: true

require 'terminal-table'

module Songbook
  class RenderSong
    TABLE_STYLE = {
      width: 80,
      border_x: '',
      border_y: '',
      border_i: '',
      border_top: false,
      border_bottom: false
    }.freeze

    attr_reader :song

    def initialize(song)
      @song = song
    end

    def call
      result = <<~RESULT
         #{song.title}
         #{song.details}
        #{verses_table}
      RESULT

      result.chomp
    end

    private

    def verses_table
      Terminal::Table.new do |t|
        t.style = TABLE_STYLE

        song.verses.each do |verse|
          t << [verse.title]

          verse.lines.each do |line|
            t << [line.lyrics, line.chords]
          end

          t << :separator
        end
      end
    end
  end
end
