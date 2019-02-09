class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :body
      t.string :tags_string

      t.timestamps
    end
  end
end
