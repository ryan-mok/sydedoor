class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :user_id
      t.string :company_id
      t.text :description
      t.integer :rating

      t.timestamps
    end
  end
end
