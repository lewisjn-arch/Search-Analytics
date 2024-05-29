require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end

    it "logs the search query" do
      get :index, params: { query: "test query" }
      expect(SearchQuery.count).to eq(1)
    end
  end
end
