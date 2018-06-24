class AddLatitudeAndLongitudeToCompras < ActiveRecord::Migration[5.2]
  def change
    add_column :compras, :latitude, :float
    add_column :compras, :longitude, :float
  end
end
