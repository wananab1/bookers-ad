class AddScoreToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :score, :integer
  end
end
