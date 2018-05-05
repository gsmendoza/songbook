# frozen_string_literal: true

require_relative 'verse'

module Songbook
  class Song
    attr_reader :title, :details, :chords, :lyrics

    def initialize(title:, details:, chords:, lyrics:)
      @title = title
      @details = details
      @chords = chords
      @lyrics = lyrics
    end

    def verses
      lyrics.map do |lyrics_verse|
        verse_title = find_verse_title(lyrics_verse)
        verse_lyrics = find_verse_lyrics(lyrics_verse)

        Verse.new(
          title: verse_title,
          lyrics: verse_lyrics,
          chords: chords[verse_title]
        )
      end
    end

    private

    def find_verse_title(lyrics_verse)
      if lyrics_verse.is_a?(String)
        lyrics_verse
      elsif lyrics_verse.is_a?(Hash)
        lyrics_verse.keys.first
      else
        raise "Unknown lyrics_verse type: #{lyrics_verse.class}"
      end
    end

    def find_verse_lyrics(lyrics_verse)
      if lyrics_verse.is_a?(String)
        find_matching_lyrics_verse(lyrics_verse).values.first
      elsif lyrics_verse.is_a?(Hash)
        lyrics_verse.values.first
      else
        raise "Unknown lyrics_verse type: #{lyrics_verse.class}"
      end
    end

    def find_matching_lyrics_verse(verse_title)
      lyrics
        .select { |lyrics_verse_i| lyrics_verse_i.is_a?(Hash) }
        .find do |lyrics_verse_i|
          lyrics_verse_i.keys.first == verse_title
        end
    end
  end
end
