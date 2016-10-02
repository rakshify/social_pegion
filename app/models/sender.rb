class Sender < ActiveRecord::Base
    validates :name,:email,:send_date_range , presence: true
end
