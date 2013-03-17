class ChangeDefaultForWinner < ActiveRecord::Migration
  def up
     change_column :entries, :winner, :boolean, :default => false
  end

  def down
  end
end
