class Quality < ApplicationRecord
  validates :name, presence: true

  has_many :supplier_qualities, dependent: :destroy
  has_many :suppliers, through: :supplier_qualities
end
