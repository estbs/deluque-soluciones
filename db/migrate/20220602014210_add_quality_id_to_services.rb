class AddQualityIdToServices < ActiveRecord::Migration[7.0]
  def change
    add_reference :services, :quality, index: true, foreign_key: true
  end
end
