class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
    	t.string			:country

      t.timestamps null: false
    end
  end
end
