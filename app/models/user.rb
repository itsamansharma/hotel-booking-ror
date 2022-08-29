class User < ApplicationRecord
  has_and_belongs_to_many :roles
  has_many :properties
  has_many :bookings

  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :name, :email,:account, presence: true

end
