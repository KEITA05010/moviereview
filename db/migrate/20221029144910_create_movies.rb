class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
   t.integer "genre_id"
   t.string "title"
   t.text "introduction"
   t.date "release_date"
   t.text "content"


      t.timestamps
    end
  end
end
