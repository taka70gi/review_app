class RemoveDramaimgFromDramas < ActiveRecord::Migration[6.1]
  def change
    remove_column :dramas, :dramaimg, :string
  end
end
