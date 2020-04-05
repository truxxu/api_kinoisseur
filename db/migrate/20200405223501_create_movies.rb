class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.float :rating
      t.string :director
      t.integer :year
      t.integer :duration
      t.text :synopsys
      t.string :url
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
