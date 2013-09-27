class RemoveFieldsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :password, :string
    remove_column :users, :confirmation, :string
  end
end
