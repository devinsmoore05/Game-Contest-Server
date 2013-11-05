class Contest < ActiveRecord::Base
  validates :user, presence: true
  validates :referee, presence: true
  
  belongs_to :user
  belongs_to :referee
  has_many :players
  has_many :matches
end
