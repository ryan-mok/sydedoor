class AddUserIdToReview < ActiveRecord::Migration[5.1]
  def change
    add_index  :reviews, :user_id
    #Creates another user_id column
    #add_reference :reviews, :user, index: true, foreign_key: true
  end
end
