class AddUserIdToServices < ActiveRecord::Migration[7.0]
  def change
    add_reference :services, :user, index: true, foreign_key: true
  end
end
