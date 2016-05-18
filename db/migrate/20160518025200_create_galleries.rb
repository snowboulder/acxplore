class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.integer :activity_id
      t.string :picture

      t.timestamps null: false
    end
  end
end
