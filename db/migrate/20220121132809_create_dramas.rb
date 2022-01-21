class CreateDramas < ActiveRecord::Migration[6.1]
  def change
    create_table :dramas do |t|
      t.string :name
      t.date :release_day
      t.string :summary
      t.string :cast

      t.timestamps
    end
  end
end
