class AddClassificationToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :classification, :string
  end
end
