class CreateInstallments < ActiveRecord::Migration
  def change
    create_table :installments do |t|
      t.float :amount
      t.string :installment_type
      t.text :description
      t.string :status
      t.date :installment_date
      t.integer :project_id

      t.timestamps null: false
    end
  end
end
