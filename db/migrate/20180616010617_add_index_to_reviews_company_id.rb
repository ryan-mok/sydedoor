class AddIndexToReviewsCompanyId < ActiveRecord::Migration[5.1]
  def change
      add_index :reviews, :company_id
  end
end
