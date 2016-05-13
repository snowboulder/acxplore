class CreateActivityPictures < ActiveRecord::Migration
  def change
    create_table :activity_pictures do |t|
      t.integer :activity_id
      t.string :picture

      t.timestamps null: false
    end
  end
end
