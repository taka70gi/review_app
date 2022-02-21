class AddDramaimgToDramas < ActiveRecord::Migration[6.1]
  def change
    add_column :dramas, :dramaimg, :string
  end
end
