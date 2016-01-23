class UserRejections < ActiveRecord::Migration
  def change
    add_column :users, :display_name, :string
    add_column :users, :rejections, :integer, null: false, default: 0
  end
end
