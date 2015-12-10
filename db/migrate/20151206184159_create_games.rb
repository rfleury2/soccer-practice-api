class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
    	t.date 				:date
    	t.string  		:season
    	t.belongs_to  :home_team
    	t.belongs_to	:away_team
    	t.integer			:home_goals
    	t.integer			:away_goals
    	t.string 			:division
      t.string      :league
    end
  end
end
