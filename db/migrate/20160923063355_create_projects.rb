class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.float :total_amount
      t.float :discount
      t.float :net_amount
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
