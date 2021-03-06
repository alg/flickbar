require 'spec_helper'

describe Watch do
  it { should belong_to :user }
  it { should belong_to :movie }

  it { should validate_presence_of :user_id }
  it { should validate_presence_of :movie_id }

  before do
    @user = Factory :user
    @movie = Factory :movie
  end

  context "watched while ago" do
    before do
      Timecop.travel(10.days.ago) do
        @watch = Factory :watch, :movie => @movie, :user => @user
      end
    end

    it "should allow to create new watch" do
      @watch_again = Factory.build :watch, :movie => @movie, :user => @user
      @watch_again.should have(0).errors
    end
  end

  context "recently watched" do
    before do
      @watch = Factory :watch, :movie => @movie, :user => @user
    end

    it "should not allow to create new watch" do
      @watch_again = Factory.build :watch, :movie => @movie, :user => @user
      @watch_again.should have(1).error_on(:base)
    end
  end
end
