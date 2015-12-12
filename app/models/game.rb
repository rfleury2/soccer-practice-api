class Game < ActiveRecord::Base
	belongs_to :home_team, class_name: "Team"
	belongs_to :away_team, class_name: "Team"
	belongs_to :season
	belongs_to :league

	delegate :division, to: :season

	validates_presence_of :date, 
												:season, 
												:home_team, 
												:away_team, 
												:home_goals, 
												:away_goals

	validates_numericality_of :home_goals, 
														:away_goals

	def self.league(league_country)
		select do |game|
			game.league.country == league_country
		end
	end

	def self.top_flight
		select do |game|
			game.season.division == "1"
		end
	end

	def result
		return "W" if home_goals > away_goals
		return "D" if home_goals == away_goals
		return "L" if home_goals < away_goals
	end
end

