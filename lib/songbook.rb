# frozen_string_literal: true

require 'pathname'
require 'songbook/version'

module Songbook
  def self.select_input_path(path)
    path || '.'
  end

  def self.select_output_path(input_path:, output_path:)
    if output_path
      output_path
    elsif !Pathname.new(input_path).exist?
      raise "Cannot find input_path '#{input_path}'"
    elsif Pathname.new(input_path).file?
      input_path.sub(/\.ya?ml$/, '.txt')
    else
      input_path
    end
  end
end
