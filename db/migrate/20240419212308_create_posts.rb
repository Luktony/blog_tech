
class CreatePosts < ActiveRecord::Migration[7.1]
  # Change method to create a table for posts with title and body attributes along with timestamps.  
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
