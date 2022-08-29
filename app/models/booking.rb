class Booking < ApplicationRecord
	belongs_to :user
	belongs_to :property

  validates :start_date, :end_date, presence: true
end
