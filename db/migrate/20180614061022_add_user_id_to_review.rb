class AddUserIdToReview < ActiveRecord::Migration[5.1]
  def change
    add_index :reviews, :user_id
  end
end
