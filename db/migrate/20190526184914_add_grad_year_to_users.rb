class AddGradYearToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :grad_year, :integer
  end
end
