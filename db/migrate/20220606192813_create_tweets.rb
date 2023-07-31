class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.text :body
      t.string :shop
      t.string :place
      t.string :name
      t.string :price

      t.timestamps
    end
  end
end
