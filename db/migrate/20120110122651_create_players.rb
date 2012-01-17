class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :email
      t.string :password_digest
      t.string :firstname
      t.string :lastname
      t.string :phone
      t.string :mobile
      t.string :color
      t.boolean :is_admin

      t.timestamps
    end
  end
end
