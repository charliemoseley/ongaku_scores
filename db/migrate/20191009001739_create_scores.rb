class CreateScores < ActiveRecord::Migration[6.0]
  def change
    create_table :scores do |t|
      t.references :user, null: false, foreign_key: true
      t.references :song, null: false, foreign_key: true
      t.string :game, null: false, index: true
      t.string :letter_grade
      t.integer :main_score, index: true
      t.integer :technical_score
      t.decimal :percentage_score, index: true
      t.jsonb :detailed_score

      t.timestamps
    end
  end
end
