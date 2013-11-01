class Player < ActiveRecord::Base
  belongs_to :user
  belongs_to :contest
  has_many :player_matches
end
