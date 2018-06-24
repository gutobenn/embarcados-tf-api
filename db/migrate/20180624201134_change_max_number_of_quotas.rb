class ChangeMaxNumberOfQuotas < ActiveRecord::Migration[5.2]
  def change
    rename_column :compras, :max_number_of_quota, :max_number_of_quotas
  end
end
