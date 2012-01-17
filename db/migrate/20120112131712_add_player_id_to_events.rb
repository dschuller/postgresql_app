class AddPlayerIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :player_id, :integer
  end
end
