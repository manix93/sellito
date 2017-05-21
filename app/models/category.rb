class Category < ApplicationRecord
  # uniqueness sprawdza unikatowosc, presence nie dopuszcza pustych elementow
  has_many :post_categories
  has_many :posts, through: :post_categories

  validates :name, presence: true, uniqueness: true
end
