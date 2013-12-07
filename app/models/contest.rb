class Contest < ActiveRecord::Base
  validates :user, presence: true
  validates :referee, presence: true
  validates :name, presence: true
  validate :start_after_deadline
  validates :start, presence: true
  validates :deadline, presence: true
  
  belongs_to :user
  belongs_to :referee
  has_many :players
  has_many :matches
  
  
  def start_after_deadline
    errors.add(:start, "Can't be after the deadline") if start and deadline and start - deadline < 0
  end
end
