class AddStatusToCompras < ActiveRecord::Migration[5.2]
  def change
    add_column :compras, :status, :integer
  end
end
