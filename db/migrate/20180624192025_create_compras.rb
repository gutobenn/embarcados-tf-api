class CreateCompras < ActiveRecord::Migration[5.2]
  def change
    create_table :compras do |t|
      t.string :name
      t.integer :quota
      t.text :description
      t.datetime :end
      t.decimal :price_per_quota
      t.integer :min_number_of_quotas
      t.integer :max_number_of_quota

      t.timestamps
    end
  end
end
