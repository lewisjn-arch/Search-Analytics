class SearchQuery < ApplicationRecord
  validates :query, presence: true
  validates :ip_address, presence: true
  validates :user_identifier, presence: true
end
