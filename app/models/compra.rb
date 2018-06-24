class Compra < ApplicationRecord
  validates :name, :user, presence: true
end
