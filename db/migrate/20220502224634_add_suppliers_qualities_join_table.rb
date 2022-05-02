class AddSuppliersQualitiesJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :supplier_qualities do |t|
      t.references :supplier, null: false, foreign_key: true
      t.references :quality, null: false, foreign_key: true

      t.timestamps
    end
  end
end
