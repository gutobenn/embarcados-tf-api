class AddUserToCompras < ActiveRecord::Migration[5.2]
  def change
    add_reference :compras, :user, foreign_key: true
  end
end
