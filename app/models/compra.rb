class Compra < ApplicationRecord
  has_one :user
  #validates :name, :user, presence: true
  validates :name, presence: true

  geocoded_by :address
  after_validation :geocode 

  mount_base64_uploader :picture, PictureUploader
end
