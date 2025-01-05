# frozen_string_literal: true

require "jon/version"

RSpec.describe Jon do
  it "has a version number" do
    expect(Jon::VERSION).not_to be nil
  end
end
