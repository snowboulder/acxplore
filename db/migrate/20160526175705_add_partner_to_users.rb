class AddPartnerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :partner, :boolean, default: false
  end
end
