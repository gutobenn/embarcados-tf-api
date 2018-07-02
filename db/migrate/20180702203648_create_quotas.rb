class CreateQuotas < ActiveRecord::Migration[5.2]
  def change
    create_table :quotas do |t|
      t.integer :quantity
      t.references :compra, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
