class RemoveMaxNumberOfQuotaFromCompra < ActiveRecord::Migration[5.2]
  def change
    remove_columns :compras, :max_number_of_quota
  end
end
