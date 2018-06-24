class CreateCompras < ActiveRecord::Migration[5.2]
  def change
    create_table :compras do |t|
      t.string :name
      t.text :description
      t.datetime :end
      t.decimal :price_per_quota
      t.integer :min_number_of_quotas
      t.integer :max_number_of_quotas
      t.integer :status
      t.integer :max_number_of_quota
      t.float :latitude
      t.float :longitude
      t.references :user

      t.timestamps
    end
  end
end
