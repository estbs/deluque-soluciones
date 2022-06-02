class AddSupplierIdToServices < ActiveRecord::Migration[7.0]
  def change
    add_reference :services, :supplier, index: true, foreign_key: true
  end
end
