class RenameNameColumnToTweets < ActiveRecord::Migration[6.1]
  def change
    rename_column :tweets, :name, :food
  end
end
