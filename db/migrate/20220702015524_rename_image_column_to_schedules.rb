class RenameImageColumnToSchedules < ActiveRecord::Migration[6.1]
  def change
    rename_column :schedules, :Image, :image
  end
end
