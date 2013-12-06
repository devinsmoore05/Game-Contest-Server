require 'uri'
class Referee < ActiveRecord::Base
  belongs_to :user #Signifies 1 to many relationship
  has_many :contests
  has_many :matches, as: :manager
  
  validates :name, presence: true, uniqueness: true, length: {maximum: 25}
  validates :rules_url, presence: true, format: URI.regexp #/[\w-]+.[a-zA-Z]+.[a-zA-Z]+.[\w]{2,3}/
  validates :players_per_game, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 11}

  include Uploadable
  
end
