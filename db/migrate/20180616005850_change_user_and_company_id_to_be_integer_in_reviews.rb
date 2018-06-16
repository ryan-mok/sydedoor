class ChangeUserAndCompanyIdToBeIntegerInReviews < ActiveRecord::Migration[5.1]
  def change
    change_column :reviews, :user_id, :integer
    change_column :reviews, :company_id, :integer
  end
end
