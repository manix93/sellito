class Category < ApplicationRecord
  # uniqueness sprawdza unikatowosc, presence nie dopuszcza pustych elementow
  validates :name, presence: true, uniqueness: true
end
