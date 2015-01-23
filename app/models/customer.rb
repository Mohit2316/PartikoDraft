class Customer < ActiveRecord::Base
	has_many :events
	has_many :deals
	
end
