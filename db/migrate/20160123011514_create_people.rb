class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.integer :rejection_count, default: 0

      t.timestamps null: false
    end

    add_index :people, :name, unique: true
  end
end
