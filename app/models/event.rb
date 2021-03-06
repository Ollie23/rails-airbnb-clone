class Event < ApplicationRecord
  belongs_to :bar
  has_many :users, through: :rsvps
  has_many :rsvps
  validates :title, presence: true
  validates :date, presence: true
  mount_uploader :photo, PhotoUploader

  def sorted
    self.order(:date)
  end

  def is_attending?(user)
    self.users.pluck(:id).include?(user.id) ? true : false
  end

  def has_photo?
    self.photo = nil
  end
end
