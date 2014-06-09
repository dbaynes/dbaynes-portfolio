class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.belongs_to :commentable, polymorphic: true
      #the above statement generates the following so they can be commented out here
          #t.integer :commentable_id
          #t.string :commentable_type   #name of class
      t.string :author
      t.string :author_url
      t.string :author_email
      t.string :user_ip
      t.string :user_agent
      t.string :referrer
      t.boolean :approved
      #t.references :post, index: true
      t.timestamps
    end
    add_index :comments, [:commentable_id,:commentable_type]
  end
end
