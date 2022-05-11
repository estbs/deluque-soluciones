class AddAddressIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :address, index: true, foreign_key: true
  end
end
