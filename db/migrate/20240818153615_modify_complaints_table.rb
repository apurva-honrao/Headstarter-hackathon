class ModifyComplaintsTable < ActiveRecord::Migration[7.2]
  def change
    # Remove the old field
    remove_column :complaints, :category, :string

    # Add new fields
    add_column :complaints, :product, :string
    add_column :complaints, :sub_product, :text
  end
end
