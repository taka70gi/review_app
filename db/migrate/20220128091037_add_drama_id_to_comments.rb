class AddDramaIdToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :drama_id, :integer
  end
end
