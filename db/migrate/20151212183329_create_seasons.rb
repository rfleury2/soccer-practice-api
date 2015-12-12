class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
    	t.string		 :year
    	t.string		 :division
    	t.belongs_to :league
    	
    	t.timestamps
    end
  end
end
