# frozen_string_literal: true

require 'songbook/verse'

RSpec.describe Songbook::Verse do
  let(:title) { 'Verse' }

  let(:first_line_lyrics) { 'Finally I figured out' }

  let(:lyrics) do
    <<~VERSE
      #{first_line_lyrics}
      But it took a long, long time
      But now there's a turnabout
      Maybe cause I'm trying
    VERSE
  end

  let(:first_line_chords) { '<Am>- <D>-' }

  let(:chords) do
    <<~VERSE
      #{first_line_chords}
      <Am>- <D>-
      <Am>- <D>-
      <Am>- <D>-
    VERSE
  end

  subject(:verse) do
    described_class.new(title: title, chords: chords, lyrics: lyrics)
  end

  describe '#lines' do
    it 'are the lines of the verse' do
      line = verse.lines[0]
      expect(line.lyrics).to eq(first_line_lyrics)
      expect(line.chords).to eq(first_line_chords)
    end
  end
end
