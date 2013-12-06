module Uploadable
  extend ActiveSupport::Concern
  
  included do
    validates :file_location, presence: true
  end
  
  def upload=(uploaded_io)
    if uploaded_io.nil?
      #problem--deal with later.
    else
      time_no_spaces = Time.now.to_s.gsub(/\s/, '_')
      file_location = Rails.root.join('code', 
                                      self.class.to_s.pluralize.downcase, 
                                      Rails.env, 
                                      #time_no_spaces + current_user.id.to_s).to_s
                                      time_no_spaces).to_s
      
      IO::copy_stream(uploaded_io, file_location)
      self.file_location = file_location
    end
  end
end