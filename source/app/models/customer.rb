class Customer < ActiveRecord::Base
  has_many :charges
  has_one :charge, ->{ order("amount desc") }
  validates :first_name, :last_name, :email, presence: true
end
