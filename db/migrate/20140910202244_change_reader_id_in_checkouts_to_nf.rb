class ChangeReaderIdInCheckoutsToNf < ActiveRecord::Migration
  def up
    change_column :checkouts, :reader_id, :integer, null: false
  end

  def down
    change_column :checkouts, :reader_id, :integer
  end

end
