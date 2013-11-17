require 'uri'
class Referee < ActiveRecord::Base
  belongs_to :user #Signifies 1 to many relationship
  has_many :contests
  has_many :matches, as: :manager
  
  validates :name, presence: true, uniqueness: true, length: {maximum: 25}
  validates :rules_url, presence: true, format: URI.regexp #/[\w-]+.[a-zA-Z]+.[a-zA-Z]+.[\w]{2,3}/
  validates :players_per_game, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 11}
  validates :file_location, presence: true
  
  def upload=(uploaded_io)
    if uploaded_io.nil?
      #problem--deal with later.
    else
      time_no_spaces = Time.now.to_s.gsub(/\s/, '_')
      file_location = Rails.root.join('code', 
                                      'referees', 
                                      Rails.env, 
                                      #time_no_spaces + current_user.id.to_s).to_s
                                      time_no_spaces).to_s
      
      IO::copy_stream(uploaded_io, file_location)
      self.file_location = file_location
    end
  end
end
