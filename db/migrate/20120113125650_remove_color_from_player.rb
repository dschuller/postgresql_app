class RemoveColorFromPlayer < ActiveRecord::Migration
  def up
    remove_column :players, :color
  end

  def down
    add_column :players, :color, :string
  end
end
