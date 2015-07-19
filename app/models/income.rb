class Income < ActiveRecord::Base
	validates :value, numericality: { greater_than: 0 }
end
