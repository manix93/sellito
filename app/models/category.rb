class Category < ApplicationRecord
  # uniqueness sprawdza unikatowość, presence nie dopuszcza pustych elementów
  validates :name, presence: true, uniqueness: true
end
