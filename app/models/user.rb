class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :events, through: :rsvps
  has_many :rsvps
  has_many :bars
  has_one :profile


  def bar_owner?
    self.bars.size > 0 ? true : false
  end

  def owns_bar?(bar)
    self.bars.include?(bar) ? true : false
  end

  def has_profile?
    self.profile != nil
  end
end
