class ChangeDatatypeReleaseDayOfDramas < ActiveRecord::Migration[6.1]
  def change
    change_column :dramas, :release_day, :integer
  end
end
