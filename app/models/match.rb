class Match < ActiveRecord::Base  
  belongs_to :manager, polymorphic: true
  has_many :player_matches
  has_many :players, through: :player_matches
  
  
  validates :manager, presence: true
  validates :status, presence: true
  #validates :type, presence: true
  # Make a function with this one validates_datetime :start, :before => :deadline

  
end
