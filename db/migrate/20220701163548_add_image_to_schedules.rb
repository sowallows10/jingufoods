class AddImageToSchedules < ActiveRecord::Migration[6.1]
  def change
    add_column :schedules, :Image, :string
  end
end
