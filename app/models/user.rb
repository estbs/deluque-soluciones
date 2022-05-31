class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates :name, :lastname, :identification_type, :identification_number, :email, presence: true

  belongs_to :address
  accepts_nested_attributes_for :address

  def with_address
    build_address if address.nil?
    self
  end
end
