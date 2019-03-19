class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :comment
      # t.references :blog, foreign_key: true
      t.integer :blog_id
      t.timestamps
    end
  end
end
