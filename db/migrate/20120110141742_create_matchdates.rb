class CreateMatchdates < ActiveRecord::Migration
  def change
    create_table :matchdates do |t|
      t.date :date
      t.string :note

      t.timestamps
    end
  end
end
