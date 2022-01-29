class DropTableDramaComments < ActiveRecord::Migration[6.1]
  def change
    drop_table :drama_comments
  end
end
