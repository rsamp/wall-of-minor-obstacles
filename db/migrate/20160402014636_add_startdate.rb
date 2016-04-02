class AddStartdate < ActiveRecord::Migration
  def change
    add_column :users, :startdate, :datetime, default: 2015-10-22
  end
end
