class Traveller < ActiveRecord::Base
  validates :name,:email,:travel_date , presence: true
end
