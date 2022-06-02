class Quality < ApplicationRecord
  validates :name, presence: true

  has_and_belongs_to_many :suppliers
  has_many :services
end
