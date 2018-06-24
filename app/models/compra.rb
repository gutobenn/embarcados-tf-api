class Compra < ApplicationRecord
  has_one :user
  #validates :name, :user, presence: true
  validates :name,  presence: true # TODO validaruser tb
end
