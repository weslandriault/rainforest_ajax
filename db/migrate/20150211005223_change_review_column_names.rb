class ChangeReviewColumnNames < ActiveRecord::Migration
  def change
  	remove_column :reviews, :users_id, :integer
  	remove_column :reviews, :products_id, :integer
  	add_column :reviews, :user_id, :integer
  	add_column :reviews, :product_id, :integer
  end
end
