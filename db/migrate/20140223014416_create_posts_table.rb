class CreatePostsTable < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :project
      t.string :username
      t.string :title
      t.text :content
      t.timestamps
    end
  end
end
