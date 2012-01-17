class AddMatchdateIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :matchdate_id, :integer
  end
end
