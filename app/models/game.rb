class Game < ActiveRecord::Base
	belongs_to :home_team, class_name: "Team"
	belongs_to :away_team, class_name: "Team"

	validates_presence_of :date, :season, :home_team, :away_team, :home_goals, :away_goals, :division

	validates_numericality_of :home_goals, :away_goals
end

