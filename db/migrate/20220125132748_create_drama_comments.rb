class CreateDramaComments < ActiveRecord::Migration[6.1]
  def change
    create_table :drama_comments do |t|
      t.references :drama, null: false, foreign_key: true
      t.references :comment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
