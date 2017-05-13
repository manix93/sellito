class Post < ApplicationRecord
  # TODO handle managing photos
  belongs_to :user
  validates :title, :expiration_date, presence: true
  validate :expiration_date_cannot_be_in_the_past

  def expiration_date_cannot_be_in_the_past
    if expiration_date < Date.today
      errors.add(:expiration_date, "can't be in the past" )
    end
  end
end
