# frozen_string_literal: true

require 'ostruct'

module Songbook
  class Verse
    attr_reader :title, :chords, :lyrics

    def initialize(title:, chords:, lyrics:)
      raise "Verse '#{title} chords is nil" if chords.nil?

      @title = title
      @chords = chords
      @lyrics = lyrics
    end

    # rubocop:disable Metrics/AbcSize
    def lines
      if lyric_lines.length != chord_lines.length
        raise "'#{title}' lyrics length doesn't match chords length:\n\n" \
          "#{lyric_lines}\n\nversus\n\n#{chord_lines}"
      end

      lyric_lines.map.with_index do |lyric_line, i|
        OpenStruct.new(lyrics: lyric_line, chords: chord_lines[i])
      end
    end
    # rubocop:enable Metrics/AbcSize

    def formatted_title
      "[#{title}]"
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
