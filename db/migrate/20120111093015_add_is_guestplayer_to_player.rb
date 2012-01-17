class AddIsGuestplayerToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :is_guestplayer, :boolean
  end
end
