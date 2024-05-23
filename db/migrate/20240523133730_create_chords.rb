class CreateChords < ActiveRecord::Migration[7.1]
  def change
    create_table :chords do |t|
      t.string :feeling
      t.string :notes
      t.string :relationship
      t.references :song, null: false, foreign_key: true

      t.timestamps
    end
  end
end
