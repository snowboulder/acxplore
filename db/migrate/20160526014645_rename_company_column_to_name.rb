class RenameCompanyColumnToName < ActiveRecord::Migration
  def change
    rename_column :companies, :company, :name
  end
end
