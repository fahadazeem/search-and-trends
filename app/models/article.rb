class Article < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_title, against: :title

  scope :trending, -> {order(search_count: :desc).limit(3)}

  validates :title, presence: true
  validates :body, presence: true
end
