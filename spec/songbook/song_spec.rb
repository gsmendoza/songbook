# frozen_string_literal: true

require 'songbook/song'

RSpec.describe Songbook::Song do
  let(:title) { 'Song Title' }
  let(:details) { nil }

  let(:first_verse_title) { 'Verse' }

  let(:first_line_lyrics) { 'Finally I figured out' }
  let(:first_line_chords) { '<Am>- <D>-' }

  let(:lyrics) do
    [
      {
        first_verse_title => <<~VERSE
          #{first_line_lyrics}
          But it took a long, long time
          But now there's a turnabout
          Maybe cause I'm trying
        VERSE
      },
      first_verse_title
    ]
  end

  let(:chords) do
    {
      'Verse' => <<~VERSE
        #{first_line_chords}
        <Am>- <D>-
        <Am>- <D>-
        <Am>- <D>-
      VERSE
    }
  end

  subject(:song) do
    described_class.new(
      title: title, details: details, chords: chords, lyrics: lyrics
    )
  end

  describe '#verses' do
    it 'are the verses of the song' do
      first_verse = song.verses[0]
      expect(first_verse.title).to eq(first_verse_title)

      line = first_verse.lines[0]
      expect(line.lyrics).to eq(first_line_lyrics)
      expect(line.chords).to eq(first_line_chords)

      second_verse = song.verses[1]
      expect(second_verse.title).to eq(first_verse_title)

      line = second_verse.lines[0]
      expect(line.lyrics).to eq(first_line_lyrics)
      expect(line.chords).to eq(first_line_chords)
    end
  end
end
