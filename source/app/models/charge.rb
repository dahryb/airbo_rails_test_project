class Charge < ActiveRecord::Base
  belongs_to :customer
  validates :amount, numericality: true
  validates :customer, :amount, :currency, presence: true
  scope :failed, -> {where(paid: false, refunded: false)}
  scope :succeed, -> {where(paid: true, refunded: false)}
  scope :disputed, -> {where(paid: true, refunded: true)}
end
