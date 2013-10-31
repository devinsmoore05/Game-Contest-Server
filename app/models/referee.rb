class Referee < ActiveRecord::Base
  belongs_to :user #Signifies 1 to many relationship
  has_many :contests
  has_many :matches, as: :manager
end
