class AddWaitToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :wait, :integer
  end
end
