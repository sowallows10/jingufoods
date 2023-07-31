class AddOriginalityToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :originality, :integer
  end
end
