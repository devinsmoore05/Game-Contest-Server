class Contest < ActiveRecord::Base
  belongs_to :user
  belongs_to :referee
end
