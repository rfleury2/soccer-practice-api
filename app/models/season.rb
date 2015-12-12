class Season < ActiveRecord::Base
	has_many :games

	belongs_to :league

	validates_presence_of :year
	validates_presence_of :division
end
