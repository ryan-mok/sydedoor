class AddIndexToCompanyName < ActiveRecord::Migration[5.1]
  def change
    add_index :companies, :name, unique: true
  end
end
