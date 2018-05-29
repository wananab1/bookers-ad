class PostScore < ActiveRecord::Migration[5.1]
  def change
  	drop_table :post_scores
  end
end
