class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, :address, :category, presence: true
  validates :phone_number, presence: true
  validates :category, inclusion: { in: %w(chinese italian japanese french belgian), message: "Its not valid cuisine"}
end
