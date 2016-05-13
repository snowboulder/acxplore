class ChangeColumnPicture < ActiveRecord::Migration
  def change
    rename_column Activity, :picture, :avatar
  end
end
