class RenamePartnerToCompany < ActiveRecord::Migration
  def change
    rename_table :partners, :companies
  end
end
