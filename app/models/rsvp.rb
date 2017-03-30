class Rsvp < ApplicationRecord
  belongs_to :user
  belongs_to :event
  validates :event, uniqueness: {scope: :user}
end
