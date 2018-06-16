class AddIndexToReviewsCompanyId < ActiveRecord::Migration[5.1]
  def change
    def change
      add_index :reviews, :company_id
    end
  end
end
