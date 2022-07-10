class AddColumnsToServiceHistory < ActiveRecord::Migration[7.0]
  def change
    add_column :service_histories, :user_id, :integer
    add_column :service_histories, :service_number, :string
  end
end
