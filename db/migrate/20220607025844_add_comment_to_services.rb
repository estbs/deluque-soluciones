class AddCommentToServices < ActiveRecord::Migration[7.0]
  def change
    add_column :services, :comment, :string
  end
end
