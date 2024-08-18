class AddCategoryToComplaints < ActiveRecord::Migration[7.2]
  def change
    add_column :complaints, :category, :string
  end
end
