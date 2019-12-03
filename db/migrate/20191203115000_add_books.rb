class AddBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name, null: false
      t.string :author, null: false
      t.string :description, default: "No Description"
    end
  end
end
