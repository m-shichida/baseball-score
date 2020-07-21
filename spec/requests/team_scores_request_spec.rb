require 'rails_helper'

RSpec.describe "TeamScores", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/team_scores/index"
      expect(response).to have_http_status(:success)
    end
  end

end
