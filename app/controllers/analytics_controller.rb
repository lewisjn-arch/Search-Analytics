class AnalyticsController < ApplicationController
  def index
    @search_queries = SearchQuery.group(:query).order('count_id DESC').count('id')
  end
end
