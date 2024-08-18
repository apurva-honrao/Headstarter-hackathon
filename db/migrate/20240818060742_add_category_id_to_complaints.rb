class AddCategoryIdToComplaints < ActiveRecord::Migration[7.2]
  def change
    add_column :complaints, :category_id, :integer
  end
end
