class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :price_in_cents

      t.timestamps null: false
    end
  end

  has_many :reviews
  has_many :users, through: :reviews

end
