class Property < ApplicationRecord
	belongs_to :user
	has_many :bookings ,dependent: :delete_all

  validates :property_name, :address, presence: true
end
