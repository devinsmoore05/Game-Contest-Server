class PlayerMatch < ActiveRecord::Base
  validates :player, presence: true
  validates :match, presence: true


  belongs_to :player
  belongs_to :match
end
