class Supplier < ApplicationRecord
  validates :name, presence: true

  belongs_to :address
end
