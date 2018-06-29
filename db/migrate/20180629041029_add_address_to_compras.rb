class AddAddressToCompras < ActiveRecord::Migration[5.2]
  def change
    add_column :compras, :address, :text
  end
end
