class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :title
      t.string :hard
      t.string :game_image_id
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end
end
