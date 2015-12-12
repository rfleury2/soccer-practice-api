class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
    	t.string			:name
    	t.belongs_to  :league

    	t.timestamps null: false
    end
  end
end
