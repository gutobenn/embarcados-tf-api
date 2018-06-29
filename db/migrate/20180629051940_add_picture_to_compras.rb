class AddPictureToCompras < ActiveRecord::Migration[5.2]
  def change
    add_column :compras, :picture, :string
  end
end
