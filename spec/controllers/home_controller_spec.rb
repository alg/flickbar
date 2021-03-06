require 'spec_helper'

describe HomeController do
  describe "get index" do
    before do
      get :index
    end

    it { should respond_with :success }
    it { should assign_to :recent_users }
    it { should assign_to :recent_movies }
  end
end
