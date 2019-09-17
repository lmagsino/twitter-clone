class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :content
      t.string :type
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
