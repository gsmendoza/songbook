# frozen_string_literal: true

RSpec.describe Songbook do
  it 'has a version number' do
    expect(Songbook::VERSION).not_to be nil
  end
end
