class Property < ApplicationRecord
	belongs_to :user
	has_many :bookings

  validates :property_name, :address, presence: true
end
