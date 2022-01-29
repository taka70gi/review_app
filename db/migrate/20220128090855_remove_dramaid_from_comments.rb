class RemoveDramaidFromComments < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :dramaid, :integer
  end
end
