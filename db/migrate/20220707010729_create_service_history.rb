class CreateServiceHistory < ActiveRecord::Migration[7.0]
  def change
    create_table :service_histories do |t|
      t.integer :quality_id
      t.integer :service_id
      t.integer :address_id
      t.integer :supplier_id
      t.datetime :datetime_of_service
      t.integer :status
      t.text :status_update_reason
      t.string :comment

      t.timestamps
    end
  end
end
