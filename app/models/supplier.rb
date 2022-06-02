class Supplier < ApplicationRecord
  validates :name, presence: true

  belongs_to :address
  has_and_belongs_to_many :qualities
  has_many :services

  accepts_nested_attributes_for :address
end
