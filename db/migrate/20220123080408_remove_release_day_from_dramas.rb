class RemoveReleaseDayFromDramas < ActiveRecord::Migration[6.1]
  def change
    remove_column :dramas, :release_day, :date
  end
end
