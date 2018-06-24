class RemoveQuotaFromCompras < ActiveRecord::Migration[5.2]
  def change
    remove_column :compras, :quota, :integer
  end
end
