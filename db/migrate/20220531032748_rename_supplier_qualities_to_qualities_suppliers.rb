class RenameSupplierQualitiesToQualitiesSuppliers < ActiveRecord::Migration[7.0]
  def change
    rename_table :supplier_qualities, :qualities_suppliers
  end
end
