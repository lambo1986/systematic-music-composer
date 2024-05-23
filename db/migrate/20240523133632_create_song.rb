class CreateSong < ActiveRecord::Migration[7.1]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :genre
      t.string :vibe
      t.string :description
      t.integer :tempo
      t.string :form
      t.text :lyrics
      t.string :instrumentation
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
