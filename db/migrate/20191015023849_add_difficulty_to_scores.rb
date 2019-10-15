class AddDifficultyToScores < ActiveRecord::Migration[6.0]
  def change
    add_column :scores, :difficulty, :string
  end
end
