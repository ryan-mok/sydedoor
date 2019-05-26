class AddFacebookToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :facebook, :string
  end
end
