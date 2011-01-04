class AddCountToLinks < ActiveRecord::Migration
  def self.up
    add_column :links, :count, :integer
  end

  def self.down
    remove_column :links, :count
  end
end
