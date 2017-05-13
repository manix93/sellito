class Post < ApplicationRecord
  # TODO handle managing photos
  belongs_to :user
  validates :title, :expiration_date, presence: true
end
