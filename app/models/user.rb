class User < ApplicationRecord
  has_many :quotas
  has_many :compras, through: :quotas
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable
  include DeviseTokenAuth::Concerns::User

end
