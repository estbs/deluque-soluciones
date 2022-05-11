class Supplier < ApplicationRecord
  validates :name, presence: true

  belongs_to :address

  has_many :supplier_qualities, dependent: :destroy
  has_many :qualities, through: :supplier_qualities

  accepts_nested_attributes_for :address
end
