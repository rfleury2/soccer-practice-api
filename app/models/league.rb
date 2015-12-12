class League < ActiveRecord::Base
	has_many :teams
	has_many :seasons
	has_many :games

	validates_presence_of :country
	validates_inclusion_of :country, :in => %w(england germany holland italy spain)
end
