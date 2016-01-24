class AddUserColor < ActiveRecord::Migration
  def change
    add_column :users, :color, :string, default: "#000000"
  end
end
