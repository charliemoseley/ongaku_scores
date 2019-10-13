class AddUserIdToOauths < ActiveRecord::Migration[6.0]
  def change
    add_column :oauths, :user_id, :integer, null: false, foreign_key: true
  end
end
