class ChangeServiceStatusType < ActiveRecord::Migration[7.0]
  def change
    remove_column :services, :status
    add_column :services, :status, :integer
  end
end
