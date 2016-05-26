class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :company
      t.text :description
      t.string :address
      t.string :logo
      t.string :link

      t.timestamps null: false
    end
  end
end
