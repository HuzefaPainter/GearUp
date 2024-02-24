class AddAccessLevelToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :access_level, :integer, default: 1, null: false
  end
end
