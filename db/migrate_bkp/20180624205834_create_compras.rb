class CreateCompras < ActiveRecord::Migration[5.2]
  def change
    create_table :compras do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.text :description
      t.datetime :end
      t.decimal :price_per_quota
      t.integer :min_number_of_quotas
      t.integer :max_number_of_quotas
      t.float :latitude
      t.float :longitude
      t.integer :status

      t.timestamps
    end
  end
end
