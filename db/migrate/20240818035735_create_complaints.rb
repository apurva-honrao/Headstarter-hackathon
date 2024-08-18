class CreateComplaints < ActiveRecord::Migration[7.2]
  def change
    create_table :complaints do |t|
      t.references :category, null: false, foreign_key: true
      t.string :username
      t.text :complaint

      t.timestamps
    end
  end
end
