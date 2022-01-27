class AddDramaidToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :dramaid, :integer
  end
end
