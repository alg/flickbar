require 'spec_helper'

describe Movie do
  it "should find or create movie by title" do
    title = 'The Godfather'
    Movie.find_or_create(title).should_not be_nil
  end
end
