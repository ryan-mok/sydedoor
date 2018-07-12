class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :company_id
      t.text :description
      t.float :rating
      t.string :job_title
      t.string :term
      t.integer :year
      t.string :salary
      t.string :location

      t.timestamps
    end
  end
end
