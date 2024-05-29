require 'rails_helper'

RSpec.describe SearchQuery, type: :model do
  it "logs the search query" do
    search_query = SearchQuery.create(query: "test query", ip_address: "127.0.0.1", user_identifier: "test_user")
    expect(SearchQuery.count).to eq(1)
  end
end
