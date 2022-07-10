class RemoveColumnAddressIdFromServiceHistories < ActiveRecord::Migration[7.0]
  def change
    remove_column :service_histories, :address_id
  end
end
