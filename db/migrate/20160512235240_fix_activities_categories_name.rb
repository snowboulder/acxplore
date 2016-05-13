class FixActivitiesCategoriesName < ActiveRecord::Migration
  def change
    rename_table :articles_categories, :activities_categories
  end
end
