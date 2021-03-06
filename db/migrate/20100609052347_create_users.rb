class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :login, :null => false
      t.string :name, :null => false
      t.string :surname, :null => false
      t.string :email, :null => false
      t.string :description
      t.string :crypted_password, :null => false
      t.string :password_salt, :null => false
      t.string :persistence_token, :null => false
      t.timestamps
    end
    
    add_index :users, :login
    add_index :users, :persistence_token
  end

  def self.down
    drop_table :users
  end
end
