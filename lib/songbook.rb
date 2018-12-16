# frozen_string_literal: true

require 'songbook/version'

module Songbook
  def self.select_input_path(path)
    path || '.'
  end

  def self.select_output_path(input_path:, output_path:)
    output_path || input_path
  end
end
