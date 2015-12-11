class Game < ActiveRecord::Base
	belongs_to :home_team, class_name: "Team"
	belongs_to :away_team, class_name: "Team"

	validates_presence_of :date, 
												:season, 
												:home_team, 
												:away_team, 
												:home_goals, 
												:away_goals, 
												:division,
												:league

	validates_numericality_of :home_goals, 
														:away_goals

	scope :german, 	-> { where(league: 'Germany') }
	scope :italian, -> { where(league: 'Italy') }
	scope :english, -> { where(league: 'England') }
	scope :spanish, -> { where(league: 'Spain') }
	scope :dutch, 	-> { where(league: 'Holland') }

	scope :top_flight, 	-> { where(division: "1") }

	def result
		return "W" if home_goals > away_goals
		return "D" if home_goals == away_goals
		return "L" if home_goals < away_goals
	end
end

