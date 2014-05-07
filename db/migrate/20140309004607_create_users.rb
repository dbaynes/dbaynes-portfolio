class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :role, :null => false, :default => "member"
      t.string :password_digest
      #t.string :encrypted_password

      t.timestamps
    end
  end
 end
