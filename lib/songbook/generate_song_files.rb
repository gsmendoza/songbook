# frozen_string_literal: true

require_relative 'generate_song_file'

module Songbook
  class GenerateSongFiles
    attr_reader :input_path, :output_path, :verbose

    def initialize(input_path:, output_path:, verbose: false)
      @input_path = input_path
      @output_path = output_path
      @verbose = verbose
    end

    def call
      Dir.glob("#{input_path}/*.yml") do |filename|
        basename = File.basename(filename, '.yml')

        output_file = "#{output_path}/#{basename}.txt"

        service = GenerateSongFile.new(
          input_path: filename,
          output_path: output_file,
          verbose: verbose
        )

        service.call
      end
    end
  end
end
