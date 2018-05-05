# frozen_string_literal: true

require 'songbook/generate_song_file'

RSpec.describe Songbook::GenerateSongFile do
  describe '#call' do
    let(:input_path) { 'spec/tmp/Sister Hazel - All for You.yml' }
    let(:output_path) { 'spec/tmp/Sister Hazel - All for You.txt' }

    let(:input) do
      <<~INPUT
        details: |
          Capo on 1st fret

        chords:
          Intro: |
            <G>---

          Verse: &verse |
            <Am>- <D>-
            <Am>- <D>-
            <Am>- <D>-
            <Am>- <D>-

          Verse 1:
            *verse

          Verse 2:
            *verse

          Refrain: |
            <Em>- <Am>-
            <Em>- <Am>-
            <Em>- <Am>-
            <D>---

          Chorus: |
            <G> <C> <Am> <D>
            <G> <C> <Am> <D>
            <G> <C> <Am> <D>
            <G> <C> <Am> <D>
            <G> <C> <G>-

          Solo: |
            <G> <C> <Am> <D> 8x

          Bridge: |
            <C>- <Em>-
            <C>- <Em>-
            <C>- <Em>-
            <C>- <D>---

        lyrics:
          - Intro: |
              ...

          - Verse 1: |
               Finally I figured out
               But it took a long, long time
               But now there's a turnabout
               Maybe cause I'm trying

          - Refrain: |
              There's been times, I'm so confused
              All my roads, they lead to you
              I just can't turn
              And walk away

          - Chorus: |
              It's hard to say what it is I see in you
              Wonder if I'll always be with you
              But words can't say, and I can't do
              Enough to prove,
              it's all for you

          - Verse 2: |
              I thought I'd seen it all
              Cause it's been a long, long time
              But then we'll trip and fall
              Wondering if I'm blind

          - Refrain

          - Chorus

          - Bridge: |
              Rain comes pouring down
              Falling from blue skies
              Words without a sound
              Coming from your eyes

          - Solo: |
              ...

          - Verse 1

          - Refrain

          - Chorus
      INPUT
    end

    let(:expected_output) do
      <<-EXPECTED_OUTPUT
 Sister Hazel - All for You
 Capo on 1st fret

 Intro
 ...                                       <G>---

 Verse 1
 Finally I figured out                     <Am>- <D>-
 But it took a long, long time             <Am>- <D>-
 But now there's a turnabout               <Am>- <D>-
 Maybe cause I'm trying                    <Am>- <D>-

 Refrain
 There's been times, I'm so confused       <Em>- <Am>-
 All my roads, they lead to you            <Em>- <Am>-
 I just can't turn                         <Em>- <Am>-
 And walk away                             <D>---

 Chorus
 It's hard to say what it is I see in you  <G> <C> <Am> <D>
 Wonder if I'll always be with you         <G> <C> <Am> <D>
 But words can't say, and I can't do       <G> <C> <Am> <D>
 Enough to prove,                          <G> <C> <Am> <D>
 it's all for you                          <G> <C> <G>-

 Verse 2
 I thought I'd seen it all                 <Am>- <D>-
 Cause it's been a long, long time         <Am>- <D>-
 But then we'll trip and fall              <Am>- <D>-
 Wondering if I'm blind                    <Am>- <D>-

 Refrain
 There's been times, I'm so confused       <Em>- <Am>-
 All my roads, they lead to you            <Em>- <Am>-
 I just can't turn                         <Em>- <Am>-
 And walk away                             <D>---

 Chorus
 It's hard to say what it is I see in you  <G> <C> <Am> <D>
 Wonder if I'll always be with you         <G> <C> <Am> <D>
 But words can't say, and I can't do       <G> <C> <Am> <D>
 Enough to prove,                          <G> <C> <Am> <D>
 it's all for you                          <G> <C> <G>-

 Bridge
 Rain comes pouring down                   <C>- <Em>-
 Falling from blue skies                   <C>- <Em>-
 Words without a sound                     <C>- <Em>-
 Coming from your eyes                     <C>- <D>---

 Solo
 ...                                       <G> <C> <Am> <D> 8x

 Verse 1
 Finally I figured out                     <Am>- <D>-
 But it took a long, long time             <Am>- <D>-
 But now there's a turnabout               <Am>- <D>-
 Maybe cause I'm trying                    <Am>- <D>-

 Refrain
 There's been times, I'm so confused       <Em>- <Am>-
 All my roads, they lead to you            <Em>- <Am>-
 I just can't turn                         <Em>- <Am>-
 And walk away                             <D>---

 Chorus
 It's hard to say what it is I see in you  <G> <C> <Am> <D>
 Wonder if I'll always be with you         <G> <C> <Am> <D>
 But words can't say, and I can't do       <G> <C> <Am> <D>
 Enough to prove,                          <G> <C> <Am> <D>
 it's all for you                          <G> <C> <G>-
      EXPECTED_OUTPUT
    end

    subject(:service) do
      described_class.new(input_path: input_path, output_path: output_path)
    end

    before do
      File.open(input_path, 'w') { |file| file.write(input) }
    end

    it 'generates a song file for the song data YAML file' do
      service.call

      expect(File.read(output_path)).to eq(expected_output)
    end
  end
end
