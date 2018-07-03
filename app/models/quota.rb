class Quota < ApplicationRecord
  belongs_to :compra
  belongs_to :user

  attr_accessor :user_email

  def as_json(options={})
    super(options.merge!(methods: :user_email))
  end
end
