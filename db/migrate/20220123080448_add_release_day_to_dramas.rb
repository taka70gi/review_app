class AddReleaseDayToDramas < ActiveRecord::Migration[6.1]
  def change
    add_column :dramas, :release_day, :string
  end
end
