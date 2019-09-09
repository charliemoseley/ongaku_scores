class CreateOauths < ActiveRecord::Migration[6.0]
  def change
    create_table :oauths do |t|
      t.string :provider
      t.string :uid
      t.string :email
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :picture

      t.timestamps
    end
  end
end
