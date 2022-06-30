class AddServiceNumberToService < ActiveRecord::Migration[7.0]
  def change
    add_column :services, :service_number, :string, unique: true
  end
end
