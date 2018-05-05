# frozen_string_literal: true

require 'ostruct'

module Songbook
  class Verse
    attr_reader :title, :chords, :lyrics

    def initialize(title:, chords:, lyrics:)
      @title = title
      @chords = chords
      @lyrics = lyrics
    end

    def lines
      lyric_lines.map.with_index do |lyric_line, i|
        OpenStruct.new(lyrics: lyric_line, chords: chord_lines[i])
      end
    end

    private

    def lyric_lines
      @lyric_lines ||= lyrics.split("\n")
    end

    def chord_lines
      @chord_lines ||= chords.split("\n")
    end
  end
end
