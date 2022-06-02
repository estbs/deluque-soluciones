class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.datetime :datetime_of_service
      t.string :status

      t.timestamps
    end
  end
end
