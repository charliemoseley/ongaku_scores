class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.string :game, null: false, index: true
      t.string :versions, array: true, null: false
      t.string :jp_name
      t.string :en_name
      t.jsonb :scoring

      t.timestamps
    end

    add_index :songs, :versions, using: 'gin'
    add_index(:songs, [:game, :versions, :jp_name])
    add_index(:songs, [:game, :versions, :en_name])
  end
end
