class Compra < ApplicationRecord
  has_one :user
  #validates :name, :user, presence: true
  validates :name,  presence: true # TODO validaruser tb
  geocoded_by :address
  after_validation :geocode 
end
