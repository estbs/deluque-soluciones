class AddAddressIdToSuppliers < ActiveRecord::Migration[7.0]
  def change
    add_reference :suppliers, :address, index: true, foreign_key: true
  end
end
